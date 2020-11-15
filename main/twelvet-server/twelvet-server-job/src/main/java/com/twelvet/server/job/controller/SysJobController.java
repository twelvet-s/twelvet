package com.twelvet.server.job.controller;

import com.twelvet.api.job.domain.SysJob;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.job.exception.TaskException;
import com.twelvet.server.job.service.ISysJobService;
import com.twelvet.server.job.util.CronUtils;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 调度任务信息操作处理
 */
@RestController
@RequestMapping("/cron")
public class SysJobController extends TWTController {
    @Autowired
    private ISysJobService jobService;

    /**
     * 查询定时任务列表
     * @return AjaxResult
     */
    @GetMapping
    public AjaxResult pageQuery(SysJob sysJob) {
        startPage();
        List<SysJob> list = jobService.selectJobList(sysJob);
        return AjaxResult.success(getDataTable(list));
    }

    /**
     * 导出定时任务列表
     */
    @Log(service = "定时任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysJob sysJob) throws IOException {
        List<SysJob> list = jobService.selectJobList(sysJob);
        ExcelUtils<SysJob> excelUtils = new ExcelUtils<SysJob>(SysJob.class);
        excelUtils.exportExcel(response, list, "定时任务");
    }

    /**
     * 获取定时任务详细信息
     */
    @GetMapping(value = "/{jobId}")
    public AjaxResult getByJobId(@PathVariable("jobId") Long jobId) {
        return AjaxResult.success(jobService.selectJobById(jobId));
    }

    /**
     * 新增定时任务
     */
    @Log(service = "定时任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysJob sysJob) throws SchedulerException, TaskException {
        if (!CronUtils.isValid(sysJob.getCronExpression())) {
            return AjaxResult.error("cron表达式不正确");
        }
        sysJob.setCreateBy(SecurityUtils.getUsername());
        return json(jobService.insertJob(sysJob));
    }

    /**
     * 修改定时任务
     */
    @Log(service = "定时任务", businessType = BusinessType.PUT)
    @PutMapping
    public AjaxResult edit(@RequestBody SysJob sysJob) throws SchedulerException, TaskException {
        if (!CronUtils.isValid(sysJob.getCronExpression())) {
            return AjaxResult.error("cron表达式不正确");
        }
        sysJob.setUpdateBy(SecurityUtils.getUsername());
        return json(jobService.updateJob(sysJob));
    }

    /**
     * 定时任务状态修改
     */
    @Log(service = "定时任务", businessType = BusinessType.PUT)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysJob job) throws SchedulerException {
        SysJob newJob = jobService.selectJobById(job.getJobId());
        newJob.setStatus(job.getStatus());
        return json(jobService.changeStatus(newJob));
    }

    /**
     * 定时任务立即执行一次
     */
    @Log(service = "定时任务", businessType = BusinessType.PUT)
    @PutMapping("/run")
    public AjaxResult run(@RequestBody SysJob job) throws SchedulerException {
        jobService.run(job);
        return AjaxResult.success();
    }

    /**
     * 删除定时任务
     */
    @Log(service = "定时任务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobIds}")
    public AjaxResult remove(@PathVariable Long[] jobIds) throws SchedulerException, TaskException {
        jobService.deleteJobByIds(jobIds);
        return AjaxResult.success();
    }
}