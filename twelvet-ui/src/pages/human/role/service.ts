import request, { download } from '@/utils/request'

// 请求的控制器名称
const controller = "/system/role";

/**
 * 新增角色
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
 * @param postId 角色ID 
 */
export async function remove(postIds: (string | number)[] | string) {
    return request(`${controller}/${postIds}`, {
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
 * 获取指定角色信息
 * @param params 搜索参数
 */
export async function getByroleId(postId: number) {
    return request(`${controller}/${postId}`, {
        method: 'GET'
    });
}

/**
 * 获取菜单树根据ID
 * @param params 搜索参数
 */
export async function roleMenuTreeSelectByMenuId(postId: number) {
    return request(`/system/menu/roleMenuTreeSelect/${postId}`, {
        method: 'GET'
    });
}

/**
 * 获取菜单树
 * @param params 搜索参数
 */
export async function roleMenuTreeSelect() {
    return request(`/system/menu/treeSelect`, {
        method: 'GET'
    });
}

/**
 * 获取部门树ID
 * @param params 搜索参数
 */
export async function roleDeptTreeSelectByDeptId(postId: number) {
    return request(`/system/dept/roleDeptTreeSelect/${postId}`, {
        method: 'GET'
    });
}

/**
 * 获取部门树
 * @param params 搜索参数
 */
export async function roleDeptTreeSelect() {
    return request(`/system/dept/treeSelect`, {
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