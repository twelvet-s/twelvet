import React, { Component } from 'react'
import { message, Modal, Upload as UploadAntd } from 'antd'
import { UploadType } from './data'
import TWT from '@/setting'
import { UploadChangeParam } from 'antd/lib/upload'
import { UploadFile } from 'antd/lib/upload/interface'
import { getDvaApp } from 'umi'

// 需要antd样式支持
import ImgCrop from 'antd-img-crop'
import 'antd/es/modal/style';
import 'antd/es/slider/style';

/**
 * 图片上传组件
 */
class Upload extends Component<UploadType> {

    state = {
        previewImage: '',
        previewVisible: false,
        fileList: []
    }

    componentDidMount() {
        const { value } = this.props
        if (value) {
            this.setState({
                fileList: [
                    {
                        uid: '-1',
                        name: value,
                        status: 'done',
                        url: value,
                    },
                ]
            })
        }

    }

    /**
     * 获取图片流
     * @param file 
     */
    getBase64 = (file) => {
        return new Promise((resolve, reject) => {
            const reader = new FileReader()
            reader.readAsDataURL(file);
            reader.onload = () => resolve(reader.result);
            reader.onerror = error => reject(error);
        });
    }

    /**
     * 查看图片详情
     * @param file 
     */
    handlePreview = async file => {
        if (!file.url && !file.preview) {
            file.preview = await this.getBase64(file.originFileObj);
        }

        this.setState({
            previewImage: file.url || file.preview,
            previewVisible: true,
            previewTitle: file.name || file.url.substring(file.url.lastIndexOf('/') + 1),
        });
    };

    /**
     * 上传后
     * @param param
     */
    handleChange = async ({ fileList }: UploadChangeParam) => {
        // 获取最后一张图片
        const file: Array<UploadFile> = fileList.slice(-1)

        if (file.length > 0 && file[0].response) {

            const uploadFile: UploadFile = file[0]
            const { code, msg } = uploadFile.response

            // 续签失败将要求重新登录
            if (code == 401) {
                await getDvaApp()._store.dispatch({
                    type: 'user/refreshToken',
                    payload: {}
                })
            }

            if (code === 200) {
                message.success(msg)
            } else {
                fileList.map(f => {
                    if (f.uid != uploadFile.uid) {
                        return f
                    }
                    // 将状态改为错误
                    f.status = 'error'
                    return f
                })
                message.error(msg)
            }
        }
        this.setState({ fileList })
    }

    render() {

        const { previewVisible, previewImage, fileList } = this.state;

        const { maxCount, action, listType, title, name, accept, imgCrop = false } = this.props

        const upload = (
            <UploadAntd
                headers={{
                    Authorization: `Bearer ${localStorage.getItem(TWT.accessToken)}`
                }}
                accept={accept}
                method='POST'
                name={name ? name : 'file'}
                fileList={fileList}
                // 最大上传数量
                maxCount={maxCount}
                listType={listType ? listType : 'picture-card'}
                action={`${TWT.action}${action}`}
                // 查看触发
                onPreview={this.handlePreview}
                // 处理文件上传完成后
                onChange={this.handleChange}
            >
                {/* 小于可上数显示上传按钮 */}
                {fileList.length < maxCount && (title ? title : 'upload')}
            </UploadAntd>
        )

        return (
            <>
                {
                    imgCrop && (
                        <ImgCrop {...{
                            modalTitle: `剪裁`,
                            rotate: true,
                            grid: true
                        }}>
                            {upload}
                        </ImgCrop>
                    )
                }

                {
                    !imgCrop && (
                        upload
                    )
                }

                <Modal
                    visible={previewVisible}
                    title={'详情'}
                    footer={null}
                    onCancel={() => {
                        this.setState({ previewVisible: false })
                    }}
                >
                    <img alt="example" style={{ width: '100%' }} src={previewImage} />
                </Modal>
            </>
        )
    }

}

export default Upload