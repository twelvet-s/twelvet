package com.twelvet.server.system.service;


import com.twelvet.api.system.domain.SysOperationLog;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 操作日志 服务层
 */
public interface ISysOperationLogService {
    /**
     * 新增操作日志
     *
     * @param operationLog 操作日志对象
     * @return 结果
     */
    int insertOperationLog(SysOperationLog operationLog);

}
