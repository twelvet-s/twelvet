import React, { useEffect } from 'react'
import { message } from 'antd'
import { ProTableProps } from '@ant-design/pro-table/lib/index'
import { ParamsType } from '@ant-design/pro-provider'
import { useState } from 'react'
import ProTable from '@ant-design/pro-table'
import { system } from '@/utils/twelvet'

let searchConfig: { [key: string]: any } | false = {
    span: {
        xs: 24,
        sm: 12,
        md: 8,
        lg: 8,
        xl: 4,
        xxl: 4,
    }

};

/**
 * TWTProTable，用于更好的控制全局Table样式
 * @param props 
 */
const TWTProTable: React.FC<ProTableProps<string, ParamsType>> = props => {

    // page状态(初始化第1页)
    const [page] = useState(1)

    /**
     * 关于此处类型请查看官方类型注释【ProTableProps】
     */
    const {
        rowKey,
        columns,
        params,
        columnsStateMap,
        onColumnsStateChange,
        onSizeChange,
        rowSelection,
        /**
         * 渲染 table
         */
        tableRender,
        tableExtraRender,
        /**
         * 一个获得 dataSource 的方法
         */
        request = async (params, _sort, _filter) => { },
        /**
         * 对数据进行一些处理
         */
        postData,
        /**
         * 默认的数据
         */
        defaultData,
        /**
         * 初始化的参数，可以操作 table
         */
        actionRef,
        /**
         * 操作自带的 form
         */
        formRef,
        /**
         * 渲染操作栏
         */
        toolBarRender,
        /**
         * 数据加载完成后触发
         */
        onLoad,
        /**
         * 数据加载失败时触发
         */
        onRequestError,
        /**
         * 给封装的 table 的 className
         */
        tableClassName,
        /**
         * 给封装的 table 的 style
         */
        tableStyle,
        /**
         * 左上角的 title
         */
        headerTitle,
        /**
         * 默认的操作栏配置
         */
        options,
        /**
         * 是否显示搜索表单
         */
        search = { ...searchConfig },
        /**
         * type="form" 和 搜索表单 的 Form 配置
         * 基本配置与 antd Form 相同
         *  但是劫持了 form 的配置
         */
        form,
        /**
         * 如何格式化日期
         * 暂时只支持 moment
         * string 会格式化为 YYYY-DD-MM
         * number 代表时间戳
         */
        dateFormatter,
        /**
         * 格式化搜索表单提交数据
         */
        beforeSearchSubmit,
        /**
         * 自定义 table 的 alert
         * 设置或者返回false 即可关闭
         */
        tableAlertRender,
        /**
         * 自定义 table 的 alert 的操作
         * 设置或者返回false 即可关闭
         */
        tableAlertOptionRender,
        /**
         * 支持 ProTable 的类型
         */
        type,
        /**
         * 提交表单时触发
         */
        onSubmit,
        /**
         * 重置表单时触发
         */
        onReset,
        /**
         * 空值时显示
         */
        columnEmptyText,
        /**
         * 是否手动触发请求
         */
        manualRequest,
    } = props


    useEffect(() => {
        columns && columns.map((item, index) => {
            // 默认不允许数据自动换行
            if (columns[index]['ellipsis'] == undefined) {
                columns[index]['ellipsis'] = true
            }
            // 设置placeholder
            if (columns[index]['formItemProps'] == undefined) {
                columns[index]['formItemProps'] = { "placeholder": columns[index]['title'] }
            }
            // 处理columns数据的标题渲染(搜索框不显示标题，由placeholder代替)
            if (item.hideInSearch != true) {
                columns[index]['title'] = (config, type) => { type == 'table' && columns[index]['title'] }
            }
        })
    }, [columns])

    return (
        <ProTable
            // 支持横向超出自适应
            scroll={{ x: 'max-content' }}
            // 请求数据地址
            request={async (params, _sort, _filter) => {
                const { current = 1, pageSize = 10, ...otherParams } = params;
                try {
                    const res: any = await request({
                        ...otherParams,
                        ...postData,
                        page: current,
                        pagesize: pageSize,
                    }, _sort, _filter);
                    const { status, msg, data = {} } = res;
                    const { records, total } = data;
                    let success = true;
                    if (status != 1) {
                        success = false
                        message.error(msg);
                    }
                    return {
                        // 表格数据
                        data: records,
                        // 当前页码
                        page: current,
                        // 是否请求成功
                        success,
                        // 总条数
                        total,
                    }
                } catch (e) {
                    system.trace("TWTProTable：", e)
                }
            }}
            // 表头参数
            columns={columns}
            // 以数据ID作为key值
            rowKey={rowKey}
            rowSelection={rowSelection}
            // 搜索前进行一下修改
            beforeSearchSubmit={beforeSearchSubmit}
            pagination={{
                showSizeChanger: true,
                // 每页显示条数
                pageSize: 10,
                // 当前页码
                current: page,
            }}
            // 是否开启搜索
            search={search}
            // dateFormatter类型
            dateFormatter={dateFormatter}
            // 表格标题
            headerTitle={headerTitle}
            // 工具渲染
            toolBarRender={toolBarRender}
            // 数据加载完成时触发
            onLoad={onLoad}
            // 数据加载失败时触发
            onRequestError={onRequestError}
            params={params}
            columnsStateMap={columnsStateMap}
            onColumnsStateChange={onColumnsStateChange}
            onSizeChange={onSizeChange}
            tableRender={tableRender}
            tableExtraRender={tableExtraRender}
            actionRef={actionRef}
            formRef={formRef}
            tableClassName={tableClassName}
            tableStyle={tableStyle}
            options={options}
            form={form}
            tableAlertRender={tableAlertRender}
            tableAlertOptionRender={tableAlertOptionRender}
            type={type}
            onSubmit={onSubmit}
            onReset={onReset}
            columnEmptyText={columnEmptyText}
            manualRequest={manualRequest}
            postData={postData}
            defaultData={defaultData}
        />
    )


}

export default TWTProTable