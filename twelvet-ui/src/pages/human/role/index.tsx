import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import RoleStatusSwitch from './components/Switch'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, InputNumber, Radio, Tree, TreeSelect, Row, Col, Space, Divider } from 'antd'
import { FormInstance } from 'antd/lib/form'
import { pageQuery, remove, exportExcel, getByroleId, insert, update, roleMenuTreeSelectByMenuId, roleMenuTreeSelect, roleDeptTreeSelectByDeptId, roleDeptTreeSelect } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'
import { DataNode } from 'antd/lib/tree'
import { Key } from 'antd/lib/table/interface'

/**
 * 角色模块
 */
const Role: React.FC<{}> = () => {

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [form] = Form.useForm<FormInstance>()

    const [menuData, setMenuData] = useState<DataNode[]>()
    const [checkdMenuData, setCheckdMenuData] = useState<Key[]>([])
    const [finalCheckdMenuData, setFinalCheckdMenuData] = useState<Key[]>([])

    const [deptData, setDeptData] = useState<DataNode[]>()
    const [checkdDeptData, setCheckdDeptData] = useState<Key[]>([])

    // 权限范围
    const [dataScope, setDataScope] = useState<string>()

    const dataScopeOptions = [
        {
            key: '1',
            value: '1',
            title: "全部数据权限"
        },
        {
            key: '2',
            value: '2',
            title: "自定数据权限"
        },
        {
            key: '3',
            value: '3',
            title: "本部门数据权限"
        },
        {
            key: '4',
            value: '4',
            title: "本部门及以下数据权限"
        },
        {
            key: '5',
            value: '5',
            title: "仅本人数据权限"
        }
    ]

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
            title: '角色名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'roleName',
        },
        {
            title: '权限字符', width: 200, valueType: "text", dataIndex: 'roleKey'
        },
        {
            title: '显示顺序', width: 200, valueType: "text", search: false, dataIndex: 'roleSort'
        },
        {
            title: '状态',
            ellipsis: false,
            width: 80,
            dataIndex: 'status',
            render: (_: string, row: { [key: string]: string }) => [
                <RoleStatusSwitch row={row} key={row.roleId} />
            ]
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
                            onConfirm={() => refRemove(row.roleId)}
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
     * 新增角色
     * @param row row
     */
    const refPost = async () => {
        // 获取权限数据
        getMenuData()
        getDeptData()
        // 设置数据权限范围
        setDataScope("1")
        setModal({ title: "新增", visible: true })
    }

    /**
     * 获取修改角色信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            // 获取权限数据
            getMenuDataById(row.roleId)
            getDeptDataById(row.roleId)
            const { code, msg, data } = await getByroleId(row.roleId)
            if (code != 200) {
                return message.error(msg)
            }
            // 赋值表单数据
            form.setFieldsValue(data)

            // 设置数据权限范围
            setDataScope(data.dataScope)

            // 设置Modal状态
            setModal({ title: "修改", visible: true })

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 根据ID获取菜单权限数据
     */
    const getMenuDataById = async (roleId: number) => {
        try {
            const { code, msg, data } = await roleMenuTreeSelectByMenuId(roleId)
            if (code != 200) {
                return message.error(msg)
            }

            const { checkedMenus, menus } = data

            // 显示数据
            let keys: Key[] = []

            // 最终提交数据
            let finalkeys: Key[] = []

            // 初始化选中菜单数据
            checkedMenus.map((menu: {
                menuId: number
                menuType: String
            }) => {
                // 显示数据只需要C类型权限
                if (menu.menuType == 'F') {
                    keys.push(menu.menuId)
                }
                // 所有初始化数据都必须提交
                finalkeys.push(menu.menuId)
            })

            // 初始最终提交数据
            setFinalCheckdMenuData(finalkeys)

            // 显示数据
            setCheckdMenuData(keys)

            // 设置菜单数据
            setMenuData(menus)

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 获取菜单权限数据
     */
    const getMenuData = async () => {
        try {
            const { code, msg, data } = await roleMenuTreeSelect()
            if (code != 200) {
                return message.error(msg)
            }
            setMenuData(data)

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 根据Id获取部门数据
     */
    const getDeptDataById = async (roleId: number) => {
        try {
            const { code, msg, data } = await roleDeptTreeSelectByDeptId(roleId)
            if (code != 200) {
                return message.error(msg)
            }

            setCheckdDeptData(data.checkedKeys)
            setDeptData(data.depts)

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 获取部门数据
     */
    const getDeptData = async () => {
        try {
            const { code, msg, data } = await roleDeptTreeSelect()
            if (code != 200) {
                return message.error(msg)
            }

            setDeptData(data)

        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除角色
     * @param row roleIds
     */
    const refRemove = async (roleIds: (string | number)[] | string | undefined) => {
        try {
            if (!roleIds) {
                return true
            }

            let params
            if (isArray(roleIds)) {
                params = roleIds.join(",")
            } else {
                params = roleIds
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

        setCheckdDeptData([])
        setDeptData([])

        setCheckdMenuData([])
        setMenuData([])

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
                        // 设置菜单权限
                        fields.menuIds = finalCheckdMenuData
                        // 设置数据权限
                        fields.deptIds = checkdDeptData

                        // ID为0则insert，否则将update
                        const { code, msg } = fields.roleId == 0 ? await insert(fields) : await update(fields)
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
                rowKey="roleId"
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
                title={`${modal.title}角色`}
                visible={modal.visible}
                width={700}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Role"
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
                                label="角色名称"
                                name="roleName"
                                rules={[{ required: true, message: '角色名称不能为空' }]}
                            >
                                <Input placeholder="角色名称" />
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
                                label="权限字符"
                                name="roleKey"
                                rules={[{ required: true, message: '权限字符不能为空' }]}
                            >
                                <Input placeholder="权限字符" />
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
                                label="角色顺序"
                                name="roleSort"
                                initialValue={0}
                                rules={[{ required: true, message: '角色顺序不能为空' }]}
                            >
                                <InputNumber placeholder="角色顺序" />
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
                                label="角色状态"
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
                        label="菜单权限"
                        name="menuIds"
                    >
                        <Tree
                            showLine
                            checkable
                            height={150}
                            onCheck={(checkedKeys: any, halfChecked: any) => {

                                // 显示在页面的数据
                                setCheckdMenuData(checkedKeys)

                                // 解决无法选中未完全选中时，无法获取父ID
                                const keys = [...checkedKeys, ...halfChecked.halfCheckedKeys]
                                // 最终提交数据需加上父ID
                                setFinalCheckdMenuData(keys)

                            }}
                            // 默认选中的数据
                            checkedKeys={checkdMenuData}
                            treeData={menuData}
                        />
                    </Form.Item>

                    <Form.Item
                        {...formItemLayout}
                        label="权限范围"
                        name="dataScope"
                        initialValue={"1"}
                    >
                        <TreeSelect
                            // 支出搜索
                            showSearch
                            // 根据title进行搜索
                            treeNodeFilterProp="title"
                            treeData={dataScopeOptions}
                            onChange={(v: string) => {
                                setDataScope(v)
                            }}
                        />
                    </Form.Item>

                    {
                        dataScope === "2" && (
                            <Form.Item
                                {...formItemLayout}
                                label="数据权限"
                                name="deptIds"
                            >
                                <Tree
                                    showLine
                                    checkable
                                    height={150}
                                    onCheck={(checkedKeys: any) => {
                                        setCheckdDeptData(checkedKeys)
                                    }}
                                    checkedKeys={checkdDeptData}
                                    treeData={deptData}
                                />
                            </Form.Item>
                        )
                    }

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

export default Role