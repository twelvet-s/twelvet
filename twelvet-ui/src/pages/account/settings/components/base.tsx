import React, { Component } from 'react'
import { Button, Input, Form, message } from 'antd'
import { connect, FormattedMessage, formatMessage } from 'umi'

import { CurrentUser } from '../data.d'
import styles from './BaseView.less'

// 图片剪辑样式
import 'antd/es/modal/style';
import 'antd/es/slider/style';
import Upload from '@/components/TwelveT/Upload'



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
            <div className={styles.baseView} ref={this.getViewDom}>
                <div className={styles.left}>
                    <Form
                        layout="vertical"
                        onFinish={this.handleFinish}
                        initialValues={currentUser}
                        hideRequiredMark
                    >
                        <Form.Item
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
                </div>
                <div className={styles.right}>
                    <Form
                        layout='horizontal'
                        initialValues={currentUser}
                    >
                        <Form.Item
                            {...layout}
                            name="avatar"
                            label={formatMessage({ id: 'accountandsettings.basic.avatar' })}
                        >
                            <Upload
                                name='avatarFile'
                                // 开启图片剪裁
                                imgCrop={true}
                                title='用户头像'
                                maxCount={1}
                                action={`/system/user/profile/avatar`}
                            >
                            </Upload>
                        </Form.Item>
                    </Form>
                </div>
            </div>
        )
    }
}

export default connect(
    ({ accountAndsettings }: { accountAndsettings: { currentUser: CurrentUser } }) => ({
        currentUser: accountAndsettings.currentUser,
    }),
)(BaseView)
