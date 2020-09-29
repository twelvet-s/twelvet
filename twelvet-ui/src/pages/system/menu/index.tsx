import React, { useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable from '@/components/TwelveT/ProTable/Index'
import { createFromIconfontCN } from '@ant-design/icons'
import { Row, Col, Button, message, Space, Popconfirm, Modal, Form, Input, InputNumber, Radio, TreeSelect } from 'antd'
import { TableListItem } from './data'
import { list, getInfo } from './service'
import { system } from '@/utils/twelvet'


const Menu: React.FC<{}> = () => {

    // 是否加载中
    const [loading, setLoading] = useState(true)
    // 显示Modal
    const [modal, setModal] = useState({ title: ``, visible: false })
    // 菜单类型参数设置的显示
    const [menuType, setMenuType] = useState(`M`)
    const [form] = Form.useForm()

    // 创建远程Icon
    const IconFont = createFromIconfontCN()

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
            dataIndex: 'status',
            valueEnum: {
                1: { text: '正常', status: 'success' },
                0: { text: '关闭', status: 'error' },
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
                                <Button type="default" onClick={(row) => {
                                    setModal({
                                        title: "新增",
                                        visible: true
                                    })
                                }}>
                                    新增
                                </Button>
                            )
                        }

                        <Button type="primary" onClick={
                            async () => {
                                try {
                                    const { code, msg, data } = await getInfo(row.menuId)
                                    if (code != 200) {
                                        return message.error(msg)
                                    }
                                    setModal({
                                        title: "修改",
                                        visible: true
                                    })
                                } catch (e) {
                                    system.error(e)
                                }
                            }}
                        >
                            修改
                        </Button>

                        <Popconfirm
                            title="确定删除吗"
                        >
                            <Button type="primary" danger>删除</Button>
                        </Popconfirm>

                    </Space>
                )
            }
        },
    ]

    /**
     * 
     * @param dataSource 数据源
     * @param parentId 父Id
     */
    const makeTree = (dataSource: Array<{ [key: string]: any }>, parentId: number) => {

        let tree: Array<{ [key: string]: any }> = []

        dataSource.map((item: { [key: string]: any }) => {
            if (item['parentId'] == parentId) {
                // 获取子分类
                item['children'] = makeTree(dataSource, item['menuId'])
                // 加入数据
                tree.push({ ...item })
            }
        })

        return tree
    }

    /**
     * 取消Modal的显示
     */
    const handleCancel = () => {
        setMenuType(`M`)
        setModal({ title: "", visible: false })
    }

    const onSave = async () => {
        try {
            const values = await form.getFieldsValue();
            console.log('Success:', values);
        } catch (errorInfo) {
            console.log('Failed:', errorInfo);
        }
    }

    const onFinishFailed = (errorInfo: any) => {
        console.log('Failed:', errorInfo)
    }

    return (
        <>
            <TWTProTable
                rowKey="menuId"
                columns={columns}
                loading={loading}
                // 处理响应的数据
                postData={(dataSource) => {
                    const tree = makeTree(dataSource, 0)
                    setLoading(false)
                    return tree
                }}
                request={list}
                toolBarRender={() => [
                    <Button type="primary" onClick={(row) => {
                        setModal({
                            title: "新增",
                            visible: true
                        })
                    }}>
                        新增
                    </Button>
                ]}
                pagination={false}
            />

            <Modal
                title={`${modal.title}菜单`}
                width={700}
                visible={modal.visible}
                //confirmLoading={true}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="basic"
                    initialValues={{ remember: true }}
                    onFinishFailed={onFinishFailed}
                >
                    <Form.Item
                        label="上级菜单"
                        name="parentId"
                        rules={[{ required: true, message: '不能为空' }]}
                    >
                        <TreeSelect
                            dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                            placeholder="上级菜单"
                            allowClear
                            treeDefaultExpandAll
                        >
                            <TreeSelect.TreeNode value="parent 1" title="parent 1">
                                <TreeSelect.TreeNode value="parent 1-0" title="parent 1-0">
                                    <TreeSelect.TreeNode value="leaf1" title="my leaf" />
                                    <TreeSelect.TreeNode value="leaf2" title="your leaf" />
                                </TreeSelect.TreeNode>
                                <TreeSelect.TreeNode value="parent 1-1" title="parent 1-1">
                                    <TreeSelect.TreeNode value="sss" title={<b style={{ color: '#08c' }}>sss</b>} />
                                </TreeSelect.TreeNode>
                            </TreeSelect.TreeNode>
                        </TreeSelect>
                    </Form.Item>

                    <Form.Item
                        label="菜单类型"
                        name="menuType"
                        initialValue="M"
                        rules={[{ required: true, message: '不能为空' }]}
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
                        rules={[{ required: true, message: '不能为空' }]}
                    >
                        <Input placeholder="菜单图标" />
                    </Form.Item>

                    <Row>
                        <Col span={12}>
                            <Form.Item
                                label="菜单名称"
                                name="menuName"
                                rules={[{ required: true, message: '不能为空' }]}
                            >
                                <Input placeholder="菜单图标" />
                            </Form.Item>
                        </Col>

                        <Col span={12}>
                            <Form.Item
                                label="显示排序"
                                name="orderNum"
                                rules={[{ required: true, message: '不能为空' }]}
                            >
                                <InputNumber placeholder="排序" min={0} />
                            </Form.Item>
                        </Col>
                    </Row>

                    {
                        menuType == `C` && (
                            <>
                                <Row>
                                    <Col span={12}>
                                        <Form.Item
                                            label="是否外链"
                                            name="isFrame"
                                            initialValue={0}
                                            rules={[{ required: true, message: '不能为空' }]}
                                        >
                                            <Radio.Group>
                                                <Radio value={1}>是</Radio>
                                                <Radio value={0}>否</Radio>
                                            </Radio.Group>
                                        </Form.Item>
                                    </Col>

                                    <Col span={12}>
                                        <Form.Item
                                            label="路由地址"
                                            name="path"
                                            rules={[{ required: true, message: '不能为空' }]}
                                        >
                                            <Input placeholder="路由地址" />
                                        </Form.Item>
                                    </Col>
                                </Row>

                                <Row>
                                    <Col span={12}>
                                        <Form.Item
                                            label="组件路径"
                                            name="component"
                                            rules={[{ required: true, message: '不能为空' }]}
                                        >
                                            <Input placeholder="组件路径" />
                                        </Form.Item>
                                    </Col>

                                    <Col span={12}>
                                        <Form.Item
                                            label="权限标识"
                                            name="perms"
                                            rules={[{ required: true, message: '不能为空' }]}
                                        >
                                            <Input />
                                        </Form.Item>
                                    </Col>
                                </Row>

                            </>
                        )
                    }

                    <Row>
                        <Col span={12}>
                            <Form.Item
                                label="显示状态"
                                name="visible"
                                initialValue={1}
                                rules={[{ required: true, message: '不能为空' }]}
                            >
                                <Radio.Group>
                                    <Radio value={1}>是</Radio>
                                    <Radio value={0}>否</Radio>
                                </Radio.Group>
                            </Form.Item>
                        </Col>

                        <Col span={12}>
                            <Form.Item
                                label="菜单状态"
                                name="status"
                                initialValue={1}
                                rules={[{ required: true, message: '不能为空' }]}
                            >
                                <Radio.Group>
                                    <Radio value={1}>正常</Radio>
                                    <Radio value={0}>停用</Radio>
                                </Radio.Group>
                            </Form.Item>
                        </Col>
                    </Row>
                </Form>
            </Modal>
        </>
    )

}

export default Menu