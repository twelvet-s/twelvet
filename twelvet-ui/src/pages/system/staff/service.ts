import request from '@/utils/request'

// 请求的控制器名称
const controller = "/user/goods";

export async function pageQuery(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'GET',
        data: params,
    });
}
