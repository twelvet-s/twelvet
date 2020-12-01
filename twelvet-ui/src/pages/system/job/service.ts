import request, { download } from '@/utils/request'

// 请求的控制器名称
const controller = "/job/cron";

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
 * 根据ID获取任务信息
 * @param params 搜索参数
 */
export async function run(params: { [key: string]: any }) {
    return request(`${controller}/run`, {
        method: 'PUT',
        data: {
            ...params
        }
    });
}

/**
 * 根据ID获取任务信息
 * @param params 搜索参数
 */
export async function getByJobId(jobId: number) {
    return request(`${controller}/${jobId}`, {
        method: 'GET',
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

/**
 * 导出Excel
 * @param params
 */
export async function exportExcel(params?: { [key: string]: any }) {
    return download(`${controller}/export`, params);
}

/**
 * 更改状态
 * @param params
 */
export async function changeStatus(params?: { [key: string]: any }) {
    return request(`${controller}/changeStatus`, {
        method: 'PUT',
        data: {
            ...params
        }
    })
}

/**
 * 更改状态
 * @param params
 */
export async function insert(params?: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'POST',
        data: {
            ...params
        }
    })
}

/**
 * 更改状态
 * @param params
 */
export async function update(params?: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'PUT',
        data: {
            ...params
        }
    })
}