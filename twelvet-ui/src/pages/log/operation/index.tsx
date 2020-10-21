import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { createFromIconfontCN, DeleteOutlined, FundProjectionScreenOutlined, EyeOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, DatePicker, Input, Descriptions } from 'antd'
import moment from 'moment'
import { TableListItem } from './data'
import { pageQuery, remove, exportExcel } from './service'
import { system, makeTree } from '@/utils/twelvet'
import { FormInstance } from 'antd/lib/form'

/**
 * 菜单模块
 */
const Menu: React.FC<{}> = () => {
    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const [descriptions, setDescriptions] = useState({})

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    const acForm = useRef<ActionType>()
    const [form] = Form.useForm<FormInstance>()

    const { RangePicker } = DatePicker

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '系统模块', ellipsis: true, valueType: "text", dataIndex: 'service',
        },
        {
            title: '请求方式', hideInSearch: true, valueType: "text", dataIndex: 'requestMethod'
        },
        {
            title: '操作类型', valueType: "text", hideInSearch: true, dataIndex: 'orderNum'
        },
        {
            title: '操作人员', valueType: "text", dataIndex: 'operName'
        },
        {
            title: '操作地点', hideInSearch: true, dataIndex: 'component'
        },
        {
            title: '操作状态', hideInSearch: true, dataIndex: 'status', valueEnum: {
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
                <RangePicker format="YYYY-MM-DD" disabledDate={(currentDate: moment) => {
                    // 不允许选择大于今天的日期
                    return moment(new Date(), 'YYYY-MM-DD') < currentDate
                }} />
            )
        },
        {
            title: '操作时间', valueType: "dateTime", hideInSearch: true, dataIndex: 'operTime'
        },
        {
            title: '操作', valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <Button type="link" onClick={() => handleView(row)}>
                        <EyeOutlined />
                        详情
                    </Button>
                )
            }
        },
    ]

    /**
     * 查看详情
     * @param row row
     */
    const handleView = (row: { [key: string]: String }) => {
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

        form.resetFields()
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
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
                        title="是否删除选中数据，请再次确认！！！"
                    >
                        <Button
                            disabled={!(selectedRowKeys && selectedRowKeys.length > 0)}
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

            <Modal
                title={`查看详情`}
                width={700}
                visible={modal.visible}
                confirmLoading={loadingModal}
                okText={`${modal.title}`}
                onCancel={handleCancel}
                footer={null}
            >

                <Descriptions>
                    <Descriptions.Item label="操作模块">
                        {descriptions.service}
                    </Descriptions.Item>

                    <Descriptions.Item label="请求地址">
                        {descriptions.operUrl}
                    </Descriptions.Item>

                    <Descriptions.Item label="登录信息">
                        {descriptions.operName}
                    </Descriptions.Item>

                    <Descriptions.Item label="请求方式">
                        {descriptions.requestMethod}
                    </Descriptions.Item>

                    <Descriptions.Item label="操作方法">
                        {descriptions.method}
                    </Descriptions.Item>

                    <Descriptions.Item label="请求参数">
                        {descriptions.operParam}
                    </Descriptions.Item>

                    <Descriptions.Item label="返回参数">
                        {descriptions.jsonResult}
                    </Descriptions.Item>

                    <Descriptions.Item label="操作状态">
                        {
                            descriptions.status === 1 ? '正常' : '失败'
                        }
                    </Descriptions.Item>

                    <Descriptions.Item label="操作时间">
                        {descriptions.operTime}
                    </Descriptions.Item>
                </Descriptions>

            </Modal>
        </>
    )

}

export default Menu