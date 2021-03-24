import React, { useEffect, useRef, useState } from 'react'
import { ProColumns } from '@/components/TwelveT/ProTable/Table'
import TWTProTable, { ActionType } from '@/components/TwelveT/ProTable/Index'
import { Button, Divider, Drawer, Input, message, Tabs, Tag } from 'antd'
import Form, { FormInstance } from 'antd/lib/form'
import { getInfo } from './service'
import { system } from '@/utils/twelvet'
import { Key } from 'antd/lib/table/interface'
import { FormattedMessage } from '@/.umi/plugin-locale/localeExports'
import { EditableProTable } from '@ant-design/pro-table'
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
}> = (props) => {

    const acForm = useRef<ActionType>()

    const formRef = useRef<FormInstance>()

    const [selectedRowKeys, setSelectedRowKeys] = useState<Key[]>([])

    const [loading, setLoading] = useState<boolean>(false)

    const { info, onClose } = props

    const [dataSource, setDataSource] = useState<[]>([])

    const [tableLoading, setTableLoading] = useState<boolean>(true)

    const [editableKeys, setEditableRowKeys] = useState<React.Key[]>([]);

    const valueEnumRadio = {
        '1': { text: ' ', status: 'Default' },
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
            }
        },
        {
            title: 'Java属性', search: false, width: 120, valueType: "text", dataIndex: 'javaField'
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
            }
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
            }
        },
        // {
        //     title: '字典类型', search: false, width: 120, valueType: "text", dataIndex: 'dictType', valueEnum: {
        //         input: { text: '文本框', status: 'Default' },
        //         textarea: { text: '文本域', status: 'Default' },
        //         select: { text: '下拉框', status: 'Default' },
        //         radio: { text: '单选框', status: 'Default' },
        //         checkbox: { text: '复选框', status: 'Default' },
        //         datetime: { text: '日期控件', status: 'Default' },
        //         imageUpload: { text: '图片上传', status: 'Default' },
        //         fileUpload: { text: '文件上传', status: 'Default' },
        //         editor: { text: '富文本控件', status: 'Default' },
        //     }
        // },
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

            const { code, msg, data } = await getInfo(info.tableId)
            if (code != 200) {
                return message.error(msg)
            }

            const values = data.tables[0].columns
            setDataSource(values)
            setEditableRowKeys(values.map((item) => {
                return item.columnId

            }))
        } catch (e) {
            system.error(e)
        } finally {
            setTableLoading(false)
        }

    }

    /**
     * 关闭抽屉
     */
    const close = () => {
        if (!loading && !tableLoading) {
            // 清空数据关闭
            setTableLoading(true)
            setDataSource([])
            onClose()
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
                    <Button loading={loading} type="primary" onClick={() => importTableRef()}>
                        保存
                  </Button>
                </div>
            }
        >
            <EditableProTable
                // 支持横向超出自适应
                scroll={{ x: 'x-content' }}
                headerTitle='字段信息'
                search={false}
                actionRef={acForm}
                formRef={formRef}
                rowKey="columnId"
                loading={tableLoading}
                // 关闭默认的新建按钮
                recordCreatorProps={false}
                columns={columns}
                value={dataSource}
                editable={{
                    type: 'multiple',
                    editableKeys,
                    actionRender: (row, config, defaultDoms) => {
                        return [defaultDoms.delete];
                    },
                    onValuesChange: (record, recordList) => {
                        setDataSource(recordList);
                    },
                    onChange: setEditableRowKeys,
                }}
                toolBarRender={() => []}
                tableExtraRender={(_, data) => (
                    <Tabs
                        defaultActiveKey={`1`}
                        tabPosition='left'
                    >
                        <Tabs.TabPane tab={`基本信息`} key={`1`}>
                            <Form>
                                <Form.Item
                                    name="nickName"
                                    label={'表名称'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'表描述'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'实体类名称'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'作者'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'备注'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input.TextArea />
                                </Form.Item>
                            </Form>
                        </Tabs.TabPane>

                        <Tabs.TabPane tab={`生成信息`} key={`2`}>
                            <Form>
                                <Form.Item
                                    name="nickName"
                                    label={'生成末班'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'生成包路径'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'生成模块名'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'生成业务名'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'生成功能名'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>

                                <Form.Item
                                    name="nickName"
                                    label={'上级菜单'}
                                    rules={[
                                        {
                                            required: true,
                                            message: <FormattedMessage id='accountandsettings.basic.nickname-message' />,
                                        },
                                    ]}
                                >
                                    <Input />
                                </Form.Item>
                            </Form>
                        </Tabs.TabPane>
                    </Tabs>
                )}
            />
        </Drawer>
    )

}

export default EditCode