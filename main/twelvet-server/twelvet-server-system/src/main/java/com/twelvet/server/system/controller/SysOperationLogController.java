package com.twelvet.server.system.controller;


import com.twelvet.api.system.domain.SysOperationLog;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.server.system.service.ISysOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 操作日志记录
 */
@RestController
@RequestMapping("/operationLog")
public class SysOperationLogController extends TWTController
{
    @Autowired
    private ISysOperationLogService insertOperationLog;

    @PostMapping
    public AjaxResult add(@RequestBody SysOperationLog operationLog)
    {
        return json(insertOperationLog.insertOperationLog(operationLog));
    }
}
