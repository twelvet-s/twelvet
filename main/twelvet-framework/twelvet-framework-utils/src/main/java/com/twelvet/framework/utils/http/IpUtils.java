package com.twelvet.framework.utils.http;

import com.twelvet.framework.utils.StringUtils;
import com.twelvet.framework.utils.TWTUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: IP工具类
 */
public class IpUtils {

    private static final String UNKNOWN = "unknown";

    /**
     * 获取客户端IP
     *
     * @return IP
     */
    public static String getIpAddr() {
        return getIpAddr(ServletUtils.getRequest());
    }

    /**
     * 获取客户端IP地址
     *
     * @param request HttpServletRequest
     * @return String
     */
    public static String getIpAddr(HttpServletRequest request) {

        if (TWTUtils.isEmpty(request)) {
            return UNKNOWN;
        }

        String ip = request.getHeader("x-forwarded-for");

        if (StringUtils.isEmpty(ip) || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ip) || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (StringUtils.isEmpty(ip) || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (StringUtils.isEmpty(ip) || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }

        if (StringUtils.isEmpty(ip) || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
    }

    /**
     * 获得服务器IP
     *
     * @return
     */
    public static String getHostIp() {
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
        }
        return "127.0.0.1";
    }

    /**
     * 获取服务器名称
     *
     * @return
     */
    public static String getHostName() {
        try {
            return InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
        }
        return "未知";
    }
}
