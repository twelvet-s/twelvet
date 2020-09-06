import { GithubOutlined, WechatFilled, QqOutlined } from '@ant-design/icons';
import { Alert, Checkbox } from 'antd';
import React, { useState } from 'react';
import { Link, connect, Dispatch } from 'umi';
import { StateType } from '@/models/login';
import { LoginParamsType } from '@/services/login';
import { ConnectState } from '@/models/connect';
import LoginForm from './components';

import styles from './index.less';

const { Tab, UserName, Password, Mobile, Captcha, Submit } = LoginForm;

interface LoginProps {
    dispatch: Dispatch;
    userLogin: StateType;
    submitting?: boolean;
}

const LoginMessage: React.FC<{ content: string }> = ({ content }) => (
    <Alert
        style={{
            marginBottom: 24,
        }}
        message={content}
        type="error"
        showIcon
    />
);


const Login: React.FC<LoginProps> = props => {
    const { userLogin = {}, submitting } = props;
    const { status, type: loginType } = userLogin;
    // 默认不会自动勾选自动登录
    const [autoLogin, setAutoLogin] = useState(false);
    // 默认登录页面
    const [type, setType] = useState('account');

    const handleSubmit = (values: LoginParamsType) => {
        const { dispatch } = props;
        dispatch({
            type: 'login/login',
            payload: { ...values, type },
        });
    };

    return (
            <div className={styles.main}>
                <LoginForm activeKey={type} onTabChange={setType} onSubmit={handleSubmit}>
                    <Tab key="account" tab="账户密码登录">
                        {status === 'error' && loginType === 'account' && !submitting && (
                            <LoginMessage content="账户或密码错误" />
                        )}

                        <UserName
                            name="username"
                            rules={[
                                {
                                    required: true,
                                    message: '请输入用户名!',
                                },
                            ]}
                        />
                        <Password
                            name="password"
                            rules={[
                                {
                                    required: true,
                                    message: '请输入密码！',
                                },
                            ]}
                        />
                    </Tab>

                    <Tab key="mobile" tab="手机号登录">
                        {status === 'error' && loginType === 'mobile' && !submitting && (
                            <LoginMessage content="验证码错误" />
                        )}
                        <Mobile
                            name="mobile"
                            rules={[
                                {
                                    required: true,
                                    message: '请输入手机号！',
                                },
                                {
                                    pattern: /^1[3456789]\d{9}$/,
                                    message: '手机号格式错误！',
                                },
                            ]}
                        />
                        <Captcha
                            name="captcha"
                            // 设置倒计时时间
                            countDown={120}
                            getCaptchaButtonText=""
                            getCaptchaSecondText="秒"
                            rules={[
                                {
                                    required: true,
                                    message: '请输入验证码！',
                                },
                            ]}
                        />
                    </Tab>

                    <div>
                        <Checkbox checked={autoLogin} onChange={e => setAutoLogin(e.target.checked)}>
                            自动登录
                    </Checkbox>
                        <a
                            style={{
                                float: 'right',
                            }}
                        >
                            忘记密码
                    </a>
                    </div>
                    <Submit loading={submitting}>登录</Submit>
                    <div className={styles.other}>
                        其他登录方式
                        <GithubOutlined className={styles.icon} title='GitHub' />
                        <WechatFilled className={styles.icon} title='WeChat' />
                        <QqOutlined className={styles.icon} title='QQ' />
                        <Link className={styles.register} to="/user/register">
                            注册账户
                        </Link>
                    </div>
                </LoginForm>
            </div>

    );
};

export default connect(({ login, loading }: ConnectState) => ({
    userLogin: login,
    submitting: loading.effects['login/login'],
}))(Login);
