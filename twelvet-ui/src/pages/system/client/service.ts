import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/client";

/**
 * 新增终端
 * @param params 搜索参数
 */
export async function insert(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'POST',
        data: {
            ...params
        },
    });
}

/**
 * 删除
 * @param clinet 终端ID 
 */
export async function remove(clinets: (string | number)[] | string) {
    return request(`${controller}/${clinets}`, {
        method: 'DELETE',
    });
}

/**
 * 修改菜单
 * @param params 搜索参数
 */
export async function update(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'PUT',
        data: {
            ...params
        },
    });
}

/**
 * 获取分页 Data
 * @param params 搜索参数
 */
export async function pageQuery(params: { [key: string]: any }) {
    return request(`${controller}/pageQuery`, {
        method: 'GET',
        data: {
            ...params
        },
    });
}

/**
 * 获取指定终端信息
 * @param params 搜索参数
 */
export async function getByClientId(clinet: number) {
    return request(`${controller}/${clinet}`, {
        method: 'GET'
    });
}