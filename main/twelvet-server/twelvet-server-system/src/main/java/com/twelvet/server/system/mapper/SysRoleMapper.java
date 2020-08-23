package com.twelvet.server.system.mapper;

import com.twelvet.api.system.domain.SysRole;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 角色表 数据层
 */
public interface SysRoleMapper {

    /**
     * 根据用户ID查询角色
     *
     * @param userId
     * @return
     */
    List<SysRole> selectRolePermissionByUserId(Long userId);

}
