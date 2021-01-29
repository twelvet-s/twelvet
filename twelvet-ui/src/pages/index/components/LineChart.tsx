import { useEffect, useState } from 'react';
import echarts from 'echarts/lib/echarts';
import 'echarts/lib/chart/line';
import 'echarts/theme/macarons';
import styles from './styles.less';
import React from 'react';
import { Card } from 'antd';

interface LineChartProps {
    option: { [key: string]: any }
}

/**
 * 折线图
 */
const LineChart: React.FC<LineChartProps> = props => {

    // 图表参数
    const { option } = props

    const config: { [key: string]: any } = {
        xAxis: {
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            boundaryGap: false,
            axisTick: {
                show: false
            }
        },
        grid: {
            left: 10,
            right: 10,
            bottom: 20,
            top: 30,
            containLabel: true
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            },
            padding: [5, 10]
        },
        yAxis: {
            axisTick: {
                show: false
            }
        },
        legend: {
            data: ['expected', 'actual']
        },
        series: [{
            name: 'expected',
            itemStyle: {
                normal: {
                    color: '#FF005A',
                    lineStyle: {
                        color: '#FF005A',
                        width: 2
                    }
                }
            },
            smooth: true,
            type: 'line',
            data: [],
            animationDuration: 2000,
            animationEasing: 'cubicInOut'
        },
        {
            name: 'actual',
            smooth: true,
            type: 'line',
            itemStyle: {
                normal: {
                    color: '#3888fa',
                    lineStyle: {
                        color: '#3888fa',
                        width: 2
                    },
                    areaStyle: {
                        color: '#f3f8ff'
                    }
                }
            },
            data: [],
            animationDuration: 2000,
            animationEasing: 'quadraticOut'
        }
        ]

    }

    let lineChartRef: HTMLDivElement;
    const [lineChart, setLineChart] = useState()

    // 第一次渲染时执行
    useEffect(() => {
        // 获取echarts实例
        const instance: any = echarts.init(lineChartRef, "macarons")
        // 设置参数
        setEcharts(instance)
        // 开启自适应
        window.addEventListener('resize', instance.resize)

        // 设置到state
        setLineChart(instance)

    }, [])

    // 依赖props更新
    useEffect(() => {
        if (!lineChart) { return }
        setEcharts()
    }, [option])

    // 设置echarts属性
    const setEcharts = (instance: any | undefined = undefined) => {
        const ctr = instance ? instance : lineChart

        config.series[0].data = option.expected
        config.series[1].data = option.actual

        // 设置数据
        ctr.setOption(config)

    }

    return (
        <Card title="实时数据">
            <div
                ref={(ref: HTMLDivElement) => { lineChartRef = ref }}
                className={styles.lineChart}
            >
            </div>
        </Card>
    )

}

export default LineChart