package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysRole;
import com.twelvet.api.system.domain.SysUser;
import com.twelvet.api.system.model.UserInfo;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.constant.UserConstants;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.framework.utils.TWTUtils;
import com.twelvet.server.system.service.ISysPermissionService;
import com.twelvet.server.system.service.ISysPostService;
import com.twelvet.server.system.service.ISysRoleService;
import com.twelvet.server.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息
 */
@RestController
@RequestMapping("/user")
public class SysUserController extends TWTController {

    @Autowired
    private ISysUserService iSysUserService;

    @Autowired
    private ISysRoleService iSysRoleService;

    @Autowired
    private ISysPostService iSysPostService;

    @Autowired
    private ISysPermissionService iSysPermissionService;

    /**
     * 获取用户列表
     *
     * @return
     */
    @GetMapping
    public AjaxResult pageQuery(SysUser user) {
        startPage();
        List<SysUser> list = iSysUserService.selectUserList(user);
        return AjaxResult.success(getDataTable(list));
    }

    @Log(service = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/exportExcel")
    public void exportExcel(HttpServletResponse response, SysUser user) throws IOException {
        List<SysUser> list = iSysUserService.selectUserList(user);
        ExcelUtils<SysUser> excelUtils = new ExcelUtils<SysUser>(SysUser.class);
        excelUtils.exportExcel(response, list, "用户数据");
    }

    @Log(service = "用户管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtils<SysUser> excelUtils = new ExcelUtils<SysUser>(SysUser.class);
        List<SysUser> userList = excelUtils.importExcel(file.getInputStream());
        String operName = SecurityUtils.getUsername();
        String message = iSysUserService.importUser(userList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) throws IOException {
        ExcelUtils<SysUser> excelUtils = new ExcelUtils<>(SysUser.class);
        excelUtils.importTemplateExcel(response, "用户数据");
    }

    /**
     * 获取当前用户信息
     */
    @GetMapping("/info/{username}")
    public R<UserInfo> info(@PathVariable("username") String username) {
        SysUser sysUser = iSysUserService.selectUserByUserName(username);
        if (TWTUtils.isEmpty(sysUser)) {
            return R.fail("用户名或密码错误");
        }
        // 角色集合
        Set<String> roles = iSysPermissionService.getRolePermission(sysUser.getUserId());
        // 权限集合
        Set<String> permissions = iSysPermissionService.getMenuPermission(sysUser.getUserId());
        UserInfo sysUserVo = new UserInfo();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roles);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        Long userId = SecurityUtils.getLoginUser().getUserId();
        // 角色集合
        Set<String> roles = iSysPermissionService.getRolePermission(userId);
        // 权限集合
        Set<String> permissions = iSysPermissionService.getMenuPermission(userId);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", iSysUserService.selectUserById(userId));
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 根据用户编号获取详细信息
     */
    @GetMapping({"/", "/{userId}"})
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) Long userId) {
        AjaxResult ajax = AjaxResult.success();
        List<SysRole> roles = iSysRoleService.selectRoleAll();
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        ajax.put("posts", iSysPostService.selectPostAll());
        if (TWTUtils.isNotEmpty(userId)) {
            ajax.put(AjaxResult.DATA_TAG, iSysUserService.selectUserById(userId));
            ajax.put("postIds", iSysPostService.selectPostListByUserId(userId));
            ajax.put("roleIds", iSysRoleService.selectRoleListByUserId(userId));
        }
        return ajax;
    }

    /**
     * 新增用户
     */
    @Log(service = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysUser user) {
        if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkUserNameUnique(user.getUsername()))) {
            return AjaxResult.error("新增用户'" + user.getUsername() + "'失败，登录账号已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkPhoneUnique(user))) {
            return AjaxResult.error("新增用户'" + user.getUsername() + "'失败，手机号码已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkEmailUnique(user))) {
            return AjaxResult.error("新增用户'" + user.getUsername() + "'失败，邮箱账号已存在");
        }
        user.setCreateBy(SecurityUtils.getUsername());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        return json(iSysUserService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @Log(service = "用户管理", businessType = BusinessType.PUT)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysUser user) {
        iSysUserService.checkUserAllowed(user);
        if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkPhoneUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUsername() + "'失败，手机号码已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(iSysUserService.checkEmailUnique(user))) {
            return AjaxResult.error("修改用户'" + user.getUsername() + "'失败，邮箱账号已存在");
        }
        user.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysUserService.updateUser(user));
    }

    /**
     * 删除用户
     */
    @Log(service = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds) {
        return json(iSysUserService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @Log(service = "用户管理", businessType = BusinessType.PUT)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody SysUser user) {
        iSysUserService.checkUserAllowed(user);
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysUserService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @Log(service = "用户管理", businessType = BusinessType.PUT)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysUser user) {
        iSysUserService.checkUserAllowed(user);
        user.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysUserService.updateUserStatus(user));
    }

}
