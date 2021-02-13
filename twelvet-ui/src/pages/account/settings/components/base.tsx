import { UploadOutlined } from '@ant-design/icons'
import { Button, Input, Upload, Form, message } from 'antd'
import { connect, FormattedMessage, formatMessage } from 'umi'
import React, { Component } from 'react'

import { CurrentUser } from '../data.d'
import styles from './BaseView.less'
import TWT from '@/setting'
import ImgCrop from 'antd-img-crop'


// 头像组件 方便以后独立，增加裁剪之类的功能
const AvatarView = ({ avatar }: { avatar: string }) => (
    <>
        <div className={styles.avatar_title}>
            <FormattedMessage id="accountandsettings.basic.avatar" defaultMessage="Avatar" />
        </div>
        <div className={styles.avatar}>
            <img src={avatar} alt="avatar" />
        </div>
            <Upload
                name='avatarFile'
                headers={{
                    Authorization: `Bearer ${localStorage.getItem(TWT.accessToken)}`
                }}
                action='/api/system/user/profile/avatar'
                showUploadList={false}
            >
                <div className={styles.button_view}>
                    <Button>
                        <UploadOutlined />
                        <FormattedMessage
                            id="accountandsettings.basic.change-avatar"
                            defaultMessage="Change avatar"
                        />
                    </Button>
                </div>
            </Upload>
    </>
)

interface BaseViewProps {
    currentUser?: CurrentUser
}

class BaseView extends Component<BaseViewProps> {
    view: HTMLDivElement | undefined = undefined

    getAvatarURL() {
        const { currentUser } = this.props
        if (currentUser) {
            if (currentUser.avatar) {
                return currentUser.avatar
            }
            const url = 'https://www.twelvet.cn/assets/images/pay.png'
            return url
        }
        return ''
    }

    getViewDom = (ref: HTMLDivElement) => {
        this.view = ref
    }

    handleFinish = () => {
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
                    <AvatarView avatar={this.getAvatarURL()} />
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
