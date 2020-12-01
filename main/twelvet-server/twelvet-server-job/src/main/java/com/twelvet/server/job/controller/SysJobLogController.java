package com.twelvet.server.job.controller;

import com.twelvet.api.job.domain.SysJobLog;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.job.service.ISysJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 调度日志操作处理
 */
@RestController
@RequestMapping("/log")
public class SysJobLogController extends TWTController {

    @Autowired
    private ISysJobLogService jobLogService;

    /**
     * 查询定时任务调度日志列表
     *
     * @param sysJobLog SysJobLog
     * @return AjaxResult
     */
    @GetMapping("/pageQuery")
    @PreAuthorize("@role.hasPermi('system:job:list')")
    public AjaxResult pageQuery(SysJobLog sysJobLog) {
        startPage();
        List<SysJobLog> list = jobLogService.selectJobLogList(sysJobLog);
        return AjaxResult.success(getDataTable(list));
    }

    /**
     * 导出定时任务调度日志列表
     *
     * @param response  HttpServletResponse
     * @param sysJobLog SysJobLog
     */
    @Log(service = "任务调度日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @PreAuthorize("@role.hasPermi('system:job:export')")
    public void export(HttpServletResponse response, @RequestBody SysJobLog sysJobLog) {
        List<SysJobLog> list = jobLogService.selectJobLogList(sysJobLog);
        ExcelUtils<SysJobLog> excelUtils = new ExcelUtils<>(SysJobLog.class);
        excelUtils.exportExcel(response, list, "调度日志");
    }

    /**
     * 根据调度编号获取详细信息
     *
     * @param jobLogId id
     * @return AjaxResult
     */
    @GetMapping("/{configId}")
    @PreAuthorize("@role.hasPermi('system:job:query')")
    public AjaxResult getInfo(@PathVariable Long jobLogId) {
        return AjaxResult.success(jobLogService.selectJobLogById(jobLogId));
    }

    /**
     * 删除定时任务调度日志
     *
     * @param jobLogIds 数组id
     * @return AjaxResult
     */
    @Log(service = "定时任务调度日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobLogIds}")
    @PreAuthorize("@role.hasPermi('system:job:remove')")
    public AjaxResult remove(@PathVariable Long[] jobLogIds) {
        return json(jobLogService.deleteJobLogByIds(jobLogIds));
    }

    /**
     * 清空定时任务调度日志
     *
     * @return AjaxResult
     */
    @Log(service = "调度日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    @PreAuthorize("@role.hasPermi('system:job:remove')")
    public AjaxResult clean() {
        jobLogService.cleanJobLog();
        return AjaxResult.success();
    }
}
