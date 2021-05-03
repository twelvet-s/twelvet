import request, { download } from '@/utils/request'

// 请求的控制器名称
const controller = "/dfs";

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
 * 删除数据
 * @param params 删除id [1,2,3]
 */
export async function remove(fileIds: string) {
    return request(`${controller}/${fileIds}`, {
        method: 'DELETE',
    });
}

/**
 * 下载文件
 * @param fileId 文件id
 */
export async function downloadFile(fileId: string) {
    return download(`${controller}/download/${fileId}`);
}