package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysRole;
import com.twelvet.framework.utils.TWTUtils;
import com.twelvet.server.system.mapper.SysRoleMapper;
import com.twelvet.server.system.service.ISysRoleService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 角色权限服务
 */
@Service
public class SysRoleServiceImpl implements ISysRoleService {
    private final SysRoleMapper roleMapper;

    public SysRoleServiceImpl(SysRoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }

    @Override
    public Set<String> selectRolePermissionByUserId(Long userId) {
        List<SysRole> perms = roleMapper.selectRolePermissionByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (SysRole perm : perms)
        {
            if (TWTUtils.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.getRoleKey().trim().split(",")));
            }
        }
        return permsSet;
    }
}
