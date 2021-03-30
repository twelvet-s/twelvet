import React, { useEffect, useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { CaretRightOutlined, DeleteOutlined, EditOutlined, EyeOutlined, FundProjectionScreenOutlined, PlusOutlined } from '@ant-design/icons'
import { Popconfirm, Button, message, Space, Radio, Form, Modal, Input, Row, Col, Tooltip, Divider } from 'antd'
import { pageQuery, remove, exportExcel, run, insert, update, getByJobId } from './service'
import { system } from '@/utils/twelvet'
import JobStatus from './components/jobStatusSwitch/Index'
import Details from './components/details/Index'
import { FormInstance } from 'antd/lib/form'
import { isArray } from 'lodash'
import DictionariesSelect from '@/components/TwelveT/Dictionaries/DictionariesSelect/Index'

/**
 * 定时任务
 */
const Job: React.FC<{}> = () => {

    const formItemLayout = {
        labelCol: {
            sm: { span: 6 },
        },
        wrapperCol: {
            sm: { span: 16 },
        },
    }

    const [form] = Form.useForm<FormInstance>()

    // 显示Modal
    const [modal, setModal] = useState<{ title: string, visible: boolean }>({ title: ``, visible: false })

    // 是否执行Modal数据操作中
    const [loadingModal, setLoadingModal] = useState<boolean>(false)

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [modelDetails, setModelDetails] = useState<{
        vimodelDetails: boolean
        jobId: number
    }>({
        vimodelDetails: false,
        jobId: 0
    })


    // Form参数
    const columns: ProColumns = [
        {
            title: '任务名称', ellipsis: true, width: 200, valueType: "text", dataIndex: 'jobName',
        },
        {
            title: '任务组名', width: 200, valueType: "text", dataIndex: 'jobGroup'
        },
        {
            title: '调用目标字符串', width: 200, valueType: "text", search: false, dataIndex: 'invokeTarget'
        },
        {
            title: 'cron执行表达式', search: false, width: 200, valueType: "text", dataIndex: 'cronExpression'
        },
        {
            title: '状态',
            ellipsis: false,
            dataIndex: 'status',
            valueEnum: {
                0: { text: '失败', status: 'error' },
                1: { text: '成功', status: 'success' },
            },
            render: (_: string, row: { [key: string]: string }) => [
                <JobStatus row={row} />
            ]
        },
        {
            title: '操作', fixed: 'right', width: 380, valueType: "option", search: false, dataIndex: 'operation', render: (
                _: string,
                row: { [key: string]: string }) => {
                return (
                    <>
                        <a onClick={() => refPut(row)}>
                            <Space>
                                <EditOutlined />
                                修改
                            </Space>
                        </a >
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => runJob(row)}
                            title="是否执行任务"
                        >
                            <a href='#'>
                                <Space>
                                    <CaretRightOutlined />
                                    执行
                                </Space>
                            </a >
                        </Popconfirm>
                        <Divider type="vertical" />
                        <a type="default" onClick={() => {
                            setModelDetails({
                                vimodelDetails: true,
                                jobId: row.jobId
                            })
                        }}>
                            <Space>
                                <EyeOutlined />
                                详情
                            </Space>
                        </a>
                        <Divider type="vertical" />
                        <Popconfirm
                            onConfirm={() => refRemove(row.jobId)}
                            title="是否删除"
                        >
                            <a href='#'>
                                <Space>
                                    <DeleteOutlined />
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
     * 初始化数据
     */
    useEffect(() => {

    }, [])

    /**
     * 获取修改菜单信息
     * @param row row
     */
    const refPut = async (row: { [key: string]: any }) => {
        try {
            const { code, msg, data } = await getByJobId(row.jobId)
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
     * 执行任务
     * @param row 
     */
    const runJob = async (row: { [key: string]: any }) => {
        try {
            // 参数
            const params = {
                jobId: row.jobId,
                jobGroup: row.jobGroup
            }

            const { code, msg } = await run(params)
            if (code != 200) {
                return message.error(msg)
            }
            message.success(msg)
        } catch (e) {
            system.error(e)
        }
    }

    /**
     * 移除任务
     * @param row jobIds
     */
    const refRemove = async (jobIds: (string | number)[] | undefined) => {
        try {
            if (!jobIds) {
                return true
            }


            let params: string;
            if (isArray(jobIds)) {
                params = jobIds.join(",")
            } else {
                params = jobIds
            }

            const { code, msg } = await remove(params)
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
     * 新增任务
     * @param row row
     */
    const refPost = async () => {
        setModal({ title: "新增", visible: true })
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
                        const { code, msg } = fields.jobId == 0 ? await insert(fields) : await update(fields)
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
     * 取消Modal的显示
     */
    const handleCancel = () => {
        setModal({ title: "", visible: false })
        form.resetFields()
    }

    return (
        <>
            <TWTProTable
                actionRef={acForm}
                formRef={formRef}
                rowKey="jobId"
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
                        disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
                        onConfirm={() => refRemove(selectedRowKeys)}
                        title="是否删除选中数据"
                    >
                        <Button
                            disabled={selectedRowKeys && selectedRowKeys.length > 0 ? false : true}
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
                title={`${modal.title}任务`}
                width={700}
                visible={modal.visible}
                okText={`${modal.title}`}
                confirmLoading={loadingModal}
                onOk={onSave}
                onCancel={handleCancel}
            >

                <Form
                    name="Job"
                    form={form}
                >

                    <Form.Item
                        hidden
                        {...formItemLayout}
                        label="任务ID"
                        name="jobId"
                        initialValue={0}
                    >
                        <Input />
                    </Form.Item>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="任务名称"
                                name="jobName"
                                rules={[{ required: true, message: '任务名称不能为空' }]}
                            >
                                <Input placeholder="任务名称" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="任务分组"
                                name="jobGroup"
                                rules={[{ required: true, message: '任务分组不能为空' }]}
                            >
                                <DictionariesSelect type='sys_job_group' />
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item
                        {
                        ...{
                            labelCol: {
                                sm: { span: 3 },
                            },
                            wrapperCol: {
                                sm: { span: 16 },
                            },
                        }
                        }
                        label={
                            <Tooltip title="
                                Bean调用示例：
                                twtTask.twtParams('twt')

                                Class类调用示例：
                                com.twelvet.server.job.task.TWTTask.twtParams('twt')
                                参数说明：支持字符串，布尔类型，长整型，浮点型，整型
                            ">
                                调用方法
                            </Tooltip>
                        }
                        name="invokeTarget"
                        rules={[{ required: true, message: '调用方法不能为空' }]}
                    >
                        <Input placeholder="调用方法" />
                    </Form.Item>

                    <Row>
                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="cron命令"
                                name="cronExpression"
                                rules={[{ required: true, message: 'cron命令不能为空' }]}
                            >
                                <Input placeholder="cron命令" />
                            </Form.Item>
                        </Col>

                        <Col sm={12} xs={24}>
                            <Form.Item
                                {...formItemLayout}
                                label="是否并发"
                                name="concurrent"
                                initialValue={0}
                            >
                                <Radio.Group
                                    optionType="button"
                                    buttonStyle="solid"
                                >
                                    <Radio.Button value={1}>允许</Radio.Button>
                                    <Radio.Button value={0}>禁止</Radio.Button>
                                </Radio.Group>
                            </Form.Item>
                        </Col>
                    </Row>

                    <Form.Item
                        {
                        ...{
                            labelCol: {
                                sm: { span: 3 },
                            },
                            wrapperCol: {
                                sm: { span: 21 },
                            },
                        }
                        }
                        label="错误策略"
                        name="misfirePolicy"
                        initialValue={1}
                    >
                        <Radio.Group
                            optionType="button"
                            buttonStyle="solid"
                        >
                            <Radio.Button value={1}>立即执行</Radio.Button>
                            <Radio.Button value={2}>执行一次</Radio.Button>
                            <Radio.Button value={3}>放弃执行</Radio.Button>
                        </Radio.Group>
                    </Form.Item>

                    <Form.Item
                        {
                        ...{
                            labelCol: {
                                sm: { span: 3 },
                            },
                            wrapperCol: {
                                sm: { span: 16 },
                            },
                        }
                        }
                        label="状态"
                        name="status"
                        initialValue={1}
                    >
                        <Radio.Group
                            optionType="button"
                        >
                            <Radio value={1}>正常</Radio>
                            <Radio value={0}>暂停</Radio>
                        </Radio.Group>
                    </Form.Item>

                </Form>

            </Modal>

            <Details
                modelDetails={modelDetails}
                onCancel={() => {
                    setModelDetails({
                        vimodelDetails: false,
                        jobId: 0
                    })
                }}
            />
        </>
    )

}

export default Job