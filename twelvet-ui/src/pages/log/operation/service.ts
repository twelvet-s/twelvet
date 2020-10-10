import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/loginInfo";

/**
 * 获取分页 Data
 * @param params 搜索参数
 */
export async function pageQuery(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'GET',
        data: {
            ...params
        },
    });
}

/**
 * 删除数据
 * @param params 删除id [1,2,3]
 */
export async function remove(infoIds: string) {
    return request(`${controller}/${infoIds}`, {
        method: 'DELETE',
    });
}