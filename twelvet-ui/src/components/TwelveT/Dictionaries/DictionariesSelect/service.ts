import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/dictionaries/data/type";

/**
 * 根据字典获取信息
 * @param params 搜索参数
 */
export async function getDictionariesType(type: string) {
    return request(`${controller}/${type}`, {
        method: 'GET'
    });
}