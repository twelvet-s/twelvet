import React from 'react'
import { Collapse } from 'antd'
import styles from './styles.less'

/**
 * TwelveT发展史组件
 */
const History = () => {
    return (
        <Collapse defaultActiveKey={4} className={styles.historyOl}>
            <Collapse.Panel header="v1.1.0 - 2021-04-07" key={4}>
                <ol>
                    <li>新增代码生成器</li>
                    <li>修复多文件上传无文件时出现的错误响应</li>
                    <li>新增数据字典单选/复选框组件</li>
                    <li>修复服务调用无法获取到客户端IP</li>
                    <li>修复多文件上传出现的404 BUG</li>
                    <li>修改makeTree函数</li>
                    <li>修复部分BUG</li>
                    <li>修改nacos配置参数</li>
                    <li>增加分布式事务</li>
                </ol>
            </Collapse.Panel>
            <Collapse.Panel header="v1.0.2 - 2021-03-06" key={3}>
                <ol>
                    <li>加入TwelveT icon</li>
                    <li>修复全局layouts驼峰导致的打包敏感BUG</li>
                    <li>优化代码出现的警告,React key优化</li>
                    <li>优化TreeSelect组件出现的value值导致的警告</li>
                    <li>修复多文件上传出现的404 BUG</li>
                    <li>删除无用代码</li>
                    <li>UI优化</li>
                    <li>离线icon支持</li>
                    <li>更新SQL</li>
                </ol>
            </Collapse.Panel>
            <Collapse.Panel header="v1.0.1 - 2021-02-11" key={2}>
                <ol>
                    <li>TwelveT正式对外发布</li>
                </ol>
            </Collapse.Panel>
            <Collapse.Panel header="v1.0.0 - 2019-10-27" key={1}>
                <ol>
                    <li>TwelveT正式建立</li>
                </ol>
            </Collapse.Panel>
        </Collapse>
    )
}

export default History