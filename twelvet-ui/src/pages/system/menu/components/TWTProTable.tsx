import React from 'react'
import ProTable, { ProColumns } from '@ant-design/pro-table'
import { CheckCircleTwoTone } from '@ant-design/icons'
import { message } from 'antd'
import { list } from './../service'
import { system } from '@/utils/twelvet'

const TWTProTable: React.FC<{}> = (props) => {

    const columns: ProColumns<{ [key: string]: string }> = [
        {
            title: '菜单名称', align: 'left', hideInSearch: true, dataIndex: 'menuName',
        },
        {
            title: 'Icon', valueType: "text", hideInSearch: true, dataIndex: 'icon'
        },
        {
            title: '排序', hideInSearch: true, dataIndex: 'orderNum'
        },
        {
            title: '权限标识', hideInSearch: true, dataIndex: 'perms'
        },
        {
            title: '组件路径', hideInSearch: true, dataIndex: 'path'
        },
        {
            title: '状态',
            hideInSearch: true,
            dataIndex: 'status',
            valueEnum: {
                1: { text: '正常', status: 'success' },
                0: { text: '关闭', status: 'error' },
            },
        },
        {
            title: '创建时间', hideInSearch: true, dataIndex: 'createTime'
        },
    ]

    return (
        <ProTable
            // 支持横向超出自适应
            scroll={{ x: 'max-content' }}
            rowKey="menuId"
            expandable={{

            }}
            // 请求数据地址
            request={async (params, sorter, filter) => {
                try {
                    const res: { [key: string]: string | number | Array<{ [key: string]: string }> } = await list(params);
                    const { code, msg, data } = res
                    if (code != 200) {
                        return message.error(msg)
                    }
                    return Promise.resolve({
                        data: data,
                        success: true,
                    })

                } catch (e) {
                    system.trace("TWTProTable：", e)
                }
            }}
            columns={columns}
            pagination={false}
            search={false}
        />
    )

}

export default TWTProTable