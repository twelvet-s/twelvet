import request, { download, upload } from '@/utils/request'

// 请求的控制器名称
const controller = "/system/user";

/**
 * 新增职员
 * @param params 搜索参数
 */
export async function insert(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'POST',
        data: {
            ...params
        },
    });
}

/**
 * 删除
 * @param userId 职员ID 
 */
export async function remove(userIds: (string | number)[] | string) {
    return request(`${controller}/${userIds}`, {
        method: 'DELETE',
    });
}

/**
 * 修改菜单
 * @param params 搜索参数
 */
export async function update(params: { [key: string]: any }) {
    return request(`${controller}`, {
        method: 'PUT',
        data: {
            ...params
        },
    });
}

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
 * 
 * @param params 
 */
export async function changeStatus(params: { [key: string]: any }) {
    return request(`${controller}/changeStatus`, {
        method: 'PUT',
        data: {
            ...params
        },
    });
}

/**
 * 获取指定职员信息
 * @param params 搜索参数
 */
export async function getByStaffId(userId: number) {
    return request(`${controller}/${userId}`, {
        method: 'GET'
    });
}

/**
 * 获取职员新增所属信息
 * @param userId 
 */
export async function getByStaff() {
    return request(`${controller}/`, {
        method: 'GET'
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
 * 获取部门树
 * @param params 搜索参数
 */
export async function treeSelect() {
    return request(`/system/dept/treeSelect`, {
        method: 'GET'
    });
}

/**
 * 下载模板
 * @param params
 */
export async function exportTemplate(params?: { [key: string]: any }) {
    return download(`${controller}/exportTemplate`, params);
}

/**
 * 上传数据
 * @param params
 */
export async function importData(formData: FormData) {
    return upload(`${controller}/importData`, formData);
}