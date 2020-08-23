import React from 'react'
import { Collapse } from 'antd'

const text: string = `
  A dog is a type of domesticated animal.
  Known for its loyalty and faithfulness,
  it can be found as a welcome guest in many households across the world.
`;

/**
 * TwelveT发展史组件
 */
const History = () => {
    return (
        <Collapse defaultActiveKey={['1']}>
            <Collapse.Panel header="This is panel header 1" key="1">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 2" key="2">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 3" key="3">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 3" key="4">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 3" key="5">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 3" key="6">
                <p>{text}</p>
            </Collapse.Panel>
            <Collapse.Panel header="This is panel header 3" key="7">
                <p>{text}</p>
            </Collapse.Panel>
        </Collapse>
    )
}

export default History