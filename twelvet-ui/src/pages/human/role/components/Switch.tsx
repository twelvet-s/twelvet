import React, { useState, useRef } from 'react'
import { message, Switch } from 'antd'
import { system } from '@/utils/twelvet'
import { changeStatus } from './../service'

/**
 * 状态组件操作
 * @param props row 参数
 */
const RoleSwitch: React.FC<{
    row: { [key: string]: any }
}> = (props) => {

    const [loading, setLoading] = useState<boolean>(false)
    const [checked, setChecked] = useState<number>(props.row.status)

    const toggle = async () => {
        try {
            setLoading(true);
            let params = {}
            params.roleId = props.row.roleId;
            params.status = checked == 1 ? 0 : 1
            const { code, msg } = await changeStatus(params);

            if (code != 200) {
                return message.error(msg);
            }

            setChecked(!checked)
            return message.success(msg);
        } catch (e) {
            system.log(e)
        } finally {
            setLoading(false);
        }
    };

    return (
        <Switch
            loading={loading}
            onClick={toggle}
            checked={checked}
        />
    )
}

export default RoleSwitch