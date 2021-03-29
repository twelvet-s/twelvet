import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { DeleteOutlined, FundProjectionScreenOutlined, PlusOutlined, EditOutlined, CloseOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form, Input, Radio, Row, Col, Select, TreeSelect, DatePicker, Space, Divider } from 'antd'
import { FormInstance } from 'antd/lib/form'
import DpetSearch from './components/dpetSearch/Index'
import ImportStaff from './components/importStaff/Index'
import StaffStatusSwitch from './components/staffStatusSwitch/Index'
import { pageQuery, remove, exportExcel, getByStaffId, getByStaff, insert, update, treeSelect } from './service'
import { system } from '@/utils/twelvet'
import { isArray } from 'lodash'
import moment, { Moment } from 'moment'

/**
 * 职员模块
 */
const Staff: React.FC<{}> = () => {

    const { RangePicker } = DatePicker

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean, modelType: string }>({ title: ``, visible: false, modelType: '' })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const [importStaffVisible, setImportStaffVisible] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [form] = Form.useForm<FormInstance>()

    // 部门数据
    const [DEPTS, setDEPTS] = useState<Array<{ [key: string]: any }>>([])

    // 岗位数据
    const [POSTS, setPOSTS] = useState<Array<{ [key: string]: any }>>([])

    // 角色数据
    const [ROLES, setROLES] = useState<Array<{ [key: string]: any }>>([])

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
            title: '部门',
            key: 'deptId',
            hideInTable: true,
            dataIndex: 'deptId',
            renderFormItem: () => <DpetSearch placeholder="部门" />
        },
        {
            title: '用户账号', width: 200, valueType: "text", dataIndex: 'username',
        },
        {
            title: '用户昵称', width: 200, valueType: "text", search: false, dataIndex: 'nickName'
        },
        {
            title: '部门', width: 200, ellipsis: false, valueType: "text", search: false, dataIndex: 'dept', render: (dept: {
                deptName: string
            }) => {
                return dept.deptName
            }
        },
        {
            title: '手机号码', width: 200, valueType: "text", dataIndex: 'phonenumber'
        },
        {
            title: '状态',
            ellipsis: false,
            width: 80,
            dataIndex: 'status',
            render: (_: string, row: { [key: string]: string }) => (
                <StaffStatusSwitch row={row} />
            )
        },
        {
            title: '创建时间', search: false, width: 200, valueType: "dateTime", dataIndex: 'createTime'
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
                            onConfirm={() => refRemove(row.userId)}
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
     * 新增职员
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true, modelType: 'POST' })
        // 获取新增用户所属数据
        const { code, msg, data } = await getByStaff()
        if (code != 200) {
            return message.error(msg)
        }

        const { posts, roles } = data

        let POSTS: Array<{ [key: string]: any }> = new Array<{ [key: string]: any }>()
        // 制作岗位数据
        posts.filter((item: {
            postName: string,
            postId: number,
        }
        ) => {
            POSTS.push({
                title: item.postName,
                key: item.postId,
                value: item.postId
            })
        })

        setPOSTS(POSTS)

        let ROLES: Array<{ [key: string]: any }> = new Array<{ [key: string]: any }>()
        // 制作岗位数据
        roles.filter((item: {
            roleName: string,
            roleId: number,
        }) => {
            ROLES.push({
                title: item.roleName,
                key: item.roleId,
                value: item.roleId
            })
        })

        setROLES(ROLES)

        // 获得部门数据
        makeDept()
    }

    /**
     * 获取修改职员信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getByStaffId(row.userId)
            if (code != 200) {
                return message.error(msg)
            }

            const { staff, posts, postIds, roles, roleIds } = data

            staff.postIds = postIds
            staff.roleIds = roleIds

            // 赋值表单数据
            form.setFieldsValue(staff)


            let POSTS: Array<{ [key: string]: any }> = new Array<{ [key: string]: any }>()
            // 制作岗位数据
            posts.filter((item: {
                postName: string,
                postId: number,
            }
            ) => {
                POSTS.push({
                    title: item.postName,
                    key: item.postId,
                    value: item.postId
                })
            })

            setPOSTS(POSTS)

            let ROLES: Array<{ [key: string]: any }> = new Array<{ [key: string]: any }>()
            // 制作岗位数据
            roles.filter((item: {
                roleName: string,
                roleId: number,
            }) => {
                ROLES.push({
                    title: item.roleName,
                    key: item.roleId,
                    value: item.roleId
                })
            })

            setROLES(ROLES)

            // 获得部门数据
            makeDept()

            // 设置Modal状态
            setModal({ title: "修改", visible: true, modelType: 'PUT' })

        } catch (e) {
            system.error(e)
        }
    }

    const makeDept = async () => {
        try {
            const { code, msg, data } = await treeSelect()
            if (code != 200) {
                return message.error(msg)
            }

            setDEPTS(data)

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
        setModal({ title: "", visible: false, modelType: '' })
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
                formRef={formRef}
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
                    <Button type="primary" onClick={() => {
                        setImportStaffVisible(true)
                    }}>
                        <PlusOutlined />
                        导入数据
                    </Button>
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
                    name="Staff"
                    form={form}
                >
                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="角色ID"
                        name="userId"
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
                                name="nickName"
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
                                label="归属部门"
                                name="deptId"
                                rules={[{ required: true, message: '归属部门不能为空' }]}
                            >
                                <TreeSelect
                                    showSearch
                                    treeLine
                                    treeNodeFilterProp="title"
                                    treeData={DEPTS}
                                />
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
                                name="phonenumber"
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
                                name="email"
                                rules={[{ required: true, message: '邮箱不能为空' }]}
                            >
                                <Input placeholder="邮箱" />
                            </Form.Item>
                        </Col>
                    </Row>

                    {
                        modal.modelType === 'POST' && (
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
                                        label="登录账号"
                                        name="username"
                                        rules={[{ required: true, message: '登录账号不能为空' }]}
                                    >
                                        <Input placeholder="登录账号" />
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
                                        label="用户密码"
                                        name="password"
                                        rules={[{ required: true, message: '密码不能为空' }]}
                                    >
                                        <Input placeholder="密码" />
                                    </Form.Item>
                                </Col>
                            </Row>
                        )
                    }

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
                                name="sex"
                                initialValue={0}
                                rules={[{ required: true, message: '请选择用户性别' }]}
                            >
                                <Select >
                                    <Select.Option value={0}>男</Select.Option>
                                    <Select.Option value={1}>女</Select.Option>
                                    <Select.Option value={2}>保密</Select.Option>
                                </Select >
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
                                name="status"
                                initialValue={1}
                            >
                                <Radio.Group>
                                    <Radio value={1}>正常</Radio>
                                    <Radio value={0}>冻结</Radio>
                                </Radio.Group>
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
                                name="postIds"
                                rules={[{ required: true, message: '岗位不能为空' }]}
                            >
                                <TreeSelect
                                    treeNodeFilterProp="title"
                                    treeCheckable={true}
                                    treeData={POSTS}
                                />
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
                                name="roleIds"
                            >
                                <TreeSelect
                                    treeNodeFilterProp="title"
                                    treeCheckable={true}
                                    treeData={ROLES}
                                />
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

            <ImportStaff
                visible={importStaffVisible}
                onCancel={() => {
                    setImportStaffVisible(false)
                }}
                ok={() => {
                    acForm.current?.reload()
                }}
            />
        </>
    )

}

export default Staff