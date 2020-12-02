package com.twelvet.server.system.service.auth.impl;

import com.twelvet.api.system.domain.auth.Login;
import com.twelvet.api.system.feign.RemoteSysLoginService;
import com.twelvet.api.system.model.UserInfo;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.domain.R;
import com.twelvet.server.system.service.auth.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.BaseOAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.DefaultAccessTokenRequest;
import org.springframework.stereotype.Service;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统用户登录
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private RemoteSysLoginService remoteSysLoginService;

    /**
     * 用户登录
     *
     * @return
     */
    @Override
    public AjaxResult login(Login login) {

        login.setGrantType("password");
        login.setScope("server");
        login.setClientId("twelvet");
        login.setClientSecret("123456");

        R<UserInfo> login1 = remoteSysLoginService.login(login);

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
