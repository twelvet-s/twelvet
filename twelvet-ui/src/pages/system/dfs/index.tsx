import React, { useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { CloseOutlined, DeleteOutlined, DownloadOutlined, PlusOutlined } from '@ant-design/icons'
import { Button, Divider, message, Popconfirm, Space } from 'antd'
import { downloadFile, pageQuery, remove } from './service'
import ImportDFS from './components/importDFS/Index'
import { FormInstance } from 'antd/lib/form'
import { isArray } from 'lodash'
import { system } from '@/utils/twelvet'

/**
 * 分布式文件系统
 */
const DFS: React.FC<{}> = () => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [importDFSVisible, setImpDFSVisible] = useState<boolean>(false)


    // Form参数
    const columns: ProColumns = [
        {
            title: '空间', search: false, width: 80, valueType: "text", dataIndex: 'spaceName'
        },
        {
            title: '文件名', copyable: true, width: 250, valueType: "text", search: false, dataIndex: 'fileName'
        },
        {
            title: '文件原名', copyable: true, width: 200, valueType: "text", dataIndex: 'originalFileName'
        },
        {
            title: '文件类型', width: 80, valueType: "text", search: false, dataIndex: 'type'
        },
        {
            title: '文件大小', width: 80, valueType: "text", search: false, dataIndex: 'size'
        },
        {
            title: '创建日期', width: 200, valueType: "Date", search: false, dataIndex: 'createTime'
        },
        {
            title: '操作', fixed: 'right', width: 320, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <>
                        <a onClick={() => downloadFile(row.fileId)}>
                            <Space>
                                <DownloadOutlined />
                                下载文件
                            </Space>
                        </a>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => refRemove(row.fileId)}
                            title="确定删除吗"
                        >
                            <a href='#'>
                                <Space>
                                    <CloseOutlined />
                                    删除
                                </Space>
                            </a>
                        </Popconfirm>
                    </>
                )
            }
        },
    ]

    /**
     * 删除文件
     * @param row fileIds
     */
    const refRemove = async (fileIds: (string | number)[] | string | undefined) => {
        try {

            if (!fileIds) {
                return true
            }

            let params
            if (isArray(fileIds)) {
                params = fileIds.join(",")
            } else {
                params = fileIds
            }

            const { code, msg } = await remove(params)

            if (code !== 200) {
                return message.error(msg)
            }

            message.success(msg)

            acForm.current && acForm.current.reload()

        } catch (e) {
            system.error(e)
        }

    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                rowKey="fileId"
                columns={columns}
                request={pageQuery}
                formRef={formRef}
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
                toolBarRender={(action, { selectedRowKeys }) => [
                    <Popconfirm
                        disabled={!(selectedRowKeys && selectedRowKeys.length > 0)}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据"
                    >
                        <Button
                            disabled={!(selectedRowKeys && selectedRowKeys.length > 0)}
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            批量删除
                        </Button>
                    </Popconfirm>,
                    <Button type="primary" onClick={() => {
                        setImpDFSVisible(true)
                    }}>
                        <PlusOutlined />
                        上传文件
                    </Button>
                ]}

            />

            <ImportDFS
                visible={importDFSVisible}
                onCancel={() => {
                    setImpDFSVisible(false)
                }}
                ok={() => {
                    acForm.current?.reload()
                }}
            />
        </>
    )

}

export default DFS