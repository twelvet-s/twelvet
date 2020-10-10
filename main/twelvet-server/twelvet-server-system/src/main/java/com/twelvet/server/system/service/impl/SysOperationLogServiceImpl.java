package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysOperationLog;
import com.twelvet.server.system.mapper.SysOperationLogMapper;
import com.twelvet.server.system.service.ISysOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 操作日志 服务层处理
 */
@Service
public class SysOperationLogServiceImpl implements ISysOperationLogService {
    @Autowired
    private SysOperationLogMapper sysOperationLogMapper;

    /**
     * 新增操作日志
     *
     * @param operationLog 操作日志对象
     * @return 结果
     */
    @Override
    public int insertOperationLog(SysOperationLog operationLog) {
        return sysOperationLogMapper.insertOperationLog(operationLog);
    }

}
