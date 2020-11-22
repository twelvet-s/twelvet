import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, PlusOutlined, EditOutlined, CloseOutlined, QuestionCircleOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, InputNumber, Tooltip } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { TableListItem } from './data'
import { pageQuery, remove, getByClientId, insert, update } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'

/**
 * 终端模块
 */
const Post: React.FC<{}> = () => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const [form] = Form.useForm<FormInstance>()


    const formItemLayout = {
        labelCol: {
            xs: { span: 5 },
            sm: { span: 5 },
        },
        wrapperCol: {
            xs: { span: 16 },
            sm: { span: 16 },
        },
    }

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '编号', valueType: "text", dataIndex: 'clientId',
        },
        {
            title: '授权范围', valueType: "text", search: false, dataIndex: 'scope'
        },
        {
            title: '授权类型', valueType: "text", search: false, dataIndex: 'authorizedGrantTypes'
        },
        {
            title: '令牌有效期', valueType: "text", search: false, dataIndex: 'accessTokenValidity'
        },
        {
            title: '刷新令牌有效期', valueType: "text", search: false, dataIndex: 'refreshTokenValidity'
        },
        {
            title: '操作', valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return [
                    <Button type="primary" onClick={() => refPut(row)}>
                        <EditOutlined />
                        修改
                    </Button>,
                    <Popconfirm
                        onConfirm={() => refRemove(row.clientId)}
                        title="确定删除吗"
                    >
                        <Button type="primary" danger>
                            <CloseOutlined />
                             删除
                        </Button>
                    </Popconfirm>
                ]
            }
        },
    ]

    /**
     * 新增终端
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改终端信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getByClientId(row.clientId)
            if (code != 200) {
                return message.error(msg)
            }
            // 赋值表单数据
            form.setFieldsValue(data)

            // 设置Modal状态
            setModal({ title: "修改", visible: true })

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除终端
     * @param row clientIds
     */
    const refRemove = async (clientIds: (string | number)[] | string | undefined) => {
        try {
            if (!clientIds) {
                return true
            }

            let params
            if (isArray(clientIds)) {
                params = clientIds.join(",")
            } else {
                params = clientIds
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

    /**
     * 取消Modal的显示
     */
    const handleCancel = () => {
        setModal({ title: "", visible: false })
        form.resetFields()
    }

    /**
     * 保存数据
     */
    const onSave = () => {
        form
            .validateFields()
            .then(
                async (fields) => {
                    try {
                        // 开启加载中
                        setLoadingModal(true)
                        // ID为0则insert，否则将update
                        const { code, msg } = modal.title == '新增' ? await insert(fields) : await update(fields)
                        if (code != 200) {
                            return message.error(msg)
                        }

                        message.success(msg)

                        if (acForm.current) {
                            acForm.current.reload()
                        }

                        // 关闭模态框
                        handleCancel()
                    } catch (e) {
                        system.error(e)
                    } finally {
                        setLoadingModal(false)
                    }
                }).catch(e => {
                    system.error(e)
                })
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                rowKey="clientId"
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
                    <Button type="default" onClick={refPost}>
                        <PlusOutlined />
                        新增
                    </Button>,
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
                    </Popconfirm>
                ]}

            />

            <Modal
                title={`${modal.title}终端`}
                visible={modal.visible}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                width={700}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Menu"
                    form={form}
                >

                    <Form.Item
                        {...formItemLayout}
                        label="编号"
                        name="clientId"
                    >
                        <Input placeholder="编号" disabled={modal.title == '修改' ? true : false} />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label={
                            <Tooltip title="
                                不填写默认不更改
                            ">
                                安全码 <QuestionCircleOutlined />
                            </Tooltip>
                        }
                        name="clientSecret"
                    >
                        <Input placeholder="安全码" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="授权范围"
                        name="scope"
                        rules={[{ required: true, message: '授权范围不能为空' }]}
                    >
                        <Input placeholder="授权范围" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label={
                            <Tooltip title={() => [
                                <p>注意：多个请使用英文,分割</p>,
                                <p>授权码模式：authorization_code</p>,
                                <p>密码模式： password</p>,
                                <p>客户端模式： client_credentials</p>,
                                <p>简化模式：implicit</p>,
                                <p>支持token续时：refresh_token</p>
                            ]}>
                                授权类型 <QuestionCircleOutlined />
                            </Tooltip>
                        }
                        name="authorizedGrantTypes"
                        rules={[{ required: true, message: '授权范围不能为空' }]}
                    >
                        <Input placeholder='授权范围' />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="令牌时效（ms）"
                        name="accessTokenValidity"
                        initialValue={3600}
                        rules={[{ required: true, message: '令牌时效不能为空' }]}
                    >
                        <InputNumber placeholder="令牌时效" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="刷新时效（ms）"
                        name="refreshTokenValidity"
                        initialValue={7200}
                        rules={[{ required: true, message: '刷新时效不能为空' }]}
                    >
                        <InputNumber placeholder="刷新时效" />
                    </Form.Item>

                </Form>

            </Modal>
        </>
    )

}

export default Post