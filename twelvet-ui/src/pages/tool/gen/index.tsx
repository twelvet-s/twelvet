import React, { useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { CloseOutlined, CloudSyncOutlined, DeleteOutlined, EditOutlined, EyeOutlined, FileZipOutlined, SyncOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Space, Divider, FormInstance } from 'antd'
import { batchGenCode, pageQuery, remove, synchDb } from './service'
import { system } from '@/utils/twelvet'
import DrawerInfo from './components/DrawerInfo/Index'
import PreviewCode from './components/PreviewCode/Index'
import EditCode from './components/EditCode/Index'

/**
 * 代码生成器
 */
const Gen: React.FC<{}> = () => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [drawerInfoVisible, setDrawerInfoVisible] = useState<boolean>(false)

    const [previewCodeVisible, setPreviewCodeVisible] = useState<{
        tableId: number
        visible: boolean
    }>({
        tableId: 0,
        visible: false
    })

    const [editCodeVisible, setEditCodeVisible] = useState<{
        tableId: number
        visible: boolean
    }>({
        tableId: 0,
        visible: false
    })

    // Form参数
    const columns: ProColumns = [
        {
            title: '表名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'tableName',
        },
        {
            title: '表描述', width: 200, valueType: "text", dataIndex: 'tableComment'
        },
        {
            title: '实体', width: 200, valueType: "text", search: false, dataIndex: 'className'
        },
        {
            title: '创建时间', width: 200, valueType: "text", search: false, dataIndex: 'createTime'
        },
        {
            title: '更新时间', width: 200, valueType: "text", search: false, dataIndex: 'updateTime'
        },
        {
            title: '操作', fixed: 'right', width: 400, valueType: "option", search: false, dataIndex: 'operation', render: (_: string, row) => {
                return (
                    <>
                        <a onClick={() => setPreviewCodeVisible({
                            tableId: row.tableId,
                            visible: true
                        })}>
                            <Space>
                                <EyeOutlined />
                                预览
                            </Space>
                        </a >
                        <Divider type="vertical" />
                        <a href='#' onClick={() => setEditCodeVisible({
                            tableId: row.tableId,
                            visible: true
                        })}>
                            <Space>
                                <EditOutlined />
                                编辑
                            </Space>
                        </a>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => refRemove(row.tableId)}
                            title="确定删除吗"
                        >
                            <a href='#'>
                                <Space>
                                    <CloseOutlined />
                                    删除
                                </Space>
                            </a>
                        </Popconfirm>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => { refSynchDb(row.tableName) }}
                            title="确定强制同步结构吗"
                        >
                            <a href='#'>
                                <Space>
                                    <SyncOutlined spin />
                                    同步
                                </Space>
                            </a>
                        </Popconfirm>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => { batchGenCode(row.tableName) }}
                            title="确定生成吗"
                        >
                            <a href='#'>
                                <Space>
                                    <FileZipOutlined />
                                    生成代码
                                </Space>
                            </a>
                        </Popconfirm>
                    </>
                )
            }
        },
    ]

    /**
     * 移除
     * @param row tableIds
     */
    const refRemove = async (tableIds: number[] | undefined) => {
        try {
            if (!tableIds) {
                return true
            }
            const { code, msg } = await remove(tableIds)
            if (code != 200) {
                return message.error(msg)
            }

            message.success(msg)

            acForm.current && acForm.current.reload()

        } catch (e) {
            system.error(e)
        }

    }

    /**
     * 
     * @param tableName 同步表结构域
     */
    const refSynchDb = async (tableName: string) => {
        try {
            const { code, msg } = await synchDb(tableName)
            if (code != 200) {
                return message.error(msg)
            }

            message.success(msg)

        } catch (e) {
            system.error(e)
        }
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                formRef={formRef}
                rowKey="tableId"
                columns={columns}
                request={pageQuery}
                rowSelection={{}}
                beforeSearchSubmit={(params) => {
                    // 分隔搜索参数
                    if (params.between) {
                        const { between } = params
                        // 移除参数
                        delete params.between

                        // 适配参数
                        params.beginTime = between[0]
                        params.endTime = between[1]
                    }
                    return params
                }}
                toolBarRender={(action, { selectedRowKeys, selectedRows }) => [
                    <Button
                        type="primary"
                        onClick={() => {
                            setDrawerInfoVisible(true)
                        }}
                    >
                        <CloudSyncOutlined />
                        导入数据
                    </Button>,
                    <Popconfirm
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => {
                            const tableNames = selectedRows?.map(item => {
                                return item.tableName
                            })
                            batchGenCode(tableNames)
                        }}
                        title="是否批量生成"
                    >
                        <Button
                            disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                            type="default"
                        >
                            <FileZipOutlined />
                            批量生成
                        </Button>
                    </Popconfirm>,
                    <Popconfirm
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据"
                    >
                        <Button
                            disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            批量删除
                    </Button>
                    </Popconfirm>,
                ]}

            />
            {/* 代码预览 */}
            <PreviewCode
                onClose={() => {
                    setPreviewCodeVisible({
                        tableId: 0,
                        visible: false
                    })
                }}
                info={previewCodeVisible}
            />

            {/* 数据导入 */}
            <DrawerInfo
                reloadForm={acForm}
                onClose={() => {
                    setDrawerInfoVisible(false)
                }}
                visible={drawerInfoVisible}
            />

            {/* 代码生成结构编辑 */}
            <EditCode
                reloadForm={acForm}
                onClose={() => {
                    setEditCodeVisible({
                        tableId: 0,
                        visible: false
                    })
                }}
                info={editCodeVisible}
            />


        </>
    )

}

export default Gen