package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysUser;
import com.twelvet.server.system.service.ISysMenuService;
import com.twelvet.server.system.service.ISysPermissionService;
import com.twelvet.server.system.service.ISysRoleService;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 权限服务
 */
@Service
public class SysPermissionServiceImpl implements ISysPermissionService {

    private final ISysRoleService roleService;

    private final ISysMenuService menuService;

    public SysPermissionServiceImpl(ISysRoleService roleService, ISysMenuService menuService) {
        this.roleService = roleService;
        this.menuService = menuService;
    }

    @Override
    public Set<String> getRolePermission(Long userId) {
        Set<String> roles = new HashSet<>();
        // 管理员拥有所有权限
        if (SysUser.isAdmin(userId))
        {
            roles.add("admin");
        }
        else
        {
            roles.addAll(roleService.selectRolePermissionByUserId(userId));
        }
        return roles;
    }

    @Override
    public Set<String> getMenuPermission(Long userId) {
        Set<String> perms = new HashSet<>();
        // 管理员拥有所有权限
        if (SysUser.isAdmin(userId))
        {
            perms.add("*:*:*");
        }
        else
        {
            perms.addAll(menuService.selectMenuPermsByUserId(userId));
        }
        return perms;
    }

}
