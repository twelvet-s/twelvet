import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, InputNumber, Radio, Space, Divider } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { pageQuery, remove, exportExcel, getByPostId, insert, update } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'

/**
 * 岗位模块
 */
const Post: React.FC<{}> = () => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

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
    const columns: ProColumns = [
        {
            title: '岗位编码', ellipsis: true, width: 200, valueType: "text", dataIndex: 'postCode',
        },
        {
            title: '岗位名称', width: 200, valueType: "text", dataIndex: 'postName'
        },
        {
            title: '岗位排序', width: 200, valueType: "text", search: false, dataIndex: 'postSort'
        },
        {
            title: '状态',
            width: 80,
            dataIndex: 'status',
            valueEnum: {
                "1": { text: '正常', status: 'success' },
                "0": { text: '停用', status: 'error' },
            },
        },
        {
            title: '创建时间', search: false, width: 200, valueType: "dateTime", dataIndex: 'createTime'
        },
        {
            title: '操作', fixed: 'right', width: 200, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <>
                        <a onClick={() => refPut(row)}>
                            <Space>
                                <EditOutlined />
                                修改
                            </Space>
                        </a>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => refRemove(row.postId)}
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
     * 新增岗位
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改岗位信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getByPostId(row.postId)
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
     * 移除岗位
     * @param row postIds
     */
    const refRemove = async (postIds: (string | number)[] | string | undefined) => {
        try {
            if (!postIds) {
                return true
            }

            let params
            if (isArray(postIds)) {
                params = postIds.join(",")
            } else {
                params = postIds
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
                        const { code, msg } = fields.postId == 0 ? await insert(fields) : await update(fields)
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
                formRef={formRef}
                rowKey="postId"
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
                title={`${modal.title}岗位`}
                visible={modal.visible}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Post"
                    form={form}
                >
                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="岗位ID"
                        name="postId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="岗位名称"
                        name="postName"
                        rules={[{ required: true, message: '岗位名称不能为空' }]}
                    >
                        <Input placeholder="岗位名称" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="岗位编码"
                        name="postCode"
                        rules={[{ required: true, message: '岗位编码不能为空' }]}
                    >
                        <Input placeholder="岗位编码" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="岗位顺序"
                        name="postSort"
                        initialValue={0}
                        rules={[{ required: true, message: '岗位顺序不能为空' }]}
                    >
                        <InputNumber placeholder="岗位顺序" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="岗位状态"
                        name="status"
                        initialValue="1"
                    >
                        <Radio.Group>
                            <Radio value="1">正常</Radio>
                            <Radio value="0">停用</Radio>
                        </Radio.Group>
                    </Form.Item>

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

export default Post