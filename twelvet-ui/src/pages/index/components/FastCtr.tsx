import { Card, Button, List } from 'antd'
import React from 'react';

/**
 * 极速控制台组件
 */
const FastCtr = () => {

    const data: any = [
        {
            title: '1',
        },
        {
            title: '2',
        },
        {
            title: '3',
        },
        {
            title: '4',
        },
        {
            title: '5',
        },
        {
            title: '6',
        },
        {
            title: '7',
        },
        {
            title: '8',
        },
        {
            title: '9',
        },
    ];

    return (
        <Card
            size="small"
            title="Fast"
            extra={
                <Button type={'primary'}>
                    新增
                </Button>
            }
        >

            <List
                grid={{
                    gutter: 16,
                    xs: 1,
                    sm: 2,
                    md: 4,
                    lg: 4,
                    xl: 6,
                    xxl: 3,
                }}
                dataSource={data}
                renderItem={(item: { [key: string]: String }) => (
                    <List.Item>
                        <Card style={{ textAlign: "center" }}>{item.title}</Card>
                    </List.Item>
                )}
            />

        </Card>
    )

}

export default FastCtr