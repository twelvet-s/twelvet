package com.twelvet.framework.security.config;

import java.util.*;

import com.twelvet.framework.security.annotation.AuthIgnore;
import com.twelvet.framework.utils.TWTUtils;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;


/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 忽略服务间的认证
 */
@Configurable
@ConfigurationProperties(prefix = "security.oauth2.ignore")
public class AuthIgnoreConfig implements InitializingBean {
    /**
     * 注解urls
     */
    private List<String> urls = new ArrayList<>();

    @Autowired
    private WebApplicationContext applicationContext;

    private List<String> ignoreUrls = new ArrayList<>();

    public List<String> getIgnoreUrls() {
        return ignoreUrls;
    }

    public void setIgnoreUrls(List<String> ignoreUrls) {
        this.ignoreUrls = ignoreUrls;
    }

    @Override
    public void afterPropertiesSet() {
        RequestMappingHandlerMapping mapping = applicationContext.getBean(RequestMappingHandlerMapping.class);
        Map<RequestMappingInfo, HandlerMethod> map = mapping.getHandlerMethods();

        // 遍历所有mapping
        map.keySet().forEach(mappingInfo -> {

            HandlerMethod handlerMethod = map.get(mappingInfo);
            // 检测方法是否存在注解
            AuthIgnore method = handlerMethod.getMethod().getAnnotation(AuthIgnore.class);
            // 检测Controller是否在注解
            AuthIgnore controller = handlerMethod.getBeanType().getAnnotation(AuthIgnore.class);

            // 本方法或本Controller存在AuthIgnore注解将存进列表
            if (TWTUtils.isNotEmpty(method) || TWTUtils.isNotEmpty(controller)) {
                ignoreUrls.addAll(mappingInfo.getPatternsCondition().getPatterns());
            }

        });

        // 合并放行路径
        ignoreUrls.addAll(urls);
    }
}
