package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysMenu;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.exception.TWTException;
import com.twelvet.framework.security.domain.LoginUser;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.server.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

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
     * 新增菜单
     *
     * @param menu SysMenu
     * @return 操作信息
     */
    @PostMapping
    public AjaxResult insert(@Validated @RequestBody SysMenu menu) {
        if (iSysMenuService.checkMenuNameUnique(menu)) {
            throw new TWTException("新增菜单【" + menu.getMenuName() + "】失败，菜单名称已存在");
        }
        // 加入当前操作人员ID
        menu.setCreateBy(SecurityUtils.getUsername());
        return json(iSysMenuService.insertMenu(menu));
    }

    /**
     * 删除菜单
     *
     * @param menuId menuId
     * @return 操作提示
     */
    @DeleteMapping("/{menuId}")
    public AjaxResult remove(@PathVariable("menuId") Long menuId) {
        if (iSysMenuService.hasChildByMenuId(menuId)) {
            return AjaxResult.error("存在子菜单,不允许删除");
        }
        if (iSysMenuService.checkMenuExistRole(menuId)) {
            return AjaxResult.error("菜单已分配角色,不允许删除");
        }
        return json(iSysMenuService.deleteMenuById(menuId));
    }

    /**
     * 修改菜单
     */
    @PutMapping
    public AjaxResult update(@Validated @RequestBody SysMenu menu) {
        if (iSysMenuService.checkMenuNameUnique(menu)) {
            throw new TWTException("新增菜单【" + menu.getMenuName() + "】失败，菜单名称已存在");
        }
        menu.setUpdateBy(SecurityUtils.getUsername());
        return json(iSysMenuService.updateMenu(menu));
    }

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
     *
     * @param menuId menuId
     * @return 操心信息
     */
    @GetMapping(value = "/{menuId}")
    public AjaxResult getByMenuId(@PathVariable Long menuId) {
        return AjaxResult.success(iSysMenuService.selectByMenuId(menuId));
    }

}
