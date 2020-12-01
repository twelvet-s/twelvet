package com.twelvet.security.feign;

import com.twelvet.api.system.factory.RemoteUserFallbackFactory;
import com.twelvet.api.system.model.UserInfo;
import com.twelvet.framework.core.constants.ServiceNameConstants;
import com.twelvet.framework.core.domain.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统用户登录服务
 */
@FeignClient(
        contextId = "remoteSysLoginService",
        value = ServiceNameConstants.AUTH_SERVICE,
        fallbackFactory = RemoteUserFallbackFactory.class
)
public interface RemoteSysLoginService {

    /**
     * 发起密码模式登录
     *
     * @param username 用户名称
     * @return R<UserInfo>
     */
    @PostMapping("/oauth/token")
    R<UserInfo> login(String username);
}
