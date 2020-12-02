package com.twelvet.security.controller;

import com.alibaba.fastjson.JSON;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.utils.http.ServletUtils;
import com.twelvet.security.service.SysTokenService;
import org.apache.tomcat.util.http.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: Oauth2登录入口
 */
@RestController
public class Oauth2Controller extends TWTController {

    @Autowired
    private SysTokenService sysTokenService;

    @PostMapping("/oauth/user/token")
    public void getUserTokenInfo(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password) {

        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        HttpServletResponse response = servletRequestAttributes.getResponse();
        try {

            String clientId = "twelvet";
            String clientSecret = "123456";

            OAuth2AccessToken oAuth2AccessToken = sysTokenService.getUserTokenInfo(clientId, clientSecret, username,
                    password);
            ServletUtils.render(200, JSON.toJSONString(oAuth2AccessToken));


        } catch (Exception e) {

            Map<String, String> rsp = new HashMap<>();
            rsp.put("code", HttpStatus.UNAUTHORIZED.value() + "");
            rsp.put("msg", e.getMessage());
            ServletUtils.render(200, JSON.toJSONString(rsp));

        }
    }


}
