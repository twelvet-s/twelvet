import React from 'react'
import { Collapse } from 'antd'

/**
 * TwelveT发展史组件
 */
const History = () => {
    return (
        <Collapse defaultActiveKey={2}>
            <Collapse.Panel header="2021-02-11" key={2}>
                TwelveT正式对外发布
            </Collapse.Panel>
            <Collapse.Panel header="2019-10-27" key={1}>
                TwelveT正式建立
            </Collapse.Panel>
        </Collapse>
    )
}

export default History