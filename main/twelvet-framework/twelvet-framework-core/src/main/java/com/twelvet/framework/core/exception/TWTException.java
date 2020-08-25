package com.twelvet.framework.core.exception;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 基础异常
 */
public class TWTException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private String msg;

    private int code = 500;

    public TWTException(String msg) {
        super(msg);
        this.msg = msg;
    }

    public TWTException(String msg, Throwable e) {
        super(msg, e);
        this.msg = msg;
    }

    public TWTException(String msg, int code) {
        super(msg);
        this.msg = msg;
        this.code = code;
    }

    public TWTException(String msg, int code, Throwable e) {
        super(msg, e);
        this.msg = msg;
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

}
