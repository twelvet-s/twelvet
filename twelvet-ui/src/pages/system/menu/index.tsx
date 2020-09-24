import React from 'react'
import { Button } from 'antd'
import TWTProTable from './components/TWTProtable'
import { ProColumns, columns } from '@/components/TwelveT/ProTable/Table'
import { list } from './service'

const Menu: React.FC<{}> = () => {

    return (
        <TWTProTable />
    )

}

export default Menu