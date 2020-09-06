package com.twelvet.server.system.service;

import com.twelvet.api.system.domain.SysUser;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息
 */
public interface ISysUserService {

    /**
     * 根据用户登录名称查询
     * @param username
     * @return
     */
    SysUser selectUserByUserName(String username);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    SysUser selectUserById(Long userId);

}

