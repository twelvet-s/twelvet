import React, { Component } from 'react';

import { Form, FormInstance, Input, message, Modal } from 'antd';
import { EmailType } from './data';
import { system } from '@/utils/twelvet';
import { updatePwd } from './service';

const layout = {
    labelCol: { span: 4 },
    wrapperCol: { span: 18 },
}

/**
 * 修改用户邮箱组件
 */
class Email extends Component<EmailType> {

    state = {
        loadingModal: false
    }

    formRef = React.createRef<FormInstance>();

    /**
     * 保存数据
     */
    onSave = () => {
        this.formRef.current?.validateFields()
            .then(
                async (fields) => {
                    try {
                        // 开启加载中
                        this.setState({
                            loadingModal: true
                        })

                        const { code, msg } = await updatePwd(fields)

                        if (code != 200) {
                            return message.error(msg)
                        }

                        message.success(msg)

                        // 关闭模态框
                        this.handleCancel()

                    } catch (e) {
                        system.error(e)
                    } finally {
                        this.setState({
                            loadingModal: false
                        })
                    }
                }
            ).catch(e => {
                system.error(e)
            })
    }

    /**
     * 关闭莫泰框
     */
    handleCancel = () => {
        this.formRef.current?.resetFields()
        this.props.onCancel()
    }

    render() {
        const { passwordModal } = this.props

        const { loadingModal } = this.state

        return (
            <Modal
                title={`修改邮箱`}
                visible={passwordModal}
                okText={`修改`}
                confirmLoading={loadingModal}
                onOk={this.onSave}
                onCancel={this.handleCancel}
            >

                <Form
                    // 用于获取数据 
                    ref={this.formRef}
                >

                    敬请期待

                </Form>

            </Modal>
        )
    }
}

export default Email