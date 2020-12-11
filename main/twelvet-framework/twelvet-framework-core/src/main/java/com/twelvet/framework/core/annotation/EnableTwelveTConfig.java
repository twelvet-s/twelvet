package com.twelvet.framework.core.annotation;


import com.twelvet.framework.core.config.ApplicationConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.cloud.openfeign.FeignAutoConfiguration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.annotation.EnableAsync;

import java.lang.annotation.*;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 自定义核心注解
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
// 表示通过aop框架暴露该代理对象,AopContext能够访问
@EnableAspectJAutoProxy(exposeProxy = true)
// 扫描Mappoer
@MapperScan("com.twelvet.**.mapper")
// 开启线程异步执行
@EnableAsync
// 自动加载类
@Import({ ApplicationConfig.class, FeignAutoConfiguration.class })
public @interface EnableTwelveTConfig {
}
