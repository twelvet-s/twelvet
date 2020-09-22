package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysUser;
import com.twelvet.server.system.mapper.SysUserMapper;
import com.twelvet.server.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息
 */
@Service
public class SysUserServiceImpl implements ISysUserService {

    @Autowired
    private SysUserMapper userMapper;

    /**
     * 通过用户名称搜索
     *
     * @param username
     * @return
     */
    @Override
    public SysUser selectUserByUserName(String username) {
        return userMapper.selectUserByUserName(username);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public SysUser selectUserById(Long userId) {
        return userMapper.selectUserById(userId);
    }
}
