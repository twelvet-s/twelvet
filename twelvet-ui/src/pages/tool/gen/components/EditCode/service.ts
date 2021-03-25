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
 * 获取操作表
 * @returns 
 */
export async function getOptionselect() {
    return request(`/system/dict/type/optionselect`, {
        method: 'GET',
    });
}