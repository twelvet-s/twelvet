package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysOperationLog;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.server.system.service.ISysOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 操作日志记录
 */
@RestController
@RequestMapping("/operationLog")
public class SysOperationLogController extends TWTController {
    @Autowired
    private ISysOperationLogService iSysOperationLogService;

    /**
     * 新增操作日志
     *
     * @param operationLog SysOperationLog
     * @return AjaxResult
     */
    @PostMapping
    public AjaxResult insert(@RequestBody SysOperationLog operationLog) {
        return json(iSysOperationLogService.insertOperationLog(operationLog));
    }

    /**
     * 移除指定ID日志
     *
     * @param operationLogIds Long[]
     * @return AjaxResult
     */
    @Log(service = "操作日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{operationLogIds}")
    public AjaxResult remove(@PathVariable Long[] operationLogIds) {
        return json(iSysOperationLogService.deleteOperationLogByIds(operationLogIds));
    }

    /**
     * 清空初始化操作日志
     *
     * @return AjaxResult
     */
    @Log(service = "操作日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public AjaxResult clean() {
        iSysOperationLogService.cleanOperationLog();
        return AjaxResult.success();
    }

    /**
     * 分页查询
     *
     * @param operationLog SysOperationLog
     * @return AjaxResult
     */
    @GetMapping()
    public AjaxResult pageQuery(SysOperationLog operationLog) {
        startPage();
        List<SysOperationLog> list = iSysOperationLogService.selectOperationLogList(operationLog);
        return AjaxResult.success(getDataTable(list));
    }

}
