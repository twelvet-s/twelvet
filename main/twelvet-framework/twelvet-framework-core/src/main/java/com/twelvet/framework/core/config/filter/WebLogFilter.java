package com.twelvet.framework.core.config.filter;


import com.twelvet.framework.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 日志拦截收集
 */
@WebFilter(filterName = "BaseFilter", urlPatterns = "/*")
//@Component
// @Aspect
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

        String requestData = "AS";

        long resTime = System.currentTimeMillis() - startTime;

        log.info(
                String.format(
                        "" +
                                "\n===================Request================>"+
                                "\n时间：%s" +
                                "\n地址：%s" +
                                "\ntoken：%s" +
                                "\n参数：%s" +
                                "\n方式：%s" +
                                "\n<=================Response=================="+
                                "\n状态：%s" +
                                "\n内容：%s" +
                                "\n时长：%s毫秒" +
                                "\n====================END=====================",
                        // 请求时间
                        DateUtils.getTime(),
                        // 当前访问完整地址包括端口号
                        "",
                        // 认证Token
                        "",
                        // 请求参数
                        requestData,
                        // 请求方式
                        "",
                        // 请求状态
                        "",
                        // 响应内容
                        "",
                        // 执行时间（ms）
                        resTime
                )
        );

    }

    /*@Pointcut("execution(* com.twelvet..*.controller..*.*(..))")
    public void logPointcut() {

    }

    @Around("logPointcut()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        try {
            Object result = joinPoint.proceed();
            Object[] args = joinPoint.getArgs();

            ObjectMapper objectMapper = new ObjectMapper();

            long endTime = System.currentTimeMillis();
            log.info(
                    String.format(
                            "\n===================Request================>\n时间：%s\n地址：%s\ntoken：%s\n参数：%s\n方式：%s"
                                    + "\n<===================Response================\n状态：%s\n内容：%s\n时长：%s毫秒"
                                    + "\n============================================",
                            DateUtils.getTime(),
                            "url",
                            "token",
                            objectMapper.writeValueAsString(args),
                            "方法",
                            "状态",
                            objectMapper.writeValueAsString(result),
                            endTime - startTime)

            );
            return result;

        } catch (Throwable e) {
            long endTime = System.currentTimeMillis();
            log.error("+++++around " + joinPoint + "\tUse time : " + (endTime - startTime) + " ms with exception : " + e.getMessage());
            throw e;
        }

    }*/

}
