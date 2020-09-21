import React from 'react'
import { Button } from 'antd'
import TWTProTable from '@/components/TwelveT/ProTable/Index'
import { ProColumns, columns } from '@/components/TwelveT/ProTable/Table'
import { pageQuery } from './service'

const Menu: React.FC<{}> = () => {

    // const { data, setData } = useState

    const columns: ProColumns<columns>[] = [
        {
            title: '菜单名称', tip: "132", align: 'left', hideInSearch: true, dataIndex: 'goodsId',
        },
        {
            title: 'Icon', valueType: "text", hideInSearch: true, dataIndex: 'goodsName'
        },
        {
            title: '排序', hideInSearch: true, dataIndex: 'goodsImg'
        },
        {
            title: '权限标识', hideInSearch: true, dataIndex: 'shopPrice'
        },
        {
            title: '组件路径', hideInSearch: true, dataIndex: 'saleNum'
        },
        {
            title: '状态', hideInSearch: true, dataIndex: 'saleNum'
        },
        {
            title: '创建时间', hideInSearch: true, dataIndex: 'saleNum'
        },
    ]

    return (
        <TWTProTable
            rowKey="goodsId"
            request={pageQuery}
            columns={columns}
            toolBarRender={() => [
                <Button type="primary">新增</Button>,
                <Button type="primary" danger>批量删除</Button>
            ]}
        />
    )

}

export default Menu