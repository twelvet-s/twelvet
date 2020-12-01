import request, { download } from '@/utils/request'

// 请求的控制器名称
const controller = "/system/post";

/**
 * 新增岗位
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
 * @param postId 岗位ID 
 */
export async function remove(postIds: (string | number)[] | string) {
    return request(`${controller}/${postIds}`, {
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
 * 获取指定岗位信息
 * @param params 搜索参数
 */
export async function getByPostId(postId: number) {
    return request(`${controller}/${postId}`, {
        method: 'GET'
    });
}

/**
 * 导出Excel
 * @param params
 */
export async function exportExcel(params?: { [key: string]: any }) {
    return download(`${controller}/export`, params);
}