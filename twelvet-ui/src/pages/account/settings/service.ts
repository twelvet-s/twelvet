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

export async function queryProvince() {
    return request('/api/geographic/province');
}

export async function queryCity(province: string) {
    return request(`/api/geographic/city/${province}`);
}

export async function query() {
    return request('/api/users');
}