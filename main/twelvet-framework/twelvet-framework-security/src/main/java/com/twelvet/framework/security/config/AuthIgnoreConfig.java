package com.twelvet.framework.security.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.context.properties.ConfigurationProperties;


/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 忽略服务间的认证
 */
@Configurable
@ConfigurationProperties(prefix = "security.oauth2.ignore")
public class AuthIgnoreConfig {
    private List<String> urls = new ArrayList<>();

    public List<String> getUrls() {
        return urls;
    }

    public void setUrls(List<String> urls) {
        this.urls = urls;
    }
}
