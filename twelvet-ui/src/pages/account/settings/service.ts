import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/user/profile";

export async function queryCurrent() {
    return request(`${controller}`, {
        method: 'GET',
        data: {
        },
    });
}