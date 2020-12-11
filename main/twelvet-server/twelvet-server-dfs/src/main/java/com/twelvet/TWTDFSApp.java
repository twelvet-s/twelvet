package com.twelvet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 启动程序
 * @EnableFeignClients 开启服务扫描
 */
@SpringBootApplication
public class TWTDFSApp {

    public static void main(String[] args) {
        SpringApplication.run(TWTDFSApp.class, args);
    }

}
