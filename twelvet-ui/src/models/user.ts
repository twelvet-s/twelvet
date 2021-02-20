import { Effect, Reducer } from 'umi'

import { queryCurrent, query as queryUsers, currentUser, refreshTokenService } from '@/services/user'
import { MenuDataItem } from '@ant-design/pro-layout'
import { setAuthority } from '@/utils/authority'
import { logout } from '@/utils/twelvet'
import request from '@/utils/request'
import { notification } from 'antd'

export interface CurrentUser {
    sysUser?: {
        username?: string
        nickName?: string
        avatar?: string
        email?: string
        phonenumber?: number
        sex?: number
    }
    menuData: {
        data: MenuDataItem[]
        loading: boolean
    }
    role?: Array<{ [key: string]: string }>
    permissions?: Array<{ [key: string]: string }>

}

export interface UserModelState {
    currentUser?: CurrentUser
}

export interface UserModelType {
    namespace: 'user'
    state: UserModelState
    effects: {
        fetch: Effect
        fetchCurrent: Effect
        getCurrentUser: Effect
        refreshToken: Effect
    }
    reducers: {
        setCurrentUser: Reducer<UserModelState>
        setRefresh: Reducer<UserModelState>


        saveCurrentUser: Reducer<UserModelState>
        changeNotifyCount: Reducer<UserModelState>
    }
}

const UserModel: UserModelType = {
    namespace: 'user',

    state: {
        currentUser: {
            menuData: {
                data: [],
                loading: true
            }
        },
        // 用户令牌是否正处于刷新状态
        isRefresh: true
    },

    effects: {
        /**
         * 
         * @param _ 获取当前登录用户的信息
         * @param param1 
         */
        *getCurrentUser(_, { call, put }) {
            const { user, menus, role, permissions } = yield call(currentUser)
            yield put({
                type: 'setCurrentUser',
                payload: {
                    user,
                    menus,
                    role,
                    permissions
                },
            })
        },

        *refreshToken({ payload }, { call, put, select }) {
            const { params, method, requestPath, responseType } = payload

            let response

            const isRefresh = yield select((state: { num: any }) => state.isRefresh)

            // 判断是否正在刷新
            if (!isRefresh) {

                // 开启禁止刷新
                yield put({
                    type: 'setRefresh',
                    payload: {
                        isRefresh: true
                    },
                })

                // 续签失败将要求重新登录
                const res = yield call(refreshTokenService)

                if (res.code != 200) {
                    notification.error({
                        message: `续签失败`,
                        description: `续签失败,请重新登录`,
                    })
                    return logout()
                }

                setAuthority(res)

                // 重新请求本次数据
                if (requestPath) {
                    yield request(requestPath, {
                        method: method,
                        responseType: responseType === 'blob' ? 'blob' : 'json',
                        // 禁止自动序列化response
                        parseResponse: false,
                        data: {
                            ...params
                        }
                    }).then((res) => {
                        response = res
                    })
                }

                // 关闭禁止刷新
                yield put({
                    type: 'setRefresh',
                    payload: {
                        isRefresh: true
                    },
                })

                // 返回响应
                return response
            }

        },

        *fetch(_, { call, put }) {
            const response = yield call(queryUsers)
            yield put({
                type: 'save',
                payload: response,
            })
        },
        *fetchCurrent(_, { call, put }) {
            const response = yield call(queryCurrent)
            yield put({
                type: 'saveCurrentUser',
                payload: response,
            })
        },
    },

    reducers: {
        /**
         * 设置当前用户信息
         * @param state 
         * @param action 
         */
        setCurrentUser(state, action) {
            return {
                ...state,
                currentUser: {
                    sysUser: {
                        ...action.payload.user || {}
                    },
                    menuData: {
                        data: [
                            ...action.payload.menus || [],
                        ],
                        loading: false
                    },
                    role: action.payload.role || [],
                    permissions: action.payload.permissions || []
                }


            }
        },

        /**
         * 设置刷新的令牌
         * @param state 
         * @param action 
         */
        setRefresh(state, action) {
            return {
                ...state,
                isRefresh: action.payload.isRefresh
            }
        },

        saveCurrentUser(state, action) {
            return {
                ...state,
            }
        },
        changeNotifyCount(
            state = {
                currentUser: {},
            },
            action,
        ) {
            return {
                ...state,
                currentUser: {
                    ...state.currentUser,
                    notifyCount: action.payload.totalCount,
                    unreadCount: action.payload.unreadCount,
                },
            }
        },
    },
}

export default UserModel
