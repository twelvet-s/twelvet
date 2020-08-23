package com.twelvet.security.exception;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.utils.http.ServletUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 自定义异常序列化
 */
public class CustomOauthExceptionSerializer extends StdSerializer<CustomOauth2Exception> {

    protected CustomOauthExceptionSerializer() {
        super(CustomOauth2Exception.class);
    }

    @Override
    public void serialize(CustomOauth2Exception value, JsonGenerator jgen, SerializerProvider serializerProvider) throws IOException {
        HttpServletRequest request = ServletUtil.getRequest();

        jgen.writeStartObject();
        jgen.writeObjectField(AjaxResult.CODE_TAG, value.getHttpErrorCode());
        jgen.writeStringField(AjaxResult.MSG_TAG, value.getMessage());
        jgen.writeStringField(AjaxResult.PATH_TAG,request.getServletPath());
        if(value.getAdditionalInformation()!=null){
            for (Map.Entry<String, String> entry : value.getAdditionalInformation().entrySet()) {
                String key = entry.getKey();
                String add = entry.getValue();
                jgen.writeStringField(key, add);
            }
        }
        jgen.writeEndObject();

    }
}
