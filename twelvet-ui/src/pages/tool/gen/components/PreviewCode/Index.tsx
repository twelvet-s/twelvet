import React, { useState, useRef, useEffect } from 'react'
import { ActionType } from '@/components/TwelveT/ProTable/Index'
import { message, Form, Input, Modal, Tabs, Descriptions } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { remove, getBydictCode, insert, update, getInfo } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'
import ProDescriptions from '@ant-design/pro-descriptions'

/**
 * 字典模块数据管理
 */
const PreviewCode: React.FC<{
    info: {
        tableId: number
        visible: boolean
    }
    onClose: () => void
}> = (props) => {

    const { info, onClose } = props

    const [codeData, setCodeData] = useState<{}>({})

    /**
     * 初始化数据信息
     */
    useEffect(() => {
        if (info.tableId != 0) {
            refGetInfo()
        }
    }, [info])

    /**
     * 获取信息
     * @returns 
     */
    const refGetInfo = async () => {
        try {

            const { code, msg, data } = await getInfo(info.tableId)

            if (code != 200) {
                return message.error(msg)
            }

            setCodeData(data)
        } catch (e) {
            system.error(e)
        }
    }

    return (
        <Modal
            title={`代码预览`}
            visible={info.visible}
            onCancel={() => {
                onClose()
            }}
            footer={null}
        >
            <Tabs
                defaultActiveKey="1"
            >
                <Tabs.TabPane tab="Controller.java" key="1">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`控制层`} valueType="code">

                            {codeData['vm/java/controller.java.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>
                </Tabs.TabPane>

                <Tabs.TabPane tab="Service.java" key="2">

                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`业务层`} valueType="code">

                            {codeData['vm/java/service.java.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="ServiceImpl.java" key="3">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`业务实现层`} valueType="code">

                            {codeData['vm/java/serviceImpl.java.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>
                </Tabs.TabPane>

                <Tabs.TabPane tab="Mapper.java" key="4">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`Mapper`} valueType="code">

                            {codeData['vm/java/mapper.java.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="Mapper.xml" key="5">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`Mapper XML`} valueType="code">

                            {codeData['vm/xml/mapper.xml.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="Domain.java" key="6">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`实体`} valueType="code">

                            {codeData['vm/java/domain.java.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="Index.tsx" key="7">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`页面`} valueType="code">

                            {codeData['vm/react/index.tsx.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="Api.ts" key="8">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`Api`} valueType="code">

                            {codeData['vm/js/api.ts.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

                <Tabs.TabPane tab="SQL" key="9">
                    <ProDescriptions column={1}>
                        <ProDescriptions.Item label={`SQL`} valueType="code">

                            {codeData['vm/sql/sql.vm']}

                        </ProDescriptions.Item>
                    </ProDescriptions>

                </Tabs.TabPane>

            </Tabs>
        </Modal>
    )

}

export default PreviewCode