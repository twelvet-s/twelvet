package com.twelvet.security;

import com.alibaba.fastjson.JSON;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.utils.http.ServletUtil;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 认证失败处理类 返回未授权
 */
@Component
public class AuthenticationEntryPointImpl implements AuthenticationEntryPoint, Serializable {
    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) {

        // 获取状态码
        int code = HttpStatus.UNAUTHORIZED.value();
        // 发送json数据
        ServletUtil.render(
                code,
                JSON.toJSONString(AjaxResult.error(code, "Sorry, You don't have access"))
        );

    }
}