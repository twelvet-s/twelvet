import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/menu";

export async function list(params: { [key: string]: any }) {
    return request(`${controller}/list`, {
        method: 'GET',
        data: {
            ...params
        },
    });
}
