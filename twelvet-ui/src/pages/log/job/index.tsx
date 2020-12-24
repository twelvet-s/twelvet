import React, { useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, EyeOutlined, FundProjectionScreenOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, DatePicker, Space } from 'antd'
import { pageQuery, remove, exportExcel } from './service'
import { system } from '@/utils/twelvet'
import { RequestData } from '@ant-design/pro-table'
import { UseFetchDataAction } from '@ant-design/pro-table/lib/useFetchData'
import moment, { Moment } from 'moment'

/**
 * 登录日志
 */
const Login: React.FC<{}> = () => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const { RangePicker } = DatePicker

    // Form参数
    const columns: ProColumns = [
        {
            title: '任务名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'jobName',
        },
        {
            title: '任务组名', width: 200, valueType: "text", dataIndex: 'jobGroup'
        },
        {
            title: '调用目标方法', width: 200, valueType: "text", search: false, dataIndex: 'invokeTarget'
        },
        {
            title: '日志信息', width: 200, valueType: "text", search: false, dataIndex: 'jobMessage'
        },
        {
            title: '执行状态',
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                0: { text: '失败', status: 'error' },
                1: { text: '成功', status: 'success' },
            },
        },
        {
            title: '执行时间', width: 200, valueType: "text", search: false, dataIndex: 'createTime'
        },
        {
            title: '执行时间',
            key: 'between',
            hideInTable: true,
            dataIndex: 'between',
            renderFormItem: () => (
                <RangePicker format="YYYY-MM-DD" disabledDate={(currentDate: Moment) => {
                    // 不允许选择大于今天的日期
                    return moment(new Date(), 'YYYY-MM-DD') < currentDate
                }} />
            )
        },
        {
            title: '操作', fixed: 'right', width: 200, valueType: "option", search: false, dataIndex: 'operation', render: (_: string) => {
                return (
                    <a href='#'>
                        <Space>
                            <EyeOutlined />
                            详情
                        </Space>
                    </a>
                )
            }
        },
    ]

    /**
     * 移除
     * @param row jobLogIds
     */
    const refRemove = async (jobLogIds: (string | number)[] | undefined, action: UseFetchDataAction<RequestData<string>>) => {
        try {
            if (!jobLogIds) {
                return true
            }
            const { code, msg } = await remove(jobLogIds.join(","))
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
                formRef={formRef}
                rowKey="jobLogId"
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
                    <Popconfirm
                        onConfirm={() => {
                            exportExcel({
                                ...formRef.current?.getFieldsValue()
                            })
                        }}
                        title="是否导出数据"
                    >
                        <Button type="default">
                            <FundProjectionScreenOutlined />
                            导出数据
                        </Button>
                    </Popconfirm>,
                    <Popconfirm
                        onConfirm={() => refRemove(selectedRowKeys, action)}
                        title="是否清空"
                    >
                        <Button
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            清空
                        </Button>
                    </Popconfirm>
                ]}

            />
        </>
    )

}

export default Login