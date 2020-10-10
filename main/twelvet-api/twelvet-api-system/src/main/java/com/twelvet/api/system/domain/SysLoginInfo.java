package com.twelvet.api.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.twelvet.framework.core.application.domain.BaseEntity;

import java.util.Date;

/**
 * 系统访问记录表 sys_login_info
 * 
 * @author ruoyi
 */
public class SysLoginInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long infoId;

    /** 用户账号 */
    private String userName;

    /** 状态 0成功 1失败 */
    private String status;

    /** 地址 */
    private String ipaddr;

    /** 描述 */
    private String msg;

    /** 访问时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date accessTime;

    public Long getInfoId()
    {
        return infoId;
    }

    public void setInfoId(Long infoId)
    {
        this.infoId = infoId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getIpaddr()
    {
        return ipaddr;
    }

    public void setIpaddr(String ipaddr)
    {
        this.ipaddr = ipaddr;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }

    public Date getAccessTime()
    {
        return accessTime;
    }

    public void setAccessTime(Date accessTime)
    {
        this.accessTime = accessTime;
    }

    @Override
    public String toString() {
        return "SysLoginInfo{" +
                "infoId=" + infoId +
                ", userName='" + userName + '\'' +
                ", status='" + status + '\'' +
                ", ipaddr='" + ipaddr + '\'' +
                ", msg='" + msg + '\'' +
                ", accessTime=" + accessTime +
                '}';
    }
}