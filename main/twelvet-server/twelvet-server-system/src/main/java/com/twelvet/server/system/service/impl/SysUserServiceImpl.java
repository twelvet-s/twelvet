package com.twelvet.server.system.service.impl;

import com.twelvet.api.system.domain.SysUser;
import com.twelvet.server.system.mapper.SysUserMapper;
import com.twelvet.server.system.service.ISysUserService;
import org.springframework.stereotype.Service;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 用户信息
 */
@Service
public class SysUserServiceImpl implements ISysUserService {

    private final SysUserMapper userMapper;

    public SysUserServiceImpl(SysUserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 通过用户名称搜索
     * @param username
     * @return
     */
    @Override
    public SysUser selectUserByUserName(String username) {
        return userMapper.selectUserByUserName(username);
    }
}
