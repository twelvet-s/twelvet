import { reloadAuthorized } from './Authorized';
import TWT from '@/setting';

// use localStorage to store the authority info, which might be sent from server in actual project.
export function getAuthority(str?: string): string | string[] {
    const authorityString =
        typeof str === 'undefined' && localStorage ? localStorage.getItem('antd-pro-authority') : str;
    // authorityString could be admin, "admin", ["admin"]
    let authority;
    try {
        if (authorityString) {
            authority = JSON.parse(authorityString);
        }
    } catch (e) {
        authority = authorityString;
    }
    if (typeof authority === 'string') {
        return [authority];
    }
    // preview.pro.ant.design only do not use in your production.
    // preview.pro.ant.design 专用环境变量，请不要在你的项目中使用它。
    if (!authority && ANT_DESIGN_PRO_ONLY_DO_NOT_USE_IN_YOUR_PRODUCTION === 'site') {
        return ['admin'];
    }
    return authority;
}

/**
 * 设置授权令牌
 * @param authority 
 */
export function setAuthority(authority: { [key: string]: any }): void {
    const date = new Date()

    // 设置access_token
    localStorage.setItem(TWT.accessToken, JSON.stringify({access_token: authority.access_token, expires_in: date.getTime() + authority.expires_in}));
    // 设置refresh_token
    localStorage.setItem(TWT.refreshToken, authority.refresh_token)
    // auto reload
    reloadAuthorized();
}

/**
 * 移除授权令牌
 */
export function removeAuthority() {
    // 设置access_token
    localStorage.removeItem(TWT.accessToken);
    // 设置refresh_token
    localStorage.removeItem(TWT.refreshToken);
    // auto reload
    reloadAuthorized();
}