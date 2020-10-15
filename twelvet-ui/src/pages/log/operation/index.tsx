import React, { useState, useRef } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { createFromIconfontCN, DeleteOutlined, FundProjectionScreenOutlined, EyeOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Modal, Form } from 'antd'
import { TableListItem } from './data'
import { pageQuery, remove } from './service'
import { system, makeTree } from '@/utils/twelvet'
import { FormInstance } from 'antd/lib/form'

/**
 * 菜单模块
 */
const Menu: React.FC<{}> = () => {
    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    const acForm = useRef<ActionType>()
    const [form] = Form.useForm<FormInstance>()

    // 创建远程Icon
    const IconFont = createFromIconfontCN()

    // Form参数
    const columns: ProColumns<TableListItem> = [
        {
            title: '系统模块', ellipsis: true, valueType: "text", dataIndex: 'service',
        },
        {
            title: '请求方式', valueType: "text", dataIndex: 'requestMethod'
        },
        {
            title: '操作类型', valueType: "text", hideInSearch: true, dataIndex: 'orderNum'
        },
        {
            title: '操作人员', hideInSearch: true, valueType: "text", dataIndex: 'operName'
        },
        {
            title: '操作地点', hideInSearch: true, dataIndex: 'component'
        },
        {
            title: '操作状态', hideInSearch: true, dataIndex: 'status', valueEnum: {
                0: { text: '失败', status: 'error' },
                1: { text: '成功', status: 'success' },
            },
        },
        {
            title: '操作时间', valueType: "dateTime", dataIndex: 'operTime'
        },
        {
            title: '操作', valueType: "option", dataIndex: 'operation', render: (_: string, row: { [key: string]: string }) => {
                return (
                    <Button type="link">
                        <EyeOutlined />
                        详情
                    </Button>
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
     * @param row infoIds
     */
    const refRemove = async (infoIds: (string | number)[] | undefined) => {
        try {
            if (!infoIds) {
                return true
            }
            const { code, msg } = await remove(infoIds.join(","))
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
                rowKey="operId"
                columns={columns}
                request={pageQuery}
                rowSelection={{}}
                toolBarRender={(action, { selectedRowKeys }) => [
                    <Popconfirm
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据，请再次确认！！！"
                    >
                        <Button
                            disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                            type="primary" danger
                        >
                            <DeleteOutlined />
                            批量删除
                        </Button>
                    </Popconfirm>,
                    <Button type="default">
                        <FundProjectionScreenOutlined />
                        导出数据
                    </Button>
                ]}

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
            </Modal>
        </>
    )

}

export default Menu