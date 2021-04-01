import React, { Component } from 'react'
import { Button, Input, Form, message } from 'antd'
import { connect, FormattedMessage, getDvaApp } from 'umi'

import { CurrentUser } from '../data.d'
import styles from './BaseView.less'

// 图片剪辑样式
import 'antd/es/modal/style';
import 'antd/es/slider/style';
import UploadTWT from '@/components/TwelveT/Upload'
import { update, updateAvatar } from '../service'
import { system } from '@/utils/twelvet'



interface BaseViewProps {
    currentUser?: CurrentUser
}

class BaseView extends Component<BaseViewProps> {

    view: HTMLDivElement | undefined = undefined

    state = {
        loading: false
    }

    getViewDom = (ref: HTMLDivElement) => {
        this.view = ref
    }

    /**
     * 更新用户信息
     */
    putUser = () => {
        getDvaApp()._store.dispatch({
            type: 'user/getCurrentUser',
            payload: {}
        })
    }

    /**
     * 修改用户信息
     * @param value 
     */
    handleFinish = async (values: any) => {
        try {
            // 开启加载中
            this.setState({ loading: true })
            const { code, msg } = await update(values)
            if (code != 200) {
                return message.error(msg)
            }
            // 更新全局用户信息
            this.putUser()

            message.success(msg)
        } catch (e) {
            system.error(e)
        } finally {
            this.setState({ loading: false })
        }
    }

    render() {
        const { currentUser } = this.props
        const { loading } = this.state

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
                            label={<FormattedMessage id='accountandsettings.basic.nickname' />}
                            rules={[
                                {
                                    required: true,
                                    message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>

                        <Form.Item>
                            <Button loading={loading} htmlType="submit" type="primary">
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
                            name="avatar"
                            label={<FormattedMessage id='accountandsettings.basic.avatar' />}
                        >
                            <UploadTWT
                                name='avatarFile'
                                // 开启图片剪裁
                                imgCrop={true}
                                title='用户头像'
                                maxCount={1}
                                action={updateAvatar}
                                success={() => {
                                    this.putUser()
                                }}
                            >
                            </UploadTWT>
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
