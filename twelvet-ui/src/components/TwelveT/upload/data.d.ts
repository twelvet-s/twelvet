export interface UploadType {
    value?: any
    name?: string
    title?: string
    maxCount: number
    action: string
    listType?: 'picture-card' | 'picture'
    // 是否需要图片剪裁
    imgCrop?: boolean
    // 支持上传的文件
    accept?: string
}