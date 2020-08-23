import {} from ''
import TWTProTable from '@/components/TwelveT/TWTProTable'
import { Button } from 'antd'
import { connect } from 'umi'
import React from 'react'

const Staff: React.FC<any> = props => {

    const { dispatch, twelvet = {} } = props

    // const { data, setData } = useState

    const columns = [
        {
            title: '订单编号', dataIndex: 'orderNo'
        },
        {
            title: '获佣用户', dataIndex: 'userName', render: (_, row) => _ ? "" : row.loginName
        },
        {
            title: '佣金描述', dataIndex: 'remark'
        },
        {
            title: '商品金额', dataIndex: 'money'
        },
        {
            title: '佣金', dataIndex: 'distributMoney'
        },
        {
            title: '记录时间', dataIndex: 'createTime'
        },
        {
            title: '状态', dataIndex: 'moneyStatus',
            render: (_, row) => {
                return row.moneyStatus ? "<span class='statu-yes'>已结算</span>" : "未结算";
            }
        },
    ]

    return (
        <TWTProTable
            columns={columns}
            namespace="staffManagement/pageQuery"
        />
    )

}



export default connect(({ staffManagement }) => ({
    twelvet: staffManagement
}))(Staff)