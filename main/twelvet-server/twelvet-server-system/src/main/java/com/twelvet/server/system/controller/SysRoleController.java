package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysRole;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.constant.UserConstants;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.system.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 角色信息
 */
@RestController
@RequestMapping("/role")
public class SysRoleController extends TWTController {

    @Autowired
    private ISysRoleService iSysRoleService;

    /**
     * 角色信息分页查询
     *
     * @param role SysRole
     * @return AjaxResult
     */
    @GetMapping("/pageQuery")
    @PreAuthorize("@role.hasPermi('system:role:list')")
    public AjaxResult pageQuery(SysRole role) {
        startPage();
        List<SysRole> list = iSysRoleService.selectRoleList(role);
        return AjaxResult.success(getDataTable(list));
    }

    /**
     * 数据导出
     *
     * @param response HttpServletResponse
     * @param role SysRole
     */
    @Log(service = "角色管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @PreAuthorize("@role.hasPermi('system:role:export')")
    public void export(HttpServletResponse response, SysRole role) {
        List<SysRole> list = iSysRoleService.selectRoleList(role);
        ExcelUtils<SysRole> excelUtils = new ExcelUtils<>(SysRole.class);
        excelUtils.exportExcel(response, list, "角色数据");
    }

    /**
     * 根据角色编号获取详细信息
     *
     * @param roleId 角色ID
     * @return AjaxResult
     */
    @GetMapping("/{roleId}")
    @PreAuthorize("@role.hasPermi('system:role:query')")
    public AjaxResult getInfo(@PathVariable Long roleId) {
        return AjaxResult.success(iSysRoleService.selectRoleById(roleId));
    }

    /**
     * 新增角色
     *
     * @param role SysRole
     * @return AjaxResult
     */
    @Log(service = "角色管理", businessType = BusinessType.INSERT)
    @PostMapping
    @PreAuthorize("@role.hasPermi('system:role:insert')")
    public AjaxResult insert(@Validated @RequestBody SysRole role) {
        if (UserConstants.NOT_UNIQUE.equals(iSysRoleService.checkRoleNameUnique(role))) {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(iSysRoleService.checkRoleKeyUnique(role))) {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setCreateBy(SecurityUtils.getUsername());
        return json(iSysRoleService.insertRole(role));
    }

    /**
     * 修改保存角色
     *
     * @param role SysRole
     * @return AjaxResult
     */
    @Log(service = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @PreAuthorize("@role.hasPermi('system:role:update')")
    public AjaxResult update(@Validated @RequestBody SysRole role) {
        iSysRoleService.checkRoleAllowed(role);
        if (UserConstants.NOT_UNIQUE.equals(iSysRoleService.checkRoleNameUnique(role))) {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(iSysRoleService.checkRoleKeyUnique(role))) {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysRoleService.updateRole(role));
    }

    /**
     * 状态修改
     *
     * @param role SysRole
     * @return AjaxResult
     */
    @Log(service = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @PreAuthorize("@role.hasPermi('system:role:update')")
    public AjaxResult changeStatus(@RequestBody SysRole role) {
        iSysRoleService.checkRoleAllowed(role);
        role.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysRoleService.updateRoleStatus(role));
    }

    /**
     * 删除角色
     */
    @Log(service = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    @PreAuthorize("@role.hasPermi('system:role:remove')")
    public AjaxResult remove(@PathVariable Long[] roleIds) {
        return json(iSysRoleService.deleteRoleByIds(roleIds));
    }

    /**
     * 获取角色选择框列表
     */
    @GetMapping("/optionSelect")
    @PreAuthorize("@role.hasPermi('system:role:query')")
    public AjaxResult optionSelect() {
        return AjaxResult.success(iSysRoleService.selectRoleAll());
    }
}