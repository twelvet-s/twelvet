import React, { Component } from 'react'
import { Button, Input, Form, message } from 'antd'
import { connect, FormattedMessage, formatMessage } from 'umi'

import { CurrentUser } from '../data.d'
import styles from './BaseView.less'

// 图片剪辑样式
import 'antd/es/modal/style';
import 'antd/es/slider/style';
import TUpload from '@/components/TwelveT/upload'



interface BaseViewProps {
    currentUser?: CurrentUser
}

const layout = {
    labelCol: { span: 2 },
    wrapperCol: { span: 6 },
}

class BaseView extends Component<BaseViewProps> {

    view: HTMLDivElement | undefined = undefined


    getViewDom = (ref: HTMLDivElement) => {
        this.view = ref
    }

    /**
     * 保存信息
     * @param value 
     */
    handleFinish = (value: any) => {
        console.log(value)
        message.success(formatMessage({ id: 'accountandsettings.basic.update.success' }))
    }

    render() {
        const { currentUser } = this.props
        return (
            <Form
                layout='horizontal'
                onFinish={this.handleFinish}
                initialValues={currentUser}
                hideRequiredMark
            >

                <Form.Item
                    {...layout}
                    name="avatar"
                    label={formatMessage({ id: 'accountandsettings.basic.avatar' })}
                >
                    <TUpload
                        name='avatarFile'
                        title='用户头像'
                        maxCount={1}
                        action={`/system/user/profile/avatar`}
                    >
                    </TUpload>
                </Form.Item>

                <Form.Item
                    {...layout}
                    name="nickName"
                    label={formatMessage({ id: 'accountandsettings.basic.nickname' })}
                    rules={[
                        {
                            required: true,
                            message: formatMessage({ id: 'accountandsettings.basic.nickname-message' }, {}),
                        },
                    ]}
                >
                    <Input />
                </Form.Item>

                <Form.Item>
                    <Button htmlType="submit" type="primary">
                        <FormattedMessage
                            id="accountandsettings.basic.update"
                            defaultMessage="Update Information"
                        />
                    </Button>
                </Form.Item>
            </Form>
        )
    }
}

export default connect(
    ({ accountAndsettings }: { accountAndsettings: { currentUser: CurrentUser } }) => ({
        currentUser: accountAndsettings.currentUser,
    }),
)(BaseView)
