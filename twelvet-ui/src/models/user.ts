import { Effect, Reducer } from 'umi'

import { queryCurrent, query as queryUsers, currentUser } from '@/services/user'
import { MenuDataItem } from '@ant-design/pro-layout'

export interface CurrentUser {
    sysUser?: {
        username?: string
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
    }
    reducers: {
        setCurrentUser: Reducer<UserModelState>
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
                        ...action.payload.sysUser || {}
                    },
                    menuData: {
                        data: [
                            ...action.payload.menus || [],
                        ],
                        loading: false
                    },
                    role: action.payload.role || [],
                    permissions: action.payload.permissions || [],
                }

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
