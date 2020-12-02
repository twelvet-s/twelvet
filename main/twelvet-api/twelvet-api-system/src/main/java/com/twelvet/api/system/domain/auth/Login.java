package com.twelvet.api.system.domain.auth;

import com.twelvet.framework.core.application.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 登录实体
 */
public class Login extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户账号
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 授权类型
     */
    private String grantType;

    /**
     * 授权范围
     */
    private String scope;

    /**
     * 客户端ID
     */
    private String clientId;

    /**
     * 安全码
     */
    private String clientSecret;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGrantType() {
        return grantType;
    }

    public void setGrantType(String grantType) {
        this.grantType = grantType;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("username", getUsername())
                .append("password", getPassword())
                .append("grantType", getGrantType())
                .append("scope", getScope())
                .append("clientId", getClientId())
                .append("clientSecret", getClientId())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
