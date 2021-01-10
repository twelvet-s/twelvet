import request from '@/utils/request'
import TWT from '../setting'

const api = '/system'

/**
 * 获取当前用户登录信息
 */
export async function currentUser(): Promise<any> {
    return request(`${api}/user/getInfo`, {
        method: 'GET'
    })
}

export async function query(): Promise<any> {
    return request('/api/users');
}

export async function queryCurrent(): Promise<any> {
    return request('/api/currentUser');
}

export async function queryNotices(): Promise<any> {
    return request('/api/notices');
}

export async function refreshTokenService(): Promise<any> {
    return request(`/auth/oauth/token`, {
        method: `POST`,
        params: {
            grant_type: `refresh_token`,
            refresh_token: localStorage.getItem(TWT.refreshToken),
            client_id: `twelvet`,
            client_secret: `123456`
        }
    });
}