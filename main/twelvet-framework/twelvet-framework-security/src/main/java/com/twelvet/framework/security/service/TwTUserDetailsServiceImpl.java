package com.twelvet.framework.security.service;

import com.twelvet.api.system.RemoteUserService;
import com.twelvet.api.system.domain.SysUser;
import com.twelvet.api.system.model.UserInfo;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.security.domain.LoginUser;
import com.twelvet.framework.utils.TWTUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 自定义用户信息处理
 */
@Service("TWTUserDetails")
public class TwTUserDetailsServiceImpl implements UserDetailsService {

    private static final Logger log = LoggerFactory.getLogger(TwTUserDetailsServiceImpl.class);

    @Autowired
    private RemoteUserService remoteUserService;


    @Override
    public UserDetails loadUserByUsername(String username) {
        R<UserInfo> userResult = remoteUserService.getUserInfo(username);
        auth(userResult, username);
        return getUserDetails(userResult);
    }

    /**
     * 自定义账号状态检测
     *
     * @param userResult userResult
     * @param username   username
     */
    private void auth(R<UserInfo> userResult, String username) {
        if (TWTUtils.isEmpty(userResult) || TWTUtils.isEmpty(userResult.getData())) {
            log.info("登录用户：{} 不存在.", username);
            throw new UsernameNotFoundException("登录用户：" + username + " 不存在");
        }
    }

    /**
     * 得到UserDetails
     *
     * @param result result
     * @return UserDetails
     */
    private UserDetails getUserDetails(R<UserInfo> result) {
        UserInfo info = result.getData();

        Set<String> dbAuthsSet = new HashSet<>();
        if (TWTUtils.isNotEmpty(info.getRoles())) {
            // 获取角色
            dbAuthsSet.addAll(info.getRoles());
            // 获取权限
            dbAuthsSet.addAll(info.getPermissions());
        }

        Collection<? extends GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(
                dbAuthsSet.toArray(new String[0])
        );

        SysUser user = info.getSysUser();

        return new LoginUser(
                user.getUserId(),
                user.getUsername(),
                user.getPassword(),
                true,
                true,
                true,
                true,
                authorities
        );
    }

}
