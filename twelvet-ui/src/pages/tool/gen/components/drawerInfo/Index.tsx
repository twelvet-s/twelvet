import React, { useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { Button, Divider, Drawer, message } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { pageQuery, importTable } from './service'
import { system } from '@/utils/twelvet'
import { Key } from 'antd/lib/table/interface'

/**
 * 数据导入
 */
const DrawerInfo: React.FC<{
    visible: boolean
    onClose: () => void
    reloadForm: ActionType
}> = (props) => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [selectedRowKeys, setSelectedRowKeys] = useState<Key[]>([])

    const [loading, setLoading] = useState<boolean>(false)

    const { visible, reloadForm, onClose } = props


    // Form参数
    const columns: ProColumns = [
        {
            title: '表名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'tableName',
        },
        {
            title: '表描述', width: 200, valueType: "text", dataIndex: 'tableComment'
        },
        {
            title: '创建时间', search: false, width: 200, valueType: "text", dataIndex: 'createTime'
        },
        {
            title: '更新时间', search: false, width: 200, valueType: "dateTime", dataIndex: 'updateTime'
        },
    ]

    /**
     * 导入数据表
     */
    const importTableRef = async () => {

        try {

            setLoading(true)

            const { code, msg } = await importTable(selectedRowKeys)

            if (code != 200) {
                return message.error(msg)
            }
            message.success(msg)
            close()
            return reloadForm.current && reloadForm.current.reload()

        } catch (e) {
            system.error(e)
        } finally {
            setLoading(false)
        }

    }

    /**
     * 关闭抽屉
     */
    const close = () => {
        if (!loading) {
            onClose()
        }
    }

    return (
        <Drawer
            // 关闭时销毁子元素
            destroyOnClose={true}
            width="80%"
            placement="right"
            closable={false}
            onClose={() => {
                close()
            }}
            visible={visible}
            footer={
                <div
                    style={{
                        textAlign: 'right',
                    }}
                >
                    <Button onClick={() => close()}>
                        取消
                  </Button>
                    <Divider type="vertical" />
                    <Button loading={loading} type="primary" onClick={() => importTableRef()}>
                        导入
                  </Button>
                </div>
            }
        >
            <TWTProTable
                headerTitle='数据导入'
                actionRef={acForm}
                formRef={formRef}
                rowKey="tableName"
                columns={columns}
                request={pageQuery}
                rowSelection={{
                    selectedRowKeys,
                    onChange: (keys: Key[]) => {
                        setSelectedRowKeys(keys)
                    },
                }}
                toolBarRender={() => []}

            />
        </Drawer>
    )

}

export default DrawerInfo