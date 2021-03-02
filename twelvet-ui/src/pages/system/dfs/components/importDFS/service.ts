
import { upload } from '@/utils/request'

// 请求的控制器名称
const controller = "/dfs"

/**
 * 上传数据
 * @param params
 */
export async function uploadFile(formData: FormData) {
    return upload(`${controller}/batchUpload`, formData);
}