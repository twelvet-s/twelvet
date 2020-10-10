package com.twelvet.server.system.mapper;


import com.twelvet.api.system.domain.SysOperationLog;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 操作日志 数据层
 */
public interface SysOperationLogMapper {
    /**
     * 新增操作日志
     *
     * @param operationLog 操作日志对象
     * @return 主键Id
     */
    int insertOperationLog(SysOperationLog operationLog);
}
