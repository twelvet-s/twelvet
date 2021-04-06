import React, { useEffect, useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import { ActionType } from '@/components/TwelveT/ProTable/Index'
import { Button, Cascader, Col, Divider, Drawer, Input, message, Row, Select, Tabs, TreeSelect } from 'antd'
import Form, { FormInstance } from 'antd/lib/form'
import { getInfo, getMenus, getOptionselect, putGen } from './service'
import { makeTree, system } from '@/utils/twelvet'
import { EditableProTable } from '@ant-design/pro-table'
import ProSkeleton from '@ant-design/pro-skeleton';
import TagList from './TagList'

/**
 * 生成代码编辑
 */
const EditCode: React.FC<{
    info: {
        tableId: number
        visible: boolean
    }
    onClose: () => void
    reloadForm: ActionType
}> = (props) => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [loading, setLoading] = useState<boolean>(true)

    // 生成模板切换
    const [tplCategory, setTplCategory] = useState<string>()

    const { info, reloadForm, onClose } = props

    const [tableLoading, setTableLoading] = useState<boolean>(true)

    const [editableKeys, setEditableRowKeys] = useState<React.Key[]>([]);

    const valueEnumRadio = {
        '1': { text: ' ', status: 'Default' },
    }

    const [form] = Form.useForm<FormInstance>()

    const [tableForm] = Form.useForm<FormInstance>()


    const [tablesInfo, setTablesInfo] = useState<{}>({})

    // 菜单数据源
    const [menuTree, setMenuTree] = useState<Array<{ [key: string]: any }>>([])

    /**
     * 表单其他信息
     */
    const [formInfo, setFormInfo] = useState<[]>([])

    // 关联表信息
    const [formTables, setFormTables] = useState<Array<{
        value: string
        label: string
        children: []
    }>>([{
        value: '',
        label: '',
        children: []
    }])

    /**
     * 字段信息
     */
    const [dataSource, setDataSource] = useState<[]>([])

    const formItemLayout = {
        labelCol: {
            xs: { span: 6 },
            sm: { span: 6 },
        },
        wrapperCol: {
            xs: { span: 16 },
            sm: { span: 16 },
        },
    }

    // Form参数
    const columns: ProColumns = [
        {
            title: '字段名称', search: false, width: 200, valueType: "text", dataIndex: 'columnName', renderFormItem: () => <TagList />,
        },
        {
            title: '字段描述', search: false, width: 120, valueType: "text", dataIndex: 'columnComment'
        },
        {
            title: '物理类型', search: false, width: 120, valueType: "text", dataIndex: 'columnType', renderFormItem: () => <TagList />,
        },
        {
            title: 'Java类型', search: false, width: 120, valueType: "select", dataIndex: 'javaType', valueEnum: {
                Long: { text: 'Long', status: 'Default' },
                String: { text: 'String', status: 'Default' },
                Integer: { text: 'Integer', status: 'Default' },
                Double: { text: 'Double', status: 'Default' },
                BigDecimal: { text: 'BigDecimal', status: 'Default' },
                Date: { text: 'Date', status: 'Default' },
            }, formItemProps: {
                rules: [
                    {
                        required: true,
                        message: '此项为必填项',
                    },
                ],
            },
        },
        {
            title: 'Java属性', search: false, width: 120, valueType: "text", dataIndex: 'javaField', formItemProps: {
                rules: [
                    {
                        required: true,
                        message: '此项为必填项',
                    },
                ],
            },
        },
        {
            title: '插入', search: false, width: 50, valueType: "checkbox", dataIndex: 'isInsert', valueEnum: valueEnumRadio
        },
        {
            title: '编辑', search: false, width: 50, valueType: "checkbox", dataIndex: 'isEdit', valueEnum: valueEnumRadio
        },
        {
            title: '列表', search: false, width: 50, valueType: "checkbox", dataIndex: 'isList', valueEnum: valueEnumRadio
        },
        {
            title: '查询', search: false, width: 50, valueType: "checkbox", dataIndex: 'isQuery', valueEnum: valueEnumRadio
        },
        {
            title: '查询方式', search: false, width: 120, valueType: "select", dataIndex: 'queryType', valueEnum: {
                EQ: { text: '=', status: 'Default' },
                NE: { text: '!=', status: 'Default' },
                GT: { text: '>', status: 'Default' },
                GTE: { text: '>=', status: 'Default' },
                LT: { text: '<', status: 'Default' },
                LTE: { text: '<=', status: 'Default' },
                LIKE: { text: 'like', status: 'Default' },
                BETWEEN: { text: 'between', status: 'Default' },
            },
            formItemProps: {
                rules: [
                    {
                        required: true,
                        message: '此项为必填项',
                    },
                ],
            },
        },
        {
            title: '必填', search: false, width: 50, valueType: "checkbox", dataIndex: 'isRequired', valueEnum: valueEnumRadio
        },
        {
            title: '显示类型', search: false, width: 120, valueType: "select", dataIndex: 'htmlType', valueEnum: {
                input: { text: '文本框', status: 'Default' },
                textarea: { text: '文本域', status: 'Default' },
                select: { text: '下拉框', status: 'Default' },
                radio: { text: '单选框', status: 'Default' },
                checkbox: { text: '复选框', status: 'Default' },
                datetime: { text: '日期控件', status: 'Default' },
                imageUpload: { text: '图片上传', status: 'Default' },
                fileUpload: { text: '文件上传', status: 'Default' },
                editor: { text: '富文本控件', status: 'Default' },
            },
            formItemProps: {
                rules: [
                    {
                        required: true,
                        message: '此项为必填项',
                    },
                ],
            },
        },
        {
            title: '字典类型', search: false, width: 220, valueType: "text", dataIndex: 'dictType', valueEnum: tablesInfo
        },
    ]

    useEffect(() => {
        if (info.tableId != 0) {
            refGetInfo()
        }
    }, [info])

    /**
     * 获取数据源
     */
    const refGetInfo = async () => {

        try {

            await getInfo(info.tableId).then(async ({ code, msg, data }) => {
                if (code != 200) {
                    return message.error(msg)
                }

                setDataSource(data.rows)

                // 设置生成模板初始数据
                setTplCategory(data.info.tplCategory)


                // 制作联动表数据

                setFormInfo(data.info.columns)

                // 配置链表参数
                if (data.info.tplCategory == 'sub') {
                    data.info.subTable = [
                        data.info.subTableName,
                        data.info.subTableFkName
                    ]
                }

                // 设置数据表信息
                form.setFieldsValue({ ...data.info })

                setEditableRowKeys(data.rows.map((item: { columnId: number }) => {
                    return item.columnId

                }))

                setFormTables(cascaderTree(data.tables))

                // 获取菜单信息
                await getMenus().then(async ({ code, msg, data }) => {
                    if (code != 200) {
                        return message.error(msg)
                    }

                    setMenuTree(makeTree({
                        dataSource: data,
                        id: `menuId`,
                        enhance: {
                            key: `menuId`,
                            title: `menuName`,
                            value: `menuId`
                        }
                    }))

                    await getOptionselect().then(async ({ code, msg, data }) => {

                        if (code != 200) {
                            return message.error(msg)
                        }

                        let infos = {}
                        data.map((item: {
                            dictName: string
                        }) => {
                            const dictType = item['dictType']
                            infos[dictType] = { text: `${item.dictName}：${dictType}`, status: 'Default' }
                        })
                        setTablesInfo(infos)

                    })

                })
            })


        } catch (e) {
            system.error(e)
        } finally {
            setLoading(false)
            setTableLoading(false)
        }

    }

    /**
     * 制作链表数据
     * @param tables 
     * @returns 
     */
    const cascaderTree = (tables: [{
        tableName: string
        tableComment: string
        columns: [{
            columnComment: string
            columnName: string
        }]
    }]) => {
        return tables.map(((item: {
            tableName: string
            tableComment: string
            columns: [{
                columnComment: string
                columnName: string
            }]
        }) => {
            // 表字段
            const columns = item.columns

            return {
                value: item.tableName,
                label: `${item.tableName}：${item.tableComment}`,
                children: columns.map((children: {
                    columnComment: string
                    columnName: string
                }) => {
                    return {
                        value: children.columnName,
                        label: `${children.columnName}：${children.columnComment}`,
                    }

                })

            }


        }))
    }

    /**
     * 关闭抽屉
     */
    const close = () => {
        if (!loading && !tableLoading) {
            // 清空数据关闭
            setTableLoading(true)
            setLoading(true)
            setDataSource([])
            onClose()
        }
    }

    /**
     * 保存数据
     */
    const onSave = () => {
        try {
            tableForm
                .validateFields()
                .then(() => {
                    setLoading(true)
                    form
                        .validateFields()
                        .then(async (params) => {

                            dataSource.map((item: {
                                isEdit: [] | {}
                                isInsert: [] | {}
                                isList: [] | {}
                                isQuery: [] | {}
                                isRequired: [] | {}
                            }) => {
                                item['isEdit'] = item.isEdit ? item.isEdit[0] : null
                                item['isInsert'] = item.isInsert ? item.isInsert[0] : null
                                item['isList'] = item.isList ? item.isList[0] : null
                                item['isQuery'] = item.isQuery ? item.isQuery[0] : null
                                item['isRequired'] = item.isRequired ? item.isRequired[0] : null
                            })

                            // 配置参数
                            params['columns'] = dataSource
                            params['tableId'] = info.tableId
                            params['params'] = {}


                            if (params['parentMenuId']) {
                                params['params']['parentMenuId'] = params['parentMenuId']
                            }


                            // 树表查询
                            if (params['tplCategory'] == 'tree') {

                                params['params'] = {
                                    treeCode: params['treeCode'],
                                    treeName: params['treeName'],
                                    treeParentCode: params['treeParentCode']
                                }

                            }

                            if (params['tplCategory'] == 'sub') {
                                const subTable = params['subTable']
                                params['subTableName'] = subTable[0]
                                params['subTableFkName'] = subTable[1]

                                params['subTable'] = undefined
                            }

                            const { code, msg } = await putGen(params)

                            if (code != 200) {
                                return message.error(msg)
                            }

                            message.success(msg)

                            close()
                            return reloadForm.current && reloadForm.current.reload()
                        }).catch((e) => {
                            return message.error('请确保不留空')
                        })
                })

        } catch (e) {

            system.error(e)

        } finally {
            setLoading(false)
        }
    }

    return (
        <Drawer
            // 关闭时销毁子元素
            destroyOnClose={true}
            width="80%"
            placement="right"
            closable={false}
            onClose={() => {
                close()
            }}
            visible={info.visible}
            footer={
                <div
                    style={{
                        textAlign: 'right',
                    }}
                >
                    <Button onClick={() => close()}>
                        取消
                  </Button>
                    <Divider type="vertical" />
                    <Button loading={loading} type="primary" onClick={() => onSave()}>
                        保存
                  </Button>
                </div>
            }
        >

            {tableLoading && <ProSkeleton type="list" />}

            {!tableLoading && (
                <EditableProTable
                    // 支持横向超出自适应
                    scroll={{ x: 'x-content' }}
                    headerTitle='字段信息'
                    search={false}
                    actionRef={acForm}
                    formRef={formRef}
                    rowKey="columnId"
                    // 关闭默认的新建按钮
                    recordCreatorProps={false}
                    columns={columns}
                    value={dataSource}
                    editable={{
                        form: tableForm,
                        type: 'multiple',
                        editableKeys,
                        actionRender: (row, config, defaultDoms) => {
                            return [defaultDoms.delete];
                        },
                        onValuesChange: (record, recordList: any) => {
                            setDataSource(recordList);
                        },
                        onChange: setEditableRowKeys,
                    }}
                    tableExtraRender={(_) => (
                        <Form
                            form={form}
                        >
                            <Tabs
                                defaultActiveKey={`1`}
                                tabPosition='left'
                            >
                                <Tabs.TabPane tab={`基本信息`} key={`1`}>

                                    <Row>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="tableName"
                                                label={'表名称'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>

                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="tableComment"
                                                label={'表描述'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                    </Row>

                                    <Row>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="className"
                                                label={'实体名'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>

                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="functionAuthor"
                                                label={'作者名'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                    </Row>

                                    <Form.Item
                                        {...{
                                            labelCol: {
                                                xs: { span: 2 },
                                                sm: { span: 3 },
                                            },
                                            wrapperCol: {
                                                xs: { span: 20 },
                                                sm: { span: 20 },
                                            },
                                        }}
                                        name="remark"
                                        label={'备注'}
                                    >
                                        <Input.TextArea />
                                    </Form.Item>

                                </Tabs.TabPane>

                                <Tabs.TabPane tab={`生成信息`} key={`2`}>
                                    <Row>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="tplCategory"
                                                label={'生成模板'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Select onChange={(value: string) => {
                                                    // 切换数据显示
                                                    setTplCategory(value)
                                                }}>

                                                    <Select.Option value="crud">单表（增删改查）</Select.Option>
                                                    <Select.Option value="tree">树表（增删改查）</Select.Option>
                                                    <Select.Option value="sub">主子表（增删改查）</Select.Option>

                                                </Select>
                                            </Form.Item>
                                        </Col>

                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="packageName"
                                                label={'生成包路径'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                    </Row>

                                    <Row>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="moduleName"
                                                label={'生成模块名'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="businessName"
                                                label={'生成业务名'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>
                                    </Row>

                                    <Row>
                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="functionName"
                                                label={'生成功能名'}
                                                rules={[
                                                    {
                                                        required: true,
                                                        message: '此处不能为空',
                                                    },
                                                ]}
                                            >
                                                <Input />
                                            </Form.Item>
                                        </Col>

                                        <Col md={12} sm={24} xs={24}>
                                            <Form.Item
                                                {...formItemLayout}
                                                name="parentMenuId"
                                                label={'上级菜单'}
                                            >
                                                <TreeSelect
                                                    allowClear
                                                    // 支出搜索
                                                    showSearch
                                                    // 根据title进行搜索
                                                    treeNodeFilterProp="title"
                                                    dropdownStyle={{ maxHeight: 400, overflow: 'auto' }}
                                                    placeholder="上级菜单"
                                                    treeData={menuTree}
                                                />
                                            </Form.Item>
                                        </Col>
                                    </Row>

                                    {
                                        tplCategory === `sub` && (
                                            <>
                                                <Divider plain>关联信息</Divider>

                                                <Row>
                                                    <Col md={12} sm={24} xs={24}>
                                                        <Form.Item
                                                            {...formItemLayout}
                                                            name="subTable"
                                                            label={'关联子表名/外键'}
                                                            rules={[
                                                                {
                                                                    required: true,
                                                                    message: '此处不能为空',
                                                                },
                                                            ]}
                                                        >
                                                            <Cascader
                                                                options={formTables}
                                                                expandTrigger="hover"
                                                            />
                                                        </Form.Item>
                                                    </Col>
                                                </Row>
                                            </>
                                        )
                                    }

                                    {
                                        tplCategory === `tree` && (
                                            <>
                                                <Divider plain>其他信息</Divider>

                                                <Row>
                                                    <Col md={12} sm={24} xs={24}>
                                                        <Form.Item
                                                            {...formItemLayout}
                                                            name="treeCode"
                                                            label={'树编码字段'}
                                                            rules={[
                                                                {
                                                                    required: true,
                                                                    message: '此处不能为空',
                                                                },
                                                            ]}
                                                        >
                                                            <Select>

                                                                {formInfo.map((item: {
                                                                    columnName: string
                                                                    columnComment: string
                                                                }) => {
                                                                    return <Select.Option key={item.columnName} value={item.columnName}>{`${item.columnName}：${item.columnComment}`}</Select.Option>
                                                                })}

                                                            </Select>
                                                        </Form.Item>
                                                    </Col>

                                                    <Col md={12} sm={24} xs={24}>
                                                        <Form.Item
                                                            {...formItemLayout}
                                                            name="treeParentCode"
                                                            label={'树父编码字段'}
                                                            rules={[
                                                                {
                                                                    required: true,
                                                                    message: '此处不能为空',
                                                                },
                                                            ]}
                                                        >
                                                            <Select>

                                                                {formInfo.map((item: {
                                                                    columnName: string
                                                                    columnComment: string
                                                                }) => {
                                                                    return <Select.Option key={item.columnName} value={item.columnName}>{`${item.columnName}：${item.columnComment}`}</Select.Option>
                                                                })}

                                                            </Select>
                                                        </Form.Item>
                                                    </Col>
                                                </Row>

                                                <Row>
                                                    <Col md={12} sm={24} xs={24}>
                                                        <Form.Item
                                                            {...formItemLayout}
                                                            name="treeName"
                                                            label={'树名称字段'}
                                                            rules={[
                                                                {
                                                                    required: true,
                                                                    message: '此处不能为空',
                                                                },
                                                            ]}
                                                        >
                                                            <Select>

                                                                {formInfo.map((item: {
                                                                    columnName: string
                                                                    columnComment: string
                                                                }) => {
                                                                    return <Select.Option key={item.columnName} value={item.columnName}>{`${item.columnName}：${item.columnComment}`}</Select.Option>
                                                                })}

                                                            </Select>
                                                        </Form.Item>
                                                    </Col>
                                                </Row>
                                            </>
                                        )
                                    }

                                </Tabs.TabPane>
                            </Tabs>
                        </Form>
                    )}
                />
            )}

        </Drawer>
    )

}

export default EditCode