package com.twelvet.framework.swagger.annotation;

import com.twelvet.framework.swagger.config.SwaggerAutoConfiguration;
import org.springframework.context.annotation.Import;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.lang.annotation.*;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 开启swagger文档
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@EnableSwagger2
@Import({ SwaggerAutoConfiguration.class})
public @interface EnableTWTSwagger2 {

}