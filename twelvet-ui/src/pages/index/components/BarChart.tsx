import { useEffect } from 'react'
import EchartsCtr from 'echarts'
import 'echarts/lib/chart/bar'
import 'echarts/theme/macarons'
import styles from './styles.less'
import React from 'react'
import { Card } from 'antd'

/**
 * 扇形图
 */
const BarChart = () => {

    let barChart: HTMLDivElement;

    const config: { [key: string]: any } = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            left: 'center',
            bottom: '10',
            data: ['Industries', 'Technology', 'Forex', 'Gold', 'Forecasts']
        },
        series: [
            {
                name: 'WEEKLY WRITE ARTICLES',
                type: 'pie',
                roseType: 'radius',
                radius: [15, 95],
                center: ['50%', '38%'],
                data: [
                    { value: 200, name: 'Industries' },
                    { value: 240, name: 'Technology' },
                    { value: 149, name: 'Forex' },
                    { value: 60, name: 'Gold' },
                    { value: 70, name: 'Forecasts' }
                ],
                animationEasing: 'cubicInOut',
                animationDuration: 2600
            }
        ]

    }

    // 第一次渲染时执行
    useEffect(() => {
        // 获取echarts实例
        const instance: any = EchartsCtr.init(barChart, "macarons")
        // 设置参数
        instance.setOption(config)

        // 开启自适应
        window.addEventListener('resize', instance.resize)
        // 关闭监听
        return () => {
            window.removeEventListener('resize', instance.resize)
        }
    }, [])

    return (
        <Card title="数据分析">
            <div
                ref={(ref: HTMLDivElement) => barChart = ref}
                className={styles.barChart}
            >
            </div>
        </Card>

    )

}

export default BarChart