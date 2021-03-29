import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { PlusOutlined, CloseOutlined, EditOutlined } from '@ant-design/icons'
import { Row, Col, Button, message, Space, Popconfirm, Modal, Form, Input, InputNumber, Radio, TreeSelect, Divider } from 'antd'
import { list, getInfo, remove, insert, update } from './service'
import { system, makeTree } from '@/utils/twelvet'
import { FormInstance } from 'antd/lib/form'

/**
 * 部门模块
 */
const Dept: React.FC<{}> = () => {

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    // 部门数据源
    const [dataSource, setDataSource] = useState<Array<{ [key: string]: any }>>([])

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    const acForm = useRef<ActionType>()
    const [form] = Form.useForm<FormInstance>()

    const formItemLayout = {
        labelCol: {
            sm: { span: 6 },
        },
        wrapperCol: {
            sm: { span: 16 },
        },
    }

    // Form参数
    const columns: ProColumns = [
        {
            title: '部门名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'deptName',
        },
        {
            title: '排序', ellipsis: false, width: 200, valueType: "text", search: false, dataIndex: 'orderNum'
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
            title: '创建时间', width: 200, valueType: "dateTime", search: false, dataIndex: 'createTime'
        },
        {
            title: '操作', fixed: 'right', search: false, width: 200, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <>
                        {
                            row.menuType == `M` && (
                                <>
                                    <a onClick={() => refPost(row)}>
                                        <Space>
                                            <PlusOutlined />
                                            新增
                                        </Space>
                                    </a>
                                    <Divider type="vertical" />
                                </>
                            )
                        }
                        
                        <a onClick={() => refPut(row)}>
                            <Space>
                                <EditOutlined />
                                修改
                            </Space>
                        </a >
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => refRemove(row)}
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
     * 获取新增部门信息
     * @param row row
     */
    const refPost = async (row: { [key: string]: any }) => {
        // 更新数据
        putData()

        const field: { [key: string]: any } = { parentId: row.deptId }
        // 设置表单数据
        form.setFieldsValue(field)

        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改部门信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            // 更新部门数据
            putData()
            const { code, msg, data } = await getInfo(row.deptId)
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
     * 更新部门数据(保证部门数据的最新)
     */
    const putData = async () => {
        try {
            const { code, msg, data } = await list({})
            if (code != 200) {
                return message.error(msg)
            }

            const tree = makeTree({
                dataSource: data,
                id: `deptId`,
                enhance: {
                    key: `deptId`,
                    title: `deptName`,
                    value: `deptId`
                }
            })

            setDataSource(tree)
        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除部门
     * @param row row
     */
    const refRemove = async (row: { [key: string]: any }) => {
        try {
            const { code, msg } = await remove(row.deptId)
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
                        // deptId为0则insert，否则将update
                        const { code, msg } = fields.deptId == 0 ? await insert(fields) : await update(fields)
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
                rowKey="deptId"
                columns={columns}
                defaultExpandAllRows={true}
                // 处理响应的数据
                postData={(dataSource) => {
                    const tree = makeTree({
                        dataSource: dataSource,
                        id: 'deptId'
                    })
                    return tree
                }}
                request={list}
                toolBarRender={() => [
                    <Button type="default" onClick={() => refPost({ deptId: 0 })}>
                        <PlusOutlined />
                        新增
                    </Button>
                ]}
                pagination={false}
            />

            <Modal
                title={`${modal.title}部门`}
                width={700}
                visible={modal.visible}
                confirmLoading={loadingModal}
                okText={`${modal.title}`}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Dept"
                    form={form}
                >
                    <Form.Item
                        hidden
                        label="部门ID"
                        name="deptId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...{
                            labelCol: {
                                sm: { span: 3 },
                            },
                            wrapperCol: {
                                sm: { span: 16 },
                            },
                        }}
                        label="上级部门"
                        name="parentId"
                    >
                        <TreeSelect
                            // 支持搜索
                            showSearch
                            // 根据title进行搜索
                            treeNodeFilterProp="title"
                            dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                            placeholder="上级部门"
                            treeData={dataSource}
                        />
                    </Form.Item>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="部门名称"
                                name="deptName"
                                rules={[{ required: true, message: '部门名称不能为空' }]}
                            >
                                <Input placeholder="部门名称" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="显示排序"
                                name="orderNum"
                                rules={[{ required: true, message: '部门排序不能为空' }]}
                            >
                                <InputNumber placeholder="排序" min={0} />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="负责人"
                                name="leader"
                            >
                                <Input placeholder="负责人" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="联系电话"
                                name="phone"
                            >
                                <Input placeholder="联系电话" />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="邮箱"
                                name="email"
                            >
                                <Input placeholder="邮箱" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="状态"
                                name="status"
                            >
                                <Radio.Group>
                                    <Radio value={'1'}>正常</Radio>
                                    <Radio value={'0'}>停用</Radio>
                                </Radio.Group>
                            </Form.Item>

                        </Col>
                    </Row>

                </Form>
            </Modal>
        </>
    )

}

export default Dept