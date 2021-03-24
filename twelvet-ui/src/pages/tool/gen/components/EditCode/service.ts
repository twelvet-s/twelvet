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