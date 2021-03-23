import request, { download } from '@/utils/request'

// 请求的控制器名称
const controller = "/gen";

/**
 * 获取数据信息
 * @param tableId
 */
export async function getInfo(tableId: number) {
    return request(`${controller}/preview/${tableId}`, {
        method: 'GET',
    });
}