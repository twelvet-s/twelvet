import React from 'react'
import TWTProTable from '@/components/TwelveT/ProTable/Index'
import { ProColumns, columns } from '@/components/TwelveT/ProTable/Table'
import { pageQuery } from './service'

const Staff: React.FC<{}> = () => {

    // const { data, setData } = useState

    const columns: ProColumns<columns>[] = [
        {
            title: '订单编号', tip: "132", align: 'left', hideInSearch: true, dataIndex: 'goodsId', 
        },
        {
            title: '获佣用户', valueType: "text", hideInSearch: true, dataIndex: 'goodsName'
        },
        {
            title: '佣金描述', hideInSearch: true, dataIndex: 'goodsImg'
        },
        {
            title: '商品金额', hideInSearch: true, dataIndex: 'shopPrice'
        },
        {
            title: '佣金', dataIndex: 'saleNum'
        },
    ]

    return (
        <TWTProTable
            rowKey="goodsId"
            request={pageQuery}
            columns={columns}
        />
    )

}

export default Staff