package com.twelvet.server.dfs.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 文件上传接口
 */
public interface IDFSService {
    /**
     * 文件上传接口
     *
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    String uploadFile(MultipartFile file) throws Exception;
}
