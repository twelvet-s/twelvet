import React, { useState, useRef, useEffect } from 'react'
import { Descriptions, message, Modal, Switch } from 'antd'
import { system } from '@/utils/twelvet'
import { getByJobId } from './../../service'

/**
 * 状态组件操作
 * @param props row 参数
 */
const Details: React.FC<{
    modelDetails: {
        vimodelDetails: boolean
        jobId: number
    }
    onCancel: () => void
}> = (props) => {

    const [descriptions, setDescriptions] = useState<{ [key: string]: string }>({})

    useEffect(() => {
        getData()
    }, [props.modelDetails])

    const getData = async () => {
        try {
            const { jobId } = props.modelDetails

            // ID为0将无需发生改变
            if (jobId === 0) {
                return false;
            }

            const { code, msg, data } = await getByJobId(jobId)
            if (code != 200) {
                return message.error(msg)
            }

            setDescriptions(data)
        } catch (e) {
            system.error(e)
        }
    }

    return (
        <Modal
            title={`查看详情`}
            width={700}
            visible={props.modelDetails.vimodelDetails}
            onCancel={props.onCancel}
            footer={null}
        >

            <Descriptions column={2}>

                <Descriptions.Item label="任务分组">
                    {descriptions.jobGroup}
                </Descriptions.Item>

                <Descriptions.Item label="任务名称">
                    {descriptions.jobName}
                </Descriptions.Item>

                <Descriptions.Item label="创建时间">
                    {descriptions.createTime}
                </Descriptions.Item>

                <Descriptions.Item label="cron表达式">
                    {descriptions.cronExpression}
                </Descriptions.Item>

                <Descriptions.Item label="下次执行时间">
                    {descriptions.nextValidTime}
                </Descriptions.Item>

                <Descriptions.Item label="任务状态">
                    {descriptions.status == 1 && '正常'}
                    {descriptions.status == 0 && '停止'}
                </Descriptions.Item>

                <Descriptions.Item label="是否并发">
                    {descriptions.concurrent == "1" ? '允许' : '禁止'}
                </Descriptions.Item>

                <Descriptions.Item label="执行策略">
                    {descriptions.misfirePolicy == 0 && '默认策略'}
                    {descriptions.misfirePolicy == 1 && '立即执行'}
                    {descriptions.misfirePolicy == 2 && '执行一次'}
                    {descriptions.misfirePolicy == 3 && '放弃执行'}
                </Descriptions.Item>

                <Descriptions.Item label="调用目标方法">
                    {descriptions.invokeTarget}
                </Descriptions.Item>

            </Descriptions>

        </Modal>
    )
}

export default Details