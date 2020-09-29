import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/menu";

/**
 * 获取菜单List Data
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
 * 根据菜单ID获取信息
 * @param menuId 菜单ID 
 */
export async function getInfo(menuId: number) {
    return request(`${controller}/${menuId}`, {
        method: 'GET',
    });
}