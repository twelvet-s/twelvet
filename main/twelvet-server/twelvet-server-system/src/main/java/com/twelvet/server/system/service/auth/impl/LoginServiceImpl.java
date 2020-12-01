package com.twelvet.server.system.service.auth.impl;

import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.server.system.service.auth.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.stereotype.Service;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统用户登录
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private OAuth2RestTemplate oAuth2RestTemplate;

    /**
     * 用户登录
     *
     * @return
     */
    @Override
    public AjaxResult login() {
        return null;
    }

    /**
     * 用户退出
     *
     * @return
     */
    @Override
    public AjaxResult logout() {
        return null;
    }

}
