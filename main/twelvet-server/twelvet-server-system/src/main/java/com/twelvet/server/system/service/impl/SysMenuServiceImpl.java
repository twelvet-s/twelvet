package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysMenu;
import com.twelvet.api.system.domain.SysUser;
import com.twelvet.framework.utils.TWTUtils;
import com.twelvet.server.system.mapper.SysMenuMapper;
import com.twelvet.server.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private SysMenuMapper SysMenuMapper;

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectMenuPermsByUserId(Long userId) {
        List<String> perms = SysMenuMapper.selectMenuPermsByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (String perm : perms) {
            if (TWTUtils.isNotEmpty(perm)) {
                permsSet.addAll(Arrays.asList(perm.trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 查询系统菜单列表
     *
     * @param menu 菜单信息
     * @return 菜单列表
     */
    @Override
    public List<SysMenu> selectMenuList(SysMenu menu, Long userId) {
        List<SysMenu> menuList;
        // 管理员显示所有菜单信息
        if (SysUser.isAdmin(userId)) {
            menuList = SysMenuMapper.selectMenuList(menu);
        } else {
            menu.getParams().put("userId", userId);
            menuList = SysMenuMapper.selectMenuListByUserId(menu);
        }
        return menuList;
    }

    /**
     * 根据菜单ID查询信息
     *
     * @param menuId 菜单ID
     * @return 菜单信息
     */
    @Override
    public SysMenu selectMenuById(Long menuId)
    {
        return SysMenuMapper.selectMenuById(menuId);
    }
}
