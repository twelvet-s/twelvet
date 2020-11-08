import React, { useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, EditOutlined, EyeOutlined, FundProjectionScreenOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, DatePicker, Space } from 'antd'
import { TableListItem } from './data'
import { pageQuery, remove, exportExcel } from './service'
import { system } from '@/utils/twelvet'
import { RequestData } from '@ant-design/pro-table'
import { UseFetchDataAction } from '@ant-design/pro-table/lib/useFetchData'
import JobStatus from './components/Switch'

/**
 * 登录日志
 */
const Login: React.FC<{}> = () => {

    const acForm = useRef<ActionType>()

    const { RangePicker } = DatePicker

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '任务名称', ellipsis: true, valueType: "text", dataIndex: 'jobName',
        },
        {
            title: '任务组名', valueType: "text", dataIndex: 'jobGroup'
        },
        {
            title: '调用目标字符串', valueType: "text", search: false, dataIndex: 'invokeTarget'
        },
        {
            title: '日志信息', valueType: "text", search: false, dataIndex: 'invokeTarget'
        },
        {
            title: '执行状态',
            ellipsis: false,
            dataIndex: 'status',
            render: (_: string, row: { [key: string]: string }) => [
                <JobStatus row={row} />
            ]
        },
        {
            title: '执行时间', valueType: "text", search: false, dataIndex: 'invokeTarget'
        },
        {
            title: '操作', valueType: "option", search: false, dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <Space>
                        <Popconfirm
                            onConfirm={() => refRemove(row)}
                            title="确定删除吗"
                        >
                            <Button type="primary" onClick={() => refPut(row)}>
                                <EditOutlined />
                                执行
                            </Button >
                        </Popconfirm>

                        <Button type="default">
                            <EyeOutlined />
                                详情
                        </Button>

                    </Space >
                )
            }
        },
    ]

    /**
     * 移除菜单
     * @param row infoIds
     */
    const refRemove = async (infoIds: (string | number)[] | undefined, action: UseFetchDataAction<RequestData<string>>) => {
        try {
            if (!infoIds) {
                return true
            }
            const { code, msg } = await remove(infoIds.join(","))
            if (code != 200) {
                return message.error(msg)
            }

            message.success(msg)

            action.reload()

        } catch (e) {
            system.error(e)
        }

    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                rowKey="infoId"
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
                toolBarRender={(action, { selectedRowKeys }) => [
                    <Popconfirm
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => refRemove(selectedRowKeys, action)}
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
                    <Button type="default" onClick={() => exportExcel({ s: 1 })}>
                        <FundProjectionScreenOutlined />
                        导出数据
                    </Button>
                ]}

            />
        </>
    )

}

export default Login