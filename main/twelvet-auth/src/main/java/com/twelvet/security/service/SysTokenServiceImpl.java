package com.twelvet.security.service;

import com.twelvet.framework.core.exception.TWTException;
import com.twelvet.framework.security.service.RedisClientDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.TokenRequest;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.HashMap;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description:
 */
@Service
public class SysTokenServiceImpl implements SysTokenService {

    /**
     * 数据源
     */
    @Autowired
    private DataSource dataSource;

    @Autowired
    private AuthorizationServerTokenServices authorizationServerTokenServices;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public void preCheckClient(String clientId, String clientSecret) {
        if (clientId == null || "".equals(clientId)) {
            throw new UnapprovedClientAuthenticationException("请求参数中无clientId信息");
        }

        if (clientSecret == null || "".equals(clientSecret)) {
            throw new UnapprovedClientAuthenticationException("请求参数中无clientSecret信息");
        }
    }

    @Override
    public OAuth2AccessToken getUserTokenInfo(String clientId, String clientSecret, String username, String password) {
        try {
            RedisClientDetailsService redisClientDetailsService = new RedisClientDetailsService(dataSource);
            OAuth2AccessToken oauth2AccessToken;
            this.preCheckClient(clientId, clientSecret);
            ClientDetails clientDetails = redisClientDetailsService.loadClientByClientId(clientId);

            if (clientDetails == null) {
                throw new UnapprovedClientAuthenticationException("clientId对应的信息不存在");
            } else if (!passwordEncoder.matches(clientSecret, clientDetails.getClientSecret())) {
                throw new UnapprovedClientAuthenticationException("clientSecret不匹配");
            }

            TokenRequest tokenRequest = new TokenRequest(new HashMap<>(), clientId, clientDetails.getScope(),
                    "password");

            OAuth2Request oAuth2Request = tokenRequest.createOAuth2Request(clientDetails);

            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);

            Authentication authentication = authenticationManager.authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authentication);

            OAuth2Authentication oauth2Authentication = new OAuth2Authentication(oAuth2Request, authentication);

            oauth2AccessToken = authorizationServerTokenServices.createAccessToken(oauth2Authentication);

            oauth2Authentication.setAuthenticated(true);

            return oauth2AccessToken;
        } catch (Exception e) {
            throw new TWTException(e.getMessage());
        }
    }
}
