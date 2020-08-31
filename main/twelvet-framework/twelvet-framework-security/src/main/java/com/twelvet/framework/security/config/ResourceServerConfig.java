package com.twelvet.framework.security.config;

import com.twelvet.framework.security.AuthenticationEntryPointImpl;
import org.springframework.boot.autoconfigure.security.oauth2.OAuth2ClientProperties;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;


/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 资源服务器配置
 */
@Configuration
@EnableResourceServer
public class ResourceServerConfig extends ResourceServerConfigurerAdapter {
    private final ResourceServerProperties resourceServerProperties;

    private final OAuth2ClientProperties oAuth2ClientProperties;

    public ResourceServerConfig(
            ResourceServerProperties resourceServerProperties,
            OAuth2ClientProperties oAuth2ClientProperties
    ) {
        this.resourceServerProperties = resourceServerProperties;
        this.oAuth2ClientProperties = oAuth2ClientProperties;
    }

    @Bean
    public AuthIgnoreConfig authIgnoreConfig() {
        return new AuthIgnoreConfig();
    }

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setErrorHandler(new DefaultResponseErrorHandler());
        return restTemplate;
    }

    /*@Bean
    public ResourceServerTokenServices tokenServices()
    {
        RemoteTokenServices remoteTokenServices = new RemoteTokenServices();
        DefaultAccessTokenConverter accessTokenConverter = new DefaultAccessTokenConverter();
        UserAuthenticationConverter userTokenConverter = new CommonUserConverter();
        accessTokenConverter.setUserTokenConverter(userTokenConverter);
        remoteTokenServices.setCheckTokenEndpointUrl(resourceServerProperties.getTokenInfoUri());
        remoteTokenServices.setClientId(oAuth2ClientProperties.getClientId());
        remoteTokenServices.setClientSecret(oAuth2ClientProperties.getClientSecret());
        remoteTokenServices.setRestTemplate(restTemplate());
        remoteTokenServices.setAccessTokenConverter(accessTokenConverter);
        return remoteTokenServices;
    }*/

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                // 认证失败处理类
                .exceptionHandling().authenticationEntryPoint(new AuthenticationEntryPointImpl());
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http
                .authorizeRequests();
        // 不登录可以访问
        authIgnoreConfig().getUrls().forEach(url -> registry.antMatchers(url).permitAll());
        registry.anyRequest().authenticated();
    }

/*    @Override
    public void configure(ResourceServerSecurityConfigurer resources)
    {
        resources.tokenServices(tokenServices());
    }*/
}
