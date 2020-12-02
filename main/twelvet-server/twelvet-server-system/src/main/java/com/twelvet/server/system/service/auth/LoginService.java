package com.twelvet.server.system.service.auth;

import com.twelvet.api.system.domain.auth.Login;
import com.twelvet.framework.core.application.domain.AjaxResult;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统用户登录
 */
public interface LoginService {

    /**
     * 用户登录
     *
     * @return AjaxResult
     */
    AjaxResult login(Login login);

    /**
     * 用户退出
     *
     * @return AjaxResult
     */
    AjaxResult logout();

}
