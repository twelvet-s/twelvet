import { stringify } from 'querystring'
import { history, Reducer, Effect } from 'umi'

import { message } from 'antd'

import { login } from '@/services/login'
import { removeAuthority, setAuthority } from '@/utils/authority'
import { getPageQuery, } from '@/utils/utils'

export interface StateType {
    accessToken?: string
    refreshToken?: string
    type?: string
    currentAuthority?: 'user' | 'guest' | 'admin'
}

export interface LoginModelType {
    namespace: string
    state: StateType
    effects: {
        login: Effect
        refreshToken: Effect
        logout: Effect
    }
    reducers: {

        changeLoginStatus: Reducer<StateType>
    }
}

const LoginModel: LoginModelType = {
    namespace: 'login',

    state: {
        accessToken: undefined,
        refreshToken: undefined
    },

    effects: {
        // 登录
        *login({ payload }, { call, put }) {
            const response = yield call(login, payload)
            const { code, msg } = response

            // 请求错误立即返回
            if (code != 200) {
                return message.error(msg)
            }
            yield put({
                type: 'changeLoginStatus',
                payload: response,
            })
            // 跳转至首页，不使用路由跳转，避免数据获取异常
            window.location.href = '/'
        },
        // 退出
        logout() {
            const { redirect } = getPageQuery()
            // Note: There may be security issues, please note
            if (window.location.pathname !== '/login' && !redirect) {
                // 移除令牌
                removeAuthority()

                history.replace({
                    pathname: '/login',
                    search: stringify({
                        redirect: window.location.href,
                    }),
                })
            }
        },
    },

    reducers: {
        // 执行登录成功操作
        changeLoginStatus(state, { payload }) {
            setAuthority(payload)
            return {
                ...state,
                accessToken: payload.access_token,
                refreshToken: payload.refresh_token,
            }
        },
    },
}

export default LoginModel
