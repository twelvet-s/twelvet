package com.twelvet.security.config;

import com.twelvet.security.AuthenticationEntryPointImpl;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: Web安全配置
 */
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserDetailsService userDetailsService;

    public WebSecurityConfig(@Qualifier("twelvetUserDetails") UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    /**
     * 加密编码模式
     *
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 认证管理器
     *
     * @return
     * @throws Exception
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 、编码模式
     *
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    /**
     * Http安全配置
     *
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                // 认证失败处理类
                .exceptionHandling().authenticationEntryPoint(new AuthenticationEntryPointImpl())
                // 设置安全
                .and().authorizeRequests()
                // 放行路径
                .antMatchers(
                        "/actuator/**",
                        "/oauth/*",
                        "/token/**").permitAll()
                // 除以上所有进行拦截
                .anyRequest().authenticated()
                // 关闭csrf
                .and().csrf().disable();
    }

}
