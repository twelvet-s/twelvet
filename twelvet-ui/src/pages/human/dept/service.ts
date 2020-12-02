import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/dept";

/**
 * 新增部门
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
 * 删除部门
 * @param menuId 部门ID 
 */
export async function remove(menuId: number) {
    return request(`${controller}/${menuId}`, {
        method: 'DELETE',
    });
}

/**
 * 修改部门
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
 * 获取部门List Data
 * @param params 搜索参数
 */
export async function list(params: { [key: string]: any }) {
    return request(`${controller}/list`, {
        method: 'GET',
        data: {
            ...params
        },
    });
}

/**
 * 根据部门ID获取信息
 * @param menuId 部门ID 
 */
export async function getInfo(menuId: number) {
    return request(`${controller}/${menuId}`, {
        method: 'GET',
    });
}
