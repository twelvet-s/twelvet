package com.twelvet.framework.core.config.filter;


import cn.hutool.json.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.twelvet.framework.core.constants.Constants;
import com.twelvet.framework.utils.DateUtils;
import com.twelvet.framework.utils.http.ServletUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 日志拦截收集
 */
@Component
@WebFilter(filterName = "LogFilter", urlPatterns = "/*")
public class WebLogFilter implements Filter {

    private final static Logger log = LoggerFactory.getLogger(WebLogFilter.class);

    /**
     * 记录执行日志
     *
     * @param servletRequest  servletRequest
     * @param servletResponse servletResponse
     * @param filterChain     filterChain
     * @throws IOException      IOException
     * @throws ServletException ServletException
     */
    @Override
    public void doFilter(
            ServletRequest servletRequest,
            ServletResponse servletResponse,
            FilterChain filterChain
    ) throws IOException, ServletException {
        long startTime = System.currentTimeMillis();

        // 执行业务
        filterChain.doFilter(servletRequest, servletResponse);

        String method = ServletUtils.getRequest().getMethod();

        String requestData;

        ObjectMapper objectMapper = new ObjectMapper();

        // 获取数据
        if (ServletUtils.METHOD_GET.equals(method)) {
            requestData = objectMapper.writeValueAsString(ServletUtils.getMapParam());
        } else {
            requestData = ServletUtils.getStrFromStream((HttpServletRequest) servletRequest);
        }

        long resTime = System.currentTimeMillis() - startTime;

        log.info(
                String.format(
                        "" +
                                "\n===================Request================>" +
                                "\n时间：%s" +
                                "\n地址：%s" +
                                "\ntoken：%s" +
                                "\n参数：%s" +
                                "\n方式：%s" +
                                "\n<===================Response================" +
                                "\n状态：%s" +
                                "\n内容：%s" +
                                "\n时长：%s毫秒" +
                                "\n=======================END==================",
                        // 请求时间
                        DateUtils.getTime(),
                        // 当前访问完整地址包括端口号
                        ServletUtils.getHostRequestURI(),
                        // 认证Token
                        ServletUtils.getRequest().getHeader(Constants.AUTHORIZATION),
                        // 请求参数
                        requestData,
                        // 请求方式
                        method,
                        // 请求状态
                        ServletUtils.getResponse().getStatus(),
                        // 响应内容
                        1,
                        // 执行时间（ms）
                        resTime
                )
        );

    }

}
