package com.twelvet.server.system.service.impl;

import com.twelvet.framework.utils.TWTUtil;
import com.twelvet.server.system.mapper.SysMenuMapper;
import com.twelvet.server.system.service.ISysMenuService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 菜单权限
 */
@Service
public class SysMenuServiceImpl implements ISysMenuService {
    private final SysMenuMapper SysMenuMapper;

    public SysMenuServiceImpl(SysMenuMapper SysMenuMapper) {
        this.SysMenuMapper = SysMenuMapper;
    }

    @Override
    public Set<String> selectMenuPermsByUserId(Long userId) {
        List<String> perms = SysMenuMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms)
        {
            if (TWTUtil.isNotEmpty(perm))
            {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }
}
