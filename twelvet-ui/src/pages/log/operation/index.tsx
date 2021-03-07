import React, { useState, useRef, useEffect } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, EyeOutlined } from '@ant-design/icons'
import ProDescriptions from '@ant-design/pro-descriptions'
import { Popconfirm, Button, message, Modal, DatePicker, Space, FormInstance } from 'antd'
import moment, { Moment } from 'moment'
import { pageQuery, remove, exportExcel, getDictionariesType } from './service'
import { system } from '@/utils/twelvet'

/**
 * 操作日志
 */
const Operation: React.FC<{}> = () => {

    const [descriptions, setDescriptions] = useState<{ [key: string]: String | number }>()

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const { RangePicker } = DatePicker

    const [operType, setOperType] = useState<{
        key: string
    }>()

    /**
     * 初始化数据
     */
    useEffect(() => {

        getOperType()
    }, [])

    /**
     * 获取操作类型数据
     */
    const getOperType = async () => {
        try {

            const { code, msg, data } = await getDictionariesType()

            if (code != 200) {
                message.error(msg)
            }

            let res: { key: string } = {}

            data.map((item: {
                dictValue: string
                dictLabel: string
            }) => {
                res[item.dictValue] = item.dictLabel
            })

            setOperType(res)
        } catch (e) {
            system.error(e)
        }
    }

    // Form参数
    const columns: ProColumns = [
        {
            title: '系统模块', ellipsis: true, width: 200, valueType: "text", dataIndex: 'service',
        },
        {
            title: '请求方式', search: false, width: 200, valueType: "text", dataIndex: 'requestMethod'
        },
        {
            title: '操作类型', ellipsis: false, width: 200, valueType: "text", search: false, dataIndex: 'businessType', render: (businessType: string) => {
                return operType && operType[businessType]
            }
        },
        {
            title: '操作人员', width: 200, valueType: "text", dataIndex: 'operName'
        },
        {
            title: '操作IP', width: 200, search: false, dataIndex: 'operIp'
        },
        {
            title: '操作状态', width: 200, search: false, dataIndex: 'status', valueEnum: {
                0: { text: '失败', status: 'error' },
                1: { text: '成功', status: 'success' },
            },
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
            title: '操作时间', width: 200, valueType: "dateTime", search: false, dataIndex: 'operTime'
        },
        {
            title: '操作', fixed: 'right', width: 200, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <a onClick={() => handleView(row)}>
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
     * 查看详情
     * @param row row
     */
    const handleView = (row: { [key: string]: String | number }) => {
        // 设置描述数据
        setDescriptions(row)

        setModal({ title: "新增", visible: true })
    }

    /**
     * 移除菜单
     * @param row infoIds
     */
    const refRemove = async (infoIds: (string | number)[] | undefined) => {
        try {
            if (!infoIds) {
                return true
            }
            const { code, msg } = await remove(infoIds.join(","))
            if (code !== 200) {
                return message.error(msg)
            }

            message.success(msg)

            acForm.current && acForm.current.reload()

        } catch (e) {
            system.error(e)
        }

    }

    /**
     * 取消Modal的显示
     */
    const handleCancel = () => {
        setModal({ title: "", visible: false })
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                formRef={formRef}
                rowKey="operId"
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

            <Modal
                title={`查看详情`}
                width={700}
                visible={modal.visible}
                okText={`${modal.title}`}
                onCancel={handleCancel}
                footer={null}
            >
                <ProDescriptions
                    column={2}
                >

                    <ProDescriptions.Item label="操作模块">
                        {descriptions && descriptions.service}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="请求方式">
                        {descriptions && descriptions.requestMethod}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="请求地址">
                        {descriptions && descriptions.operUrl}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="操作方法">
                        {descriptions && descriptions.method}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="请求参数" valueType="jsonCode">
                        {descriptions && descriptions.operParam}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="返回参数" valueType="jsonCode">
                        {descriptions && descriptions.jsonResult}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="操作状态">
                        {
                            descriptions && descriptions.status === 1 ? '正常' : '失败'
                        }
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="操作人员">
                        {descriptions && descriptions.operName}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="操作时间">
                        {descriptions && descriptions.operTime}
                    </ProDescriptions.Item>

                    <ProDescriptions.Item label="操作地点">
                        {descriptions && descriptions.operIp}
                    </ProDescriptions.Item>

                </ProDescriptions>

            </Modal>
        </>
    )

}

export default Operation