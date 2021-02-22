import { FormattedMessage, formatMessage, connect } from 'umi'
import React, { Component } from 'react'

import { List } from 'antd'
import Password from './security/password/index'
import Email from './security/email'
import Phone from './security/phone'
import { CurrentUser } from '../data.d'

type Unpacked<T> = T extends (infer U)[] ? U : T

class SecurityView extends Component<{
    currentUser: CurrentUser
}> {

    state = {
        passwordModal: false,
        phoneModal: false,
        emailModal: false
    }

    getData = () => {
        const { currentUser } = this.props

        const phone = currentUser.phonenumber ? currentUser.phonenumber : `未绑定`

        const email = currentUser.email ? currentUser.email : `未绑定`

        return [
            {
                title: formatMessage({ id: 'accountandsettings.security.password' }, {}),
                actions: [
                    <a key="Modify" onClick={() => {
                        this.setState({
                            passwordModal: true
                        })
                    }}>
                        <FormattedMessage id="accountandsettings.security.modify" defaultMessage="Modify" />
                    </a>,
                ],
            },
            {
                title: formatMessage({ id: 'accountandsettings.security.phone' }, {}),
                description: `${formatMessage(
                    { id: 'accountandsettings.security.phone-description' },
                    {},
                )} ${phone}`,
                actions: [
                    <a key="Modify" onClick={() => {
                        this.setState({
                            phoneModal: true
                        })
                    }}>
                        <FormattedMessage id="accountandsettings.security.modify" defaultMessage="Modify" />
                    </a>,
                ],
            },
            {
                title: formatMessage({ id: 'accountandsettings.security.email' }, {}),
                description: `${formatMessage(
                    { id: 'accountandsettings.security.email-description' },
                    {},
                )} ${email}`,
                actions: [
                    <a key="Modify" onClick={() => {
                        this.setState({
                            emailModal: true
                        })
                    }}>
                        <FormattedMessage id="accountandsettings.security.modify" defaultMessage="Modify" />
                    </a>,
                ],
            },
        ]
    }

    render() {

        const { passwordModal, phoneModal, emailModal } = this.state

        const data = this.getData()

        return (
            <>
                <List<Unpacked<typeof data>>
                    itemLayout="horizontal"
                    dataSource={data}
                    renderItem={(item) => (
                        <List.Item actions={item.actions}>
                            <List.Item.Meta title={item.title} description={item.description} />
                        </List.Item>
                    )}
                />

                <Password
                    passwordModal={passwordModal}
                    onCancel={() => {
                        this.setState({
                            passwordModal: false
                        })
                    }}
                />

                <Phone
                    passwordModal={phoneModal}
                    onCancel={() => {
                        this.setState({
                            phoneModal: false
                        })
                    }}
                />

                <Email
                    passwordModal={emailModal}
                    onCancel={() => {
                        this.setState({
                            emailModal: false
                        })
                    }}
                />

            </>
        )
    }
}

export default connect(
    ({ accountAndsettings }: { accountAndsettings: { currentUser: CurrentUser } }) => ({
        currentUser: accountAndsettings.currentUser,
    }),
)(SecurityView)
