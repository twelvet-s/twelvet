export interface UploadType {
    onChange?: any
    value?: any
    name?: string
    title?: any
    maxCount: number
    action: string
    listType?: 'picture-card' | 'picture'
    // 是否需要图片剪裁
    imgCrop?: boolean
    // 支持上传的文件
    accept?: string
    success?: () => void
}