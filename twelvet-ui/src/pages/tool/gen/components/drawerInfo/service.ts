import request from '@/utils/request'

// 请求的控制器名称
const controller = "/gen";

/**
 * 获取分页 Data
 * @param params 搜索参数
 */
export async function pageQuery(params: { [key: string]: any }) {
    return request(`${controller}/db/list`, {
        method: 'GET',
        data: {
            ...params
        },
    });
}

/**
 * 导入数据 Data
 * @param params 数据ID
 */
 export async function importTable(selectedRowKeys: number[] | undefined) {
    return request(`${controller}/importTable?tables=${selectedRowKeys}`, {
        method: 'POST',
    });
}