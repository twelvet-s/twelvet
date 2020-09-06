import { Button, Col, Input, Row, Form, message } from 'antd';
import React, { useState, useCallback, useEffect } from 'react';
import omit from 'omit.js';
import { FormItemProps } from 'antd/es/form/FormItem';
import { getFakeCaptcha } from '@/services/login';

import ItemMap from './map';
import LoginContext, { LoginContextProps } from './LoginContext';
import styles from './index.less';

export type WrappedLoginItemProps = LoginItemProps;
export type LoginItemKeyType = keyof typeof ItemMap;
export interface LoginItemType {
    UserName: React.FC<WrappedLoginItemProps>;
    Password: React.FC<WrappedLoginItemProps>;
    Mobile: React.FC<WrappedLoginItemProps>;
    Captcha: React.FC<WrappedLoginItemProps>;
}

const getFormItemOptions = ({
    onChange,
    defaultValue,
    customProps = {},
    rules,
}: LoginItemProps) => {
    const options: {
        rules?: LoginItemProps['rules'];
        onChange?: LoginItemProps['onChange'];
        initialValue?: LoginItemProps['defaultValue'];
    } = {
        rules: rules || (customProps.rules as LoginItemProps['rules']),
    };
    if (onChange) {
        options.onChange = onChange;
    }
    if (defaultValue) {
        options.initialValue = defaultValue;
    }
    return options;
};

export interface LoginItemProps extends Partial<FormItemProps> {
    name?: string;
    style?: React.CSSProperties;
    placeholder?: string;
    buttonText?: React.ReactNode;
    countDown?: number;
    getCaptchaButtonText?: string;
    getCaptchaSecondText?: string;
    updateActive?: LoginContextProps['updateActive'];
    type?: string;
    defaultValue?: string;
    customProps?: { [key: string]: unknown };
    onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
    tabUtil?: LoginContextProps['tabUtil'];
}

const FormItem = Form.Item;

const LoginItem: React.FC<LoginItemProps> = (props) => {
    const [count, setCount] = useState<number>(props.countDown || 0);
    // 建立一个状态管理切换验证码表单
    const [timing, setTiming] = useState(false);
    // 这么写是为了防止restProps中 带入 onChange, defaultValue, rules props tabUtil
    const {
        onChange,
        customProps,
        defaultValue,
        rules,
        name,
        getCaptchaButtonText,
        getCaptchaSecondText,
        updateActive,
        type,
        tabUtil,
        ...restProps
    } = props;

    const onGetCaptcha = useCallback(async (mobile: string) => {

        if (!(/^1[3456789]\d{9}$/.test(mobile))) {
            return message.error("请检查您的手机号码");
        }

        const result = await getFakeCaptcha(mobile);

        if (result === false) {
            return;
        }
        message.success('获取验证码成功！验证码为：1234');
        setTiming(true);
    }, []);

    useEffect(() => {
        let interval: number = 0;
        const { countDown } = props;
        // 开始倒计时
        if (timing) {
            interval = window.setInterval(() => {
                setCount((preSecond) => {
                    if (preSecond <= 1) {
                        setTiming(false);
                        clearInterval(interval);
                        // 重置秒数
                        return countDown || 60;
                    }
                    return preSecond - 1;
                });
            }, 1000);
        }
        // componentWillUnmount执行清除定时
        return () => clearInterval(interval);
    }, [timing]);
    if (!name) {
        return null;
    }
    // get getFieldDecorator props
    const options = getFormItemOptions(props);
    const otherProps = restProps || {};

    // 渲染验证码组件
    if (type === 'Captcha') {
        const inputProps = omit(otherProps, ['onGetCaptcha', 'countDown']);

        return (
            // 设置为自定义更新组件, 无样式组件
            <FormItem shouldUpdate noStyle>
                {({ getFieldValue }) => (
                    <Row gutter={8}>
                        <Col span={16}>
                            <FormItem name={name} {...options}>
                                <Input {...customProps} {...inputProps} />
                            </FormItem>
                        </Col>
                        <Col span={8}>
                            <Button
                                disabled={timing}
                                className={styles.getCaptcha}
                                size="large"
                                onClick={() => {
                                    // 获取表单中对应name的value值
                                    const value = getFieldValue('mobile');
                                    onGetCaptcha(value);
                                }}
                            >
                                {timing ? `${count} 秒` : '获取验证码'}
                            </Button>
                        </Col>
                    </Row>
                )}
            </FormItem>
        );
    } else if (type === 'Password') {
        return (
            <FormItem name={name} {...options}>
                <Input.Password {...customProps} {...otherProps} />
            </FormItem>
        )
    }
    
    return (
        <FormItem name={name} {...options}>
            <Input {...customProps} {...otherProps} />
        </FormItem>
    );
};

const LoginItems: Partial<LoginItemType> = {};
// 遍历FormMap中定义的组件
Object.keys(ItemMap).forEach((key) => {
    const item = ItemMap[key];
    LoginItems[key] = (props: LoginItemProps) => (
        <LoginContext.Consumer>
            {(context) => (
                <LoginItem
                    // 自定义属性
                    customProps={item.props}
                    // 输入限定规则
                    rules={item.rules}
                    // 父组件属性
                    {...props}
                    // 组件名称
                    type={key}
                    // 共享属性
                    {...context}
                    updateActive={context.updateActive}
                />
            )}
        </LoginContext.Consumer>
    );
});

export default LoginItems as LoginItemType;