package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysMenu;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.security.domain.LoginUser;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.server.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统菜单控制器
 */
@RestController
@RequestMapping("/menu")
public class SysMenuController extends TWTController {

    @Autowired
    private ISysMenuService iSysMenuService;

    /**
     * 获取菜单列表
     *
     * @param sysMenu sysMenu
     * @return 菜单数据
     */
    @GetMapping("/list")
    public AjaxResult list(SysMenu sysMenu) {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        Long userId = loginUser.getUserId();
        List<SysMenu> menus = iSysMenuService.selectMenuList(sysMenu, userId);
        return AjaxResult.success(menus);
    }

    /**
     * 根据ID获取菜单信息
     */
    @GetMapping(value = "/{menuId}")
    public AjaxResult getInfo(@PathVariable Long menuId)
    {
        return AjaxResult.success(iSysMenuService.selectMenuById(menuId));
    }

}
