package com.twelvet.framework.security.feign;

import com.twelvet.framework.utils.TWTUtils;
import com.twelvet.framework.utils.http.IpUtils;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: Feign 请求拦截器
 */
@Component
public class FeignRequestInterceptor implements RequestInterceptor {

    /**
     * 配置请求体带上access_token
     *
     * @param requestTemplate RequestTemplate
     */
    @Override
    public void apply(RequestTemplate requestTemplate) {

        // 配置客户端IP
        requestTemplate.header("X-Forwarded-For", IpUtils.getIpAddr());

        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        if (TWTUtils.isNotEmpty(authentication) && authentication.getDetails() instanceof OAuth2AuthenticationDetails) {
            OAuth2AuthenticationDetails details = (OAuth2AuthenticationDetails) authentication.getDetails();

            requestTemplate.header(
                    HttpHeaders.AUTHORIZATION,
                    String.format("%s %s", "Bearer", details.getTokenValue())
            );
        }
    }
}