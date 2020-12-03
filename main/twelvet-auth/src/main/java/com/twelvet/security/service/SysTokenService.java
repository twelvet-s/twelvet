package com.twelvet.security.service;

import org.springframework.security.oauth2.common.OAuth2AccessToken;

public interface SysTokenService {

    /**
     * 登录接口
     *
     * @param clientId
     * @param clientSecret
     * @param username
     * @param password
     * @return
     */
    OAuth2AccessToken login(String clientId, String clientSecret, String username, String password);

}