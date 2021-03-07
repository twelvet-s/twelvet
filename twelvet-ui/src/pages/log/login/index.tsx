import React, { useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, DatePicker } from 'antd'
import moment, { Moment } from 'moment'
import { pageQuery, remove, exportExcel } from './service'
import { system } from '@/utils/twelvet'
import { RequestData } from '@ant-design/pro-table'
import { UseFetchDataAction } from '@ant-design/pro-table/lib/useFetchData'
import { FormInstance } from 'antd/lib/form'

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
            title: '用户名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'userName',
        },
        {
            title: 'IP', width: 200, valueType: "text", dataIndex: 'ipaddr'
        },
        {
            title: '状态',
            ellipsis: false,
            dataIndex: 'status',
            width: 200,
            valueEnum: {
                1: { text: '正常', status: 'success' },
                0: { text: '停用', status: 'error' },
            },
        },
        {
            title: '登录信息', width: 200, valueType: "text", search: false, dataIndex: 'msg'
        },
        {
            title: '搜索日期',
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
            title: '登录时间', width: 200, valueType: "Date", search: false, dataIndex: 'accessTime'
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
                        title="是否导出数据"
                        onConfirm={() => {
                            exportExcel({
                                ...formRef.current?.getFieldsValue()
                            })
                        }}
                    >
                        <Button type="default">
                            <FundProjectionScreenOutlined />
                        导出数据
                    </Button>
                    </Popconfirm>
                ]}

            />
        </>
    )

}

export default Login