import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/user/profile";

/**
 * 获取用户信息
 */
export async function queryCurrent() {
    return request(`${controller}`, {
        method: 'GET',
        data: {
        },
    });
}

// 更新用户头像API
export const updateAvatar = `${controller}/avatar`;

/**
 * 修改用户信息
 * @param params 需要修改的用户参数 
 */
export async function update(params: {}) {
    return request(`${controller}`, {
        method: 'PUT',
        data: {
            ...params
        },
    });
}