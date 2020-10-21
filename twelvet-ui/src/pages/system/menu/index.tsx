import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { createFromIconfontCN, PlusOutlined, CloseOutlined, EditOutlined } from '@ant-design/icons'
import { Row, Col, Button, message, Space, Popconfirm, Modal, Form, Input, InputNumber, Radio, TreeSelect } from 'antd'
import { TableListItem } from './data'
import { list, getInfo, remove, insert, update } from './service'
import { system, makeTree } from '@/utils/twelvet'
import { FormInstance } from 'antd/lib/form'

/**
 * 菜单模块
 */
const Menu: React.FC<{}> = () => {

    // 是否加载中菜单数据
    const [loading, setLoading] = useState<boolean>(true)
    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    // 菜单数据源
    const [dataSource, setDataSource] = useState<Array<{ [key: string]: any }>>([])

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 菜单类型参数设置的显示
    const [menuType, setMenuType] = useState<string>(`M`)
    const acForm = useRef<ActionType>()
    const [form] = Form.useForm<FormInstance>()

    // 创建远程Icon
    const IconFont = createFromIconfontCN()

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '菜单名称', ellipsis: true, valueType: "text", dataIndex: 'menuName',
        },
        {
            title: 'Icon', ellipsis: false, valueType: "text", hideInSearch: true, dataIndex: 'icon', render: (item: string) => {
                return < IconFont type={item} />
            }
        },
        {
            title: '排序', ellipsis: true, valueType: "text", hideInSearch: true, dataIndex: 'orderNum'
        },
        {
            title: '权限标识', hideInSearch: true, dataIndex: 'perms'
        },
        {
            title: '组件路径', hideInSearch: true, dataIndex: 'component'
        },
        {
            title: '状态',
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                true: { text: '正常', status: 'success' },
                false: { text: '停用', status: 'error' },
            },
        },
        {
            title: '创建时间', valueType: "dateTime", hideInSearch: true, dataIndex: 'createTime'
        },
        {
            title: '操作', hideInSearch: true, valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <Space>
                        {
                            row.menuType == `M` && (
                                <Button type="default" onClick={() => refPost(row)}>
                                    <PlusOutlined />
                                    新增
                                </Button>
                            )
                        }

                        <Button type="primary" onClick={() => refPut(row)}>
                            <EditOutlined />
                            修改
                        </Button >

                        <Popconfirm
                            onConfirm={() => refRemove(row)}
                            title="确定删除吗"
                        >
                            <Button type="primary" danger>
                                <CloseOutlined />
                                删除
                            </Button>
                        </Popconfirm>

                    </Space >
                )
            }
        },
    ]

    /**
     * 获取新增菜单信息
     * @param row row
     */
    const refPost = async (row: { [key: string]: any }) => {
        // 更新数据
        putData()

        const field: { [key: string]: any } = { parentId: row.menuId }
        // 设置表单数据
        form.setFieldsValue(field)

        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改菜单信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            // 更新菜单数据
            putData()
            const { code, msg, data } = await getInfo(row.menuId)
            if (code != 200) {
                return message.error(msg)
            }
            // 赋值表单数据
            form.setFieldsValue(data)

            // 设置菜单类型
            setMenuType(data.menuType)

            // 设置Modal状态
            setModal({ title: "修改", visible: true })

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 更新菜单数据(保证菜单数据的最新)
     */
    const putData = async () => {
        try {
            const { code, msg, data } = await list({})
            if (code != 200) {
                return message.error(msg)
            }

            const children = makeTree({
                dataSource: data,
                id: `menuId`,
                enhance: {
                    key: `menuId`,
                    title: `menuName`,
                    value: `menuId`
                }
            })

            setDataSource([
                {
                    key: 0,
                    title: `主目录`,
                    value: 0,
                    children
                }
            ])
        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除菜单
     * @param row row
     */
    const refRemove = async (row: { [key: string]: any }) => {
        try {
            const { code, msg } = await remove(row.menuId)
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

        setMenuType(`M`)
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
                        // menuId为0则insert，否则将update
                        const { code, msg } = fields.menuId == 0 ? await insert(fields) : await update(fields)
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
                rowKey="menuId"
                columns={columns}
                loading={loading}
                // 处理响应的数据
                postData={(dataSource) => {
                    const tree = makeTree({
                        dataSource: dataSource,
                        id: 'menuId'
                    })
                    setLoading(false)
                    return tree
                }}
                request={list}
                toolBarRender={() => [
                    <Button type="default" onClick={() => refPost({ menuId: 0 })}>
                        <PlusOutlined />
                        新增
                    </Button>
                ]}
                pagination={false}
            />

            <Modal
                title={`${modal.title}菜单`}
                width={700}
                visible={modal.visible}
                confirmLoading={loadingModal}
                okText={`${modal.title}`}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Menu"
                    form={form}
                >
                    <Form.Item
                        hidden
                        label="菜单ID"
                        name="menuId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Form.Item
                        label="上级菜单"
                        name="parentId"
                    >
                        <TreeSelect
                            // 支出搜索
                            showSearch
                            // 根据title进行搜索
                            treeNodeFilterProp="title"
                            dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                            placeholder="上级菜单"
                            treeData={dataSource}
                         />
                    </Form.Item>

                    <Form.Item
                        label="菜单类型"
                        name="menuType"
                        initialValue="M"
                    >
                        <Radio.Group
                            onChange={(e) => {
                                // 设置菜单状态
                                setMenuType(e.target.value)
                            }}>
                            <Radio value="M">目录</Radio>
                            <Radio value="C">菜单</Radio>
                            <Radio value="F">按钮</Radio>
                        </Radio.Group>
                    </Form.Item>

                    <Form.Item
                        label="菜单图标"
                        name="icon"
                        rules={[{ required: true, message: '菜单图标不能为空' }]}
                    >
                        <Input placeholder="菜单图标" />
                    </Form.Item>

                    <Row>
                        <Col span={12}>
                            <Form.Item
                                label="菜单名称"
                                name="menuName"
                                rules={[{ required: true, message: '菜单名称不能为空' }]}
                            >
                                <Input placeholder="菜单名称" />
                            </Form.Item>
                        </Col>

                        <Col span={12}>
                            <Form.Item
                                label="显示排序"
                                name="orderNum"
                                rules={[{ required: true, message: '菜单排序不能为空' }]}
                            >
                                <InputNumber placeholder="排序" min={0} />
                            </Form.Item>
                        </Col>
                    </Row>

                    {
                        menuType != `F` && (
                            <Row>
                                <Col span={12}>
                                    <Form.Item
                                        label="是否外链"
                                        name="isFrame"
                                        initialValue={false}
                                    >
                                        <Radio.Group>
                                            <Radio value={true}>是</Radio>
                                            <Radio value={false}>否</Radio>
                                        </Radio.Group>
                                    </Form.Item>
                                </Col>

                                <Col span={12}>
                                    <Form.Item
                                        label="路由地址"
                                        name="path"
                                        rules={[{ required: true, message: '路由地址不能为空' }]}
                                    >
                                        <Input placeholder="路由地址" />
                                    </Form.Item>
                                </Col>
                            </Row>
                        )
                    }

                    <Row>
                        {
                            menuType === `C` && (
                                <Col span={12}>
                                    <Form.Item
                                        label="组件路径"
                                        name="component"
                                        rules={[{ required: true, message: '组件路径不能为空' }]}
                                    >
                                        <Input placeholder="组件路径" />
                                    </Form.Item>
                                </Col>
                            )
                        }


                        {
                            menuType !== `M` && (
                                <Col span={12}>
                                    <Form.Item
                                        label="权限标识"
                                        name="perms"
                                        rules={[{ required: true, message: '权限标识不能为空' }]}
                                    >
                                        <Input placeholder="权限标识" />
                                    </Form.Item>
                                </Col>
                            )
                        }
                    </Row>

                    {
                        menuType !== 'F' && (
                            <Row>
                                <Col span={12}>
                                    <Form.Item
                                        label="显示状态"
                                        name="visible"
                                        initialValue={true}
                                    >
                                        <Radio.Group>
                                            <Radio value={true}>是</Radio>
                                            <Radio value={false}>否</Radio>
                                        </Radio.Group>
                                    </Form.Item>
                                </Col>

                                <Col span={12}>
                                    <Form.Item
                                        label="菜单状态"
                                        name="status"
                                        initialValue={true}
                                    >
                                        <Radio.Group>
                                            <Radio value={true}>正常</Radio>
                                            <Radio value={false}>停用</Radio>
                                        </Radio.Group>
                                    </Form.Item>
                                </Col>
                            </Row>
                        )
                    }
                </Form>
            </Modal>
        </>
    )

}

export default Menu