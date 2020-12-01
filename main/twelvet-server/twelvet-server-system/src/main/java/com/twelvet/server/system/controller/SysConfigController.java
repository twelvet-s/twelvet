package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysConfig;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.constant.UserConstants;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.system.service.ISysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 参数配置 信息操作处理
 */
@RestController
@RequestMapping("/config")
public class SysConfigController extends TWTController {

    @Autowired
    private ISysConfigService configService;

    /**
     * 获取参数配置列表
     *
     * @param config SysConfig
     * @return AjaxResult
     */
    @PreAuthorize("@role.hasPermi('system:config:list')")
    @GetMapping("/pageQuery")
    public AjaxResult pageQuery(SysConfig config) {
        startPage();
        List<SysConfig> list = configService.selectConfigList(config);
        return AjaxResult.success(getDataTable(list));
    }

    /**
     * 导出数据
     *
     * @param response HttpServletResponse
     * @param config   SysConfig
     */
    @Log(service = "参数管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@role.hasPermi('system:config:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysConfig config) {
        List<SysConfig> list = configService.selectConfigList(config);
        ExcelUtils<SysConfig> excelUtils = new ExcelUtils<>(SysConfig.class);
        excelUtils.exportExcel(response, list, "参数数据");
    }

    /**
     * 根据参数编号获取详细信息
     *
     * @param configId 配置Id
     * @return AjaxResult
     */
    @GetMapping(value = "/{configId}")
    public AjaxResult getConfigById(@PathVariable Long configId) {
        return AjaxResult.success(configService.selectConfigById(configId));
    }

    /**
     * 根据参数键名查询参数值
     *
     * @param configKey 键值名称
     * @return AjaxResult
     */
    @GetMapping(value = "/configKey/{configKey}")
    public AjaxResult getConfigKey(@PathVariable String configKey) {
        return AjaxResult.success(configService.selectConfigByKey(configKey));
    }

    /**
     * 新增参数配置
     *
     * @param config SysConfig
     * @return AjaxResult
     */
    @Log(service = "参数管理", businessType = BusinessType.INSERT)
    @PreAuthorize("@role.hasPermi('system:config:insert')")
    @PostMapping
    public AjaxResult insert(@Validated @RequestBody SysConfig config) {
        if (UserConstants.NOT_UNIQUE.equals(configService.checkConfigKeyUnique(config))) {
            return AjaxResult.error("新增参数'" + config.getConfigName() + "'失败，参数键名已存在");
        }
        config.setCreateBy(SecurityUtils.getUsername());
        return json(configService.insertConfig(config));
    }

    /**
     * 修改参数配置
     *
     * @param config SysConfig
     * @return AjaxResult
     */
    @Log(service = "参数管理", businessType = BusinessType.UPDATE)
    @PreAuthorize("@role.hasPermi('system:config:update')")
    @PutMapping
    public AjaxResult update(@Validated @RequestBody SysConfig config) {
        if (UserConstants.NOT_UNIQUE.equals(configService.checkConfigKeyUnique(config))) {
            return AjaxResult.error("修改参数'" + config.getConfigName() + "'失败，参数键名已存在");
        }
        config.setUpdateBy(SecurityUtils.getUsername());
        return json(configService.updateConfig(config));
    }

    /**
     * 删除参数配置
     *
     * @param configIds 配置ID数组
     * @return AjaxResult
     */
    @Log(service = "参数管理", businessType = BusinessType.DELETE)
    @PreAuthorize("@role.hasPermi('system:config:remove')")
    @DeleteMapping("/{configIds}")
    public AjaxResult remove(@PathVariable Long[] configIds) {
        return json(configService.deleteConfigByIds(configIds));
    }

    /**
     * 清空缓存
     *
     * @return AjaxResult
     */
    @Log(service = "参数管理", businessType = BusinessType.CLEAN)
    @PreAuthorize("@role.hasPermi('system:config:remove')")
    @DeleteMapping("/clearCache")
    public AjaxResult clearCache() {
        configService.clearCache();
        return AjaxResult.success();
    }
}