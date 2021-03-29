import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined, SettingOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, Radio, Space, Divider } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { pageQuery, remove, exportExcel, getBydictId, insert, update, clearCache } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'
import DrawerInfo from './components/drawerInfo/Index'

/**
 * 字典模块类型管理
 */
const Dictionaries: React.FC<{}> = () => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    const [drawerInfo, setDrawerInfo] = useState<{
        drawerInfoKey: string
        visible: boolean
    }>({
        drawerInfoKey: '',
        visible: false
    })

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
            title: '字典名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'dictName',
        },
        {
            title: '字典类型', width: 200, valueType: "text", dataIndex: 'dictType'
        },
        {
            title: '状态',
            ellipsis: false,
            width: 80,
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
            title: '操作', fixed: 'right', width: 320, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <>
                        <a onClick={() => refPut(row)}>
                            <Space>
                                <EditOutlined />
                                修改
                            </Space>
                        </a>

                        <Divider type="vertical" />

                        <a onClick={() => {
                            setDrawerInfo({
                                drawerInfoKey: row.dictType,
                                visible: true
                            })
                        }}>
                            <Space>
                                <SettingOutlined />
                                数据管理
                            </Space>
                        </a>

                        <Divider type="vertical" />
                        
                        <Popconfirm
                            onConfirm={() => refRemove(row.dictId)}
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
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改字典信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getBydictId(row.dictId)
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
     * @param row dictIds
     */
    const refRemove = async (dictIds: (string | number)[] | string | undefined) => {
        try {
            if (!dictIds) {
                return true
            }

            let params
            if (isArray(dictIds)) {
                params = dictIds.join(",")
            } else {
                params = dictIds
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
                        const { code, msg } = fields.dictId == 0 ? await insert(fields) : await update(fields)
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

    /**
     * 清空字典緩存
     */
    const clear = async () => {
        try {
            const { code, msg } = await clearCache()
            if (code != 200) {
                return message.error(msg)
            }
            message.success(msg)
        } catch (e) {
            system.error(e)
        }
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                formRef={formRef}
                rowKey="dictId"
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
                    </Popconfirm>,
                    <Popconfirm
                        title="是否清空缓存"
                        onConfirm={() => clear()}
                    >
                        <Button type="primary" danger>
                            <FundProjectionScreenOutlined />
                            清空缓存
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
                        label="字典ID"
                        name="dictId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="字典名称"
                        name="dictName"
                        rules={[{ required: true, message: '字典名称不能为空' }]}
                    >
                        <Input placeholder="字典名称" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="字典类型"
                        name="dictType"
                        rules={[{ required: true, message: '字典类型不能为空' }]}
                    >
                        <Input placeholder="字典类型" />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="字典状态"
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

            <DrawerInfo
                onClose={() => {
                    setDrawerInfo({
                        drawerInfoKey: '',
                        visible: false
                    })
                }}
                info={drawerInfo}
            />
        </>
    )

}

export default Dictionaries