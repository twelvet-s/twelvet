import { stringify } from 'querystring'
import { history, Reducer, Effect } from 'umi'

import { message } from 'antd'

import { login, refreshToken } from '@/services/login'
import { setAuthority } from '@/utils/authority'
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

            // Login successfully
            if (code === 200) {
                const urlParams = new URL(window.location.href)
                const params = getPageQuery()
                let { redirect } = params as { redirect: string }
                if (redirect) {
                    const redirectUrlParams = new URL(redirect)
                    if (redirectUrlParams.origin === urlParams.origin) {
                        redirect = redirect.substr(urlParams.origin.length)
                        if (redirect.match(/^\/.*#/)) {
                            redirect = redirect.substr(redirect.indexOf('#') + 1)
                        }
                    } else {
                        window.location.href = '/'
                        return
                    }
                }
                history.replace(redirect || '/')
            }
        },
        // 刷新令牌
        *refreshToken({ payload }, { call, put }) {
            const response = yield call(refreshToken)
        },
        // 退出
        logout() {
            const { redirect } = getPageQuery()
            // Note: There may be security issues, please note
            if (window.location.pathname !== '/login' && !redirect) {
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
