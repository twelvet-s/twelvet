package com.twelvet.server.system.controller;

import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.server.system.service.auth.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统用户登录入口
 */
@RestController
@RequestMapping("/login")
public class LoginController extends TWTController {

    @Autowired
    private LoginService loginService;

    /**
     * 用户登录
     *
     * @return AjaxResult
     */
    public AjaxResult login() {
        return null;
    }

    /**
     * 用户退出
     *
     * @return AjaxResult
     */
    public AjaxResult logout() {
        return null;
    }

}
