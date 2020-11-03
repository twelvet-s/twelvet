package com.twelvet.server;

import com.twelvet.framework.core.annotation.EnableTWTFeignClients;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 启动程序
 * @EnableFeignClients 开启服务扫描
 */
@EnableTWTFeignClients
@SpringCloudApplication
public class TWTJobApp {

    public static void main(String[] args) {
        SpringApplication.run(TWTJobApp.class, args);
    }

}
