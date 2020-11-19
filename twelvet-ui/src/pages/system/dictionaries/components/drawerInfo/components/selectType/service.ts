import request from '@/utils/request'

// 请求的控制器名称
const controller = "/system/dictionaries/type";

/**
 * 获取指定字典信息
 * @param params 搜索参数
 */
export async function optionSelect() {
    return request(`${controller}/optionSelect`, {
        method: 'GET'
    });
}