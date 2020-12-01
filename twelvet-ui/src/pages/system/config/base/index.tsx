import React, { } from 'react'
import { Button, Checkbox, Form, Input, Tabs } from 'antd'
import layout from '@/pages/login/layout'

/**
 * 系统基础配置
 */
const BaseConfig: React.FC<{}> = () => {

    return (
        <Tabs animated defaultActiveKey="1" style={{ background: '#ffffff', padding: '0 20px 0 20px' }}>
            <Tabs.TabPane tab="基础设置" key="1">
                <Form
                    {...layout}
                    name="basic"
                    initialValues={{ remember: true }}
                >
                    <Form.Item
                        label="Username"
                        name="username"
                        rules={[{ required: true, message: 'Please input your username!' }]}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label="Password"
                        name="password"
                        rules={[{ required: true, message: 'Please input your password!' }]}
                    >
                        <Input.Password />
                    </Form.Item>

                    <Form.Item name="remember" valuePropName="checked">
                        <Checkbox>Remember me</Checkbox>
                    </Form.Item>

                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Form>
            </Tabs.TabPane>

            <Tabs.TabPane tab="SEO设置" key="2">
            <Form
                    {...layout}
                    name="basic"
                    initialValues={{ remember: true }}
                >
                    <Form.Item
                        label="Username"
                        name="username"
                        rules={[{ required: true, message: 'Please input your username!' }]}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label="Password"
                        name="password"
                        rules={[{ required: true, message: 'Please input your password!' }]}
                    >
                        <Input.Password />
                    </Form.Item>

                    <Form.Item name="remember" valuePropName="checked">
                        <Checkbox>Remember me</Checkbox>
                    </Form.Item>

                    <Form.Item>
                        <Button type="primary" htmlType="submit">
                            Submit
                        </Button>
                    </Form.Item>
                </Form>
            </Tabs.TabPane>
        </Tabs>
    )

}

export default BaseConfig