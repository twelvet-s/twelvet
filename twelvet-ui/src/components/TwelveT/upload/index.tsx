import React, { Component } from 'react'
import { Modal, Upload } from 'antd'
import { TUploadType } from './data'
import TWT from '@/setting'


class TUpload extends Component<TUploadType> {

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
    handleChange = ({ fileList }) => {
        this.setState({ fileList })
    }

    render() {

        const { previewVisible, previewImage, fileList } = this.state;

        const { maxCount, action, listType, title, name } = this.props

        return (
            <>
                <Upload
                    headers={{
                        Authorization: `Bearer ${localStorage.getItem(TWT.accessToken)}`
                    }}
                    method='POST'
                    name={name ? name : 'file'}
                    fileList={fileList}
                    onChange={this.handleChange}
                    // 最大上传数量
                    maxCount={maxCount}
                    listType={listType ? listType : 'picture-card'}
                    action={`${TWT.action}${action}`}
                    // 查看触发
                    onPreview={this.handlePreview}
                    onChange={this.handleChange}
                >
                    {/* 小于可上数显示上传按钮 */}
                    {fileList.length < maxCount && (title ? title : 'upload')}
                </Upload>

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

export default TUpload