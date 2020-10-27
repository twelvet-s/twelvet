import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, InputNumber, Radio, Spin, Row, Col } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { TableListItem } from './data'
import { pageQuery, remove, exportExcel, getByUserId, insert, update } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'

/**
 * 职员模块
 */
const Staff: React.FC<{}> = () => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const [form] = Form.useForm<FormInstance>()

    const { TextArea } = Input

    const formItemLayout = {
        labelCol: {
            xs: { span: 4 },
            sm: { span: 4 },
        },
        wrapperCol: {
            xs: { span: 18 },
            sm: { span: 18 },
        },
    }

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '用户账号', ellipsis: true, valueType: "text", dataIndex: 'username',
        },
        {
            title: '用户昵称', valueType: "text", hideInSearch: true, dataIndex: 'nickName'
        },
        {
            title: '部门', valueType: "text", hideInSearch: true, dataIndex: 'postSort'
        },
        {
            title: '手机号码', valueType: "text", hideInSearch: true, dataIndex: 'phonenumber'
        },
        {
            title: '状态',
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                "1": { text: '正常', status: 'success' },
                "0": { text: '停用', status: 'error' },
            },
        },
        {
            title: '创建时间', hideInSearch: true, valueType: "dateTime", dataIndex: 'createTime'
        },
        {
            title: '操作', valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return [
                    <Button type="primary" onClick={() => refPut(row)}>
                        <EditOutlined />
                        修改
                    </Button>,
                    <Popconfirm
                        onConfirm={() => refRemove(row.userId)}
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
     * 新增职员
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改职员信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getByUserId(row.userId)
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
     * 移除职员
     * @param row userIds
     */
    const refRemove = async (userIds: (string | number)[] | string | undefined) => {
        try {
            if (!userIds) {
                return true
            }

            let params
            if (isArray(userIds)) {
                params = userIds.join(",")
            } else {
                params = userIds
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
                        const { code, msg } = fields.userId == 0 ? await insert(fields) : await update(fields)
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
                rowKey="userId"
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
                    </Popconfirm>,
                    <Popconfirm
                        title="是否导出数据"
                        onConfirm={() => exportExcel({ s: 1 })}
                    >
                        <Button type="default">
                            <FundProjectionScreenOutlined />
                            导出数据
                        </Button>
                    </Popconfirm>
                ]}

            />

            <Modal
                title={`${modal.title}职员`}
                visible={modal.visible}
                width={600}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Menu"
                    form={form}
                >
                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="角色ID"
                        name="roleId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="用户昵称"
                                name="roleName"
                                rules={[{ required: true, message: '用户昵称不能为空' }]}
                            >
                                <Input placeholder="用户昵称" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="研发部门"
                                name="roleKey"
                                rules={[{ required: true, message: '研发部门不能为空' }]}
                            >
                                <Input placeholder="研发部门" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="手机号码"
                                name="roleName"
                                rules={[{ required: true, message: '手机号码不能为空' }]}
                            >
                                <Input placeholder="手机号码" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="邮箱"
                                name="roleKey"
                                rules={[{ required: true, message: '邮箱不能为空' }]}
                            >
                                <Input placeholder="邮箱" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="用户性别"
                                name="roleName"
                                rules={[{ required: true, message: '用户性别不能为空' }]}
                            >
                                <Input placeholder="用户性别" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="状态"
                                name="roleKey"
                                rules={[{ required: true, message: '状态不能为空' }]}
                            >
                                <Input placeholder="状态" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="岗位"
                                name="roleSort"
                                initialValue={0}
                                rules={[{ required: true, message: '岗位不能为空' }]}
                            >
                                <InputNumber placeholder="岗位" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...{
                                    labelCol: {
                                        sm: { span: 8 },
                                    },
                                    wrapperCol: {
                                        sm: { span: 16 },
                                    },
                                }}
                                label="角色"
                                name="status"
                                initialValue={1}
                            >
                                <Radio.Group>
                                    <Radio value={1}>正常</Radio>
                                    <Radio value={0}>停用</Radio>
                                </Radio.Group>
                            </Form.Item>
                        </Col>
                    </Row>


                    <Form.Item
                        {...formItemLayout}
                        label="备注"
                        name="remark"
                    >
                        <TextArea placeholder="请输入内容" />
                    </Form.Item>

                </Form>

            </Modal>
        </>
    )

}

export default Staff