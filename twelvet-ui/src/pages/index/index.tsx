import { Row, Col, Card, Image } from 'antd'
import History from './components/History'
import Panel from './components/Panel'
import { system } from '@/utils/twelvet'

import LineChart from './components/LineChart'
import BarChart from './components/BarChart'

import React, { useState, useEffect } from 'react'

/**
 * 首页
 */
const Index: React.FC<{}> = () => {

    const [lineChart, setLineChart] = useState({
        expected: [100, 100, 300, 200, 300, 500, 800],
        actual: [120, 300, 400, 180, 400, 600, 999]
    })



    useEffect(() => {
        system.log("组件装载，数据模拟定时器开启")
        const timer = setInterval(() => {
            const random1 = Math.ceil(Math.random() * 1000)
            const random2 = Math.ceil(Math.random() * 1000)
            const random3 = Math.ceil(Math.random() * 1000)
            const random4 = Math.ceil(Math.random() * 1000)
            const random5 = Math.ceil(Math.random() * 1000)
            const random6 = Math.ceil(Math.random() * 1000)
            const random7 = Math.ceil(Math.random() * 1000)

            const random01 = Math.ceil(Math.random() * 1000)
            const random02 = Math.ceil(Math.random() * 1000)
            const random03 = Math.ceil(Math.random() * 1000)
            const random04 = Math.ceil(Math.random() * 1000)
            const random05 = Math.ceil(Math.random() * 1000)
            const random06 = Math.ceil(Math.random() * 1000)
            const random07 = Math.ceil(Math.random() * 1000)

            setLineChart({
                expected: [random1, random2, random3, random4, random5, random6, random7],
                actual: [random01, random02, random03, random04, random05, random06, random07]

            })
        }, 2000)

        return () => {
            system.log("组件卸载，数据模拟定时器关闭")
            clearInterval(timer)
        }
    }, [])

    return (
        <>
            <Row gutter={[20, 20]}>
                <Col md={{ span: 16 }} xs={{ span: 24 }}>
                    <Panel />
                </Col>

                <Col md={{ span: 8 }} xs={{ span: 24 }}>
                    <BarChart />
                </Col>

                <Col span={24}>
                    <LineChart
                        option={
                            {
                                expected: lineChart.expected,
                                actual: lineChart.actual
                            }
                        }
                    />
                </Col>


                <Col xl={{ span: 6 }} xs={{ span: 24 }}>
                    <Card title="官方信息">
                        <p>
                            官网：<a href="https://www.twelvet.cn/" target='_blank' >https://www.twelvet.cn</a>
                        </p>
                        <p>
                            交流群：<a href="https://jq.qq.com/?_wv=1027&k=cznM6Q00" target='_blank' >985830229</a>
                        </p>

                    </Card>
                </Col>

                <Col xl={{ span: 10 }} xs={{ span: 24 }}>
                    <Card title="TwelveT发展史">
                        <History />
                    </Card>
                </Col>

                <Col xl={{ span: 8 }} xs={{ span: 24 }}>
                    <Card title="捐赠支持（用于演示站/维护项目）">
                        <Image src='https://www.twelvet.cn/assets/images/pay.png' />
                    </Card>
                </Col>
            </Row>
        </>
    )

}

export default Index