package com.twelvet.server.system.mapper;

import com.twelvet.api.system.domain.SysUser;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息Mapper
 */
public interface SysUserMapper {

    /**
     * 根据用户名称查询用户
     * @param userName
     * @return SysUser
     */
    SysUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    SysUser selectUserById(Long userId);

}
