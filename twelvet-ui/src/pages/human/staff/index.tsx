import React from 'react'
import { Button } from 'antd'
import TWTProTable from '@/components/TwelveT/ProTable/Index'
import { ProColumns, columns } from '@/components/TwelveT/ProTable/Table'
import { pageQuery } from './service'

const Staff: React.FC<{}> = () => {

    // const { data, setData } = useState

    const columns: ProColumns<columns>[] = [
        {
            title: '账号', tip: "132", align: 'left', hideInSearch: true, dataIndex: 'goodsId',
        },
        {
            title: '用户昵称', valueType: "text", hideInSearch: true, dataIndex: 'goodsName'
        },
        {
            title: '部门', hideInSearch: true, dataIndex: 'goodsImg'
        },
        {
            title: '状态', hideInSearch: true, dataIndex: 'shopPrice'
        },
        {
            title: '创建时间', dataIndex: 'saleNum'
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

export default Staff