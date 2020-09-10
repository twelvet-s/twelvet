import { Row, Col, Card } from 'antd'
import FastCtr from './components/FastCtr'
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
            <Row gutter={[15, 30]}>
                <Col sm={{ span: 18 }} xs={{ span: 24 }}>
                    <Panel />
                </Col>

                <Col sm={{ span: 6 }} xs={{ span: 24 }}>
                    <FastCtr />
                </Col>
            </Row>

            <Row gutter={[15, 30]}>
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
            </Row>

            <Row gutter={[15, 30]}>

                <Col sm={{ span: 16 }} xs={{ span: 24 }}>
                    <Card title="TwelveT发展史">
                        <History />
                    </Card>
                </Col>

                <Col sm={{ span: 8 }} xs={{ span: 24 }}>
                    <BarChart />
                </Col>
            </Row>
        </>
    )

}

export default Index