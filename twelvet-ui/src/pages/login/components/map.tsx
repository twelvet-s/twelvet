import { LockTwoTone, MailTwoTone, MobileTwoTone, UserOutlined } from '@ant-design/icons';
import React from 'react';
import styles from './index.less';

/**
 * Form表单组件定义
 */
export default {
    // 账号
    UserName: {
        props: {
            size: 'large',
            id: 'userName',
            prefix: (
                <UserOutlined
                    style={{
                        color: '#1890ff',
                    }}
                    className={styles.prefixIcon}
                />
            ),
            placeholder: 'username',
        },
        rules: [
            {
                required: true,
                message: 'Please enter username!',
            },
        ],
    },
    // 密码
    Password: {
        props: {
            size: 'large',
            prefix: <LockTwoTone className={styles.prefixIcon} />,
            type: 'password',
            id: 'password',
            placeholder: 'password',
        },
        rules: [
            {
                required: true,
                message: 'Please enter password!',
            },
        ],
    },
    // 手机号码
    Mobile: {
        props: {
            size: 'large',
            prefix: <MobileTwoTone className={styles.prefixIcon} />,
            placeholder: 'mobile number',
        },
        rules: [
            {
                required: true,
                message: 'Please enter mobile number!',
            },
            {
                pattern: /^1\d{10}$/,
                message: 'Wrong mobile number format!',
            },
        ],
    },
    // 验证码
    Captcha: {
        props: {
            size: 'large',
            prefix: <MailTwoTone className={styles.prefixIcon} />,
            placeholder: 'captcha',
        },
        rules: [
            {
                required: true,
                message: 'Please enter Captcha!',
            },
        ],
    },
};
