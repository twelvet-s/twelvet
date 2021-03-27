import request from '@/utils/request'

// 请求的控制器名称
const controller = "/gen";

/**
 * 获取数据信息
 * @param tableId 搜索参数
 */
export async function getInfo(tableId: number) {
    return request(`${controller}/${tableId}`, {
        method: 'GET',
    });
}

/**
 * 获取所有菜单
 * @returns 
 */
export async function getMenus() {
    return request(`/system/menu/list`, {
        method: 'GET',
    });
}

/**
 * 获取字典数据
 * @returns 
 */
export async function getOptionselect() {
    return request(`/system/dictionaries/type/optionSelect`, {
        method: 'GET',
    });
}

/**
 * 保存数据
 * @returns 
 */
export async function putGen(params: {}) {
    return request(`${controller}`, {
        method: 'PUT',
        data: params
    });
}