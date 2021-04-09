package com.twelvet;

import com.twelvet.framework.core.annotation.EnableTWTFeignClients;
import com.twelvet.framework.core.annotation.EnableTwelveTConfig;
import com.twelvet.framework.swagger.annotation.EnableTWTSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 启动程序
 * @EnableFeignClients 开启服务扫描
 */
@EnableTwelveTConfig
@EnableTWTFeignClients
@SpringBootApplication
@EnableTWTSwagger2
public class TWTSystemTApp {

    public static void main(String[] args) {
        SpringApplication.run(TWTSystemTApp.class, args);
    }

}
