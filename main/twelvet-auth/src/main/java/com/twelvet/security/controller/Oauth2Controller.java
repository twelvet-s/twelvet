package com.twelvet.security.controller;

import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.security.service.SysTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: Oauth2登录入口
 */
@RestController
@RequestMapping("/oauth")
public class Oauth2Controller extends TWTController {

    @Autowired
    private SysTokenService sysTokenService;

    @PostMapping("/system/login")
    public AjaxResult getUserTokenInfo(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password) {


        String clientId = "twelvet";
        String clientSecret = "123456";

        OAuth2AccessToken oAuth2AccessToken = sysTokenService.login(clientId, clientSecret, username, password);
        return AjaxResult.success(oAuth2AccessToken);


    }


}
