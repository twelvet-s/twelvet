package com.twelvet.security.service;

import org.springframework.security.oauth2.common.OAuth2AccessToken;

public interface SysTokenService {

	OAuth2AccessToken getUserTokenInfo(String clientId, String clientSecret, String username, String password);

}