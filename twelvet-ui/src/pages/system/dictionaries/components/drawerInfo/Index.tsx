import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import SelectType from './components/selectType/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, Radio, Drawer, InputNumber, Divider, Space } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { pageQuery, remove, exportExcel, getBydictCode, insert, update } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'

/**
 * 字典模块数据管理
 */
const DrawerInfo: React.FC<{
    info: {
        drawerInfoKey: string
        visible: boolean
    }
    onClose: () => void
}> = (props) => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [form] = Form.useForm<FormInstance>()

    const { TextArea } = Input

    const { info, onClose } = props

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
            title: '字典名称',
            key: 'dictType',
            hideInTable: true,
            initialValue: props.info.drawerInfoKey,
            dataIndex: 'dictType',
            renderFormItem: () => <SelectType {...props} />
        },
        {
            title: '字典标签', ellipsis: true, width: 200, valueType: "text", dataIndex: 'dictLabel',
        },
        {
            title: '字典键值', search: false, width: 200, valueType: "text", dataIndex: 'dictValue'
        },
        {
            title: '字典排序', search: false, width: 200, valueType: "text", dataIndex: 'dictSort'
        },
        {
            title: '状态',
            width: 200,
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                1: { text: '正常', status: 'success' },
                0: { text: '停用', status: 'error' },
            },
        },
        {
            title: '备注', search: false, width: 200, valueType: "text", dataIndex: 'remark'
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
                            onConfirm={() => refRemove(row.dictCode)}
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
     * 新增字典
     * @param row row
     */
    const refPost = async () => {
        form.setFieldsValue({
            dictType: props.info.drawerInfoKey
        })
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改字典信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getBydictCode(row.dictCode)
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
     * 移除字典
     * @param row dictCodes
     */
    const refRemove = async (dictCodes: (string | number)[] | string | undefined) => {
        try {
            if (!dictCodes) {
                return true
            }

            let params
            if (isArray(dictCodes)) {
                params = dictCodes.join(",")
            } else {
                params = dictCodes
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
                        const { code, msg } = fields.dictCode == 0 ? await insert(fields) : await update(fields)
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
        <Drawer
            // 关闭时销毁子元素
            destroyOnClose={true}
            width="80%"
            placement="right"
            closable={false}
            onClose={() => {
                onClose()
            }}
            visible={info.visible}
        >
            <TWTProTable
                headerTitle='数据管理'
                actionRef={acForm}
                formRef={formRef}
                rowKey="dictCode"
                columns={columns}
                request={pageQuery}
                rowSelection={{}}
                // beforeRequest={(params) => {
                //     // 加入类型
                //     params.dictType = props.info.drawerInfoKey
                // }}
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
                title={`${modal.title}字典`}
                visible={modal.visible}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Dictionaries"
                    form={form}
                >

                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="字典Code"
                        name="dictCode"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="字典类型"
                        name="dictType"
                    >
                        <Input disabled placeholder="字典类型" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="数据标签"
                        name="dictLabel"
                        rules={[{ required: true, message: '数据标签不能为空' }]}
                    >
                        <Input placeholder="数据标签" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="数据键值"
                        name="dictValue"
                        rules={[{ required: true, message: '数据键值不能为空' }]}
                    >
                        <Input placeholder="数据键值" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="显示排序"
                        name="dictSort"
                        initialValue={0}
                        rules={[{ required: true, message: '显示排序不能为空' }]}
                    >
                        <InputNumber />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="状态"
                        name="status"
                        initialValue={1}
                    >
                        <Radio.Group>
                            <Radio value={1}>正常</Radio>
                            <Radio value={0}>停用</Radio>
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
        </Drawer>
    )

}

export default DrawerInfo