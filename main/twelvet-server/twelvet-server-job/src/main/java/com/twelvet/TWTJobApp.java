package com.twelvet;

import com.twelvet.framework.core.annotation.EnableTWTFeignClients;
import com.twelvet.framework.core.annotation.EnableTwelveTConfig;
import com.twelvet.framework.security.config.CommonUserConverter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 启动程序
 * @EnableFeignClients 开启服务扫描
 */
@EnableTwelveTConfig
@EnableTWTFeignClients
@SpringBootApplication
public class TWTJobApp {

    public static void main(String[] args) {
        SpringApplication.run(TWTJobApp.class, args);
    }

}
