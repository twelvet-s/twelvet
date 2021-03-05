import React, { useState, useEffect } from 'react'
import { message, TreeSelect } from 'antd'
import { treeSelect } from '../../service'
import { system } from '@/utils/twelvet'

const DeptSearch: React.FC<{}> = props => {

    // 部门数据
    const [DEPTS, setDEPTS] = useState<Array<{ [key: string]: any }>>([{}])

    useEffect(() => {
        makeDept()
    }, [])

    const makeDept = async () => {
        try {
            const { code, msg, data } = await treeSelect()
            if (code != 200) {
                return message.error(msg)
            }

            setDEPTS(data)

        } catch (e) {
            system.error(e)
        }
    }

    return (
        <>
            <TreeSelect
                // 必须设置props，否则无法取值Search
                {...props}
                allowClear
                showSearch
                treeLine
                treeNodeFilterProp="title"
                treeNodeLabelProp='title'
                treeData={DEPTS}
            />
        </>
    )
}

export default DeptSearch