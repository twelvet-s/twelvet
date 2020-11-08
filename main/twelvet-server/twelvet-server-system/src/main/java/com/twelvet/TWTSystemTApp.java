package com.twelvet;

import com.twelvet.framework.core.annotation.EnableTWTFeignClients;
import com.twelvet.framework.core.annotation.EnableTwelveTConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 启动程序
 * @EnableFeignClients 开启服务扫描
 */
@EnableTwelveTConfig
@EnableTWTFeignClients
@SpringBootApplication
public class TWTSystemTApp {

    public static void main(String[] args) {
        SpringApplication.run(TWTSystemTApp.class, args);
    }

}
