import request from '@/utils/request'
import TWT from '@/setting'

const api = '/auth'

export interface LoginParamsType {
    userName: string
    password: string
    mobile: string
    captcha: string
}

/**
 * 登录
 * @param params 登录参数
 */
export async function login(params: { [key: string]: string | number }) {

    return request(`${api}/oauth/token`, {
        method: 'POST',
        params: {
            ...params,
            grant_type: 'password',
            scope: 'server',
            client_id: 'twelvet',
            client_secret: '123456'
        },
        data: {
            ...params,
            grant_type: 'password',
            scope: 'server',
            client_id: 'twelvet',
            client_secret: '123456'
        }
    })
}

/**
 * 刷新令牌
 * @param params 登录参数
 */
export async function refreshToken() {

    return request(`${api}/oauth/token`, {
        method: 'POST',
        params: {
            refresh_token: localStorage.getItem(TWT.refreshToken),
            grant_type: 'refresh_token',
            scope: 'server',
            client_id: 'twelvet',
            client_secret: '123456'
        }
    })
}

export async function getFakeCaptcha(mobile: string) {
    return request(`/api/login/captcha?mobile=${mobile}`)
}
