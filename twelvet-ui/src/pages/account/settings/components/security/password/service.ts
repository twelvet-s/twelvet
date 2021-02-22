import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/user/profile";

/**
 * 修改用户密码
 * @param params 参数 
 */
export async function updatePwd(params: {}) {
    return request(`${controller}/updatePwd`, {
        method: 'PUT',
        data: {
            ...params
        },
    });
}