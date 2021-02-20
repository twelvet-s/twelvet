import React, { Component } from 'react';

import { Form, Input, Modal } from 'antd';

const layout = {
    labelCol: { span: 4 },
    wrapperCol: { span: 18 },
}

/**
 * 修改用户密码组件
 */
class Password extends Component {

    state = {
        loadingModal: false,
        modal: {
            title: '',
            visible: true
        }
    }

    /**
     * 取消Modal的显示
     */
    handleCancel = () => {
        this.setState({
            modal: { title: "", visible: false }
        })
    }

    render() {
        const { modal, loadingModal } = this.state
        return (
            <Modal
                title={`修改密码`}
                visible={modal.visible}
                okText={`修改`}
                confirmLoading={loadingModal}
                onCancel={this.handleCancel}
            >

                <Form>

                    <Form.Item
                        {...layout}
                        rules={[{ required: true, message: '旧密码不能为空' }]}
                        label="旧密码"
                        name="oldPassword"
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...layout}
                        rules={[{ required: true, message: '新密码不能为空' }]}
                        label="新密码"
                        name="newPassword"
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...layout}
                        rules={[{ required: true, message: '确认密码不能为空' }]}
                        label="确认密码"
                        name="confirmPassword"
                    >
                        <Input />
                    </Form.Item>

                </Form>

            </Modal>
        )
    }
}

export default Password