package com.twelvet.framework.core.handler;

import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.exception.TWTException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.NoHandlerFoundException;



/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 全局异常处理器
 */
@RestControllerAdvice
public class TWTExceptionHandler {

    private final Logger log = LoggerFactory.getLogger(TWTExceptionHandler.class);

    /**
     * 基础异常
     * @param e TWTException
     * @return AjaxResult
     */
    @ExceptionHandler(TWTException.class)
    public AjaxResult fastGoException(TWTException e)
    {
        return AjaxResult.error(e.getMessage());
    }

    /**
     * 404异常
     * @param e Exception
     * @return AjaxResult
     */
    @ExceptionHandler(NoHandlerFoundException.class)
    public AjaxResult handlerNoFoundException(Exception e)
    {
        log.error(e.getMessage(), e);
        return AjaxResult.error(HttpStatus.NOT_FOUND.value(), "路径不存在，请检查路径是否正确");
    }

    /**
     *
     * @param e Exception
     * @return AjaxResult
     */
    @ExceptionHandler(Exception.class)
    public AjaxResult handleException(Exception e)
    {
        log.error(e.getMessage(), e);
        return AjaxResult.error("系统内部出错！！！");
    }

}
