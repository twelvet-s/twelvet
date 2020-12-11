package com.twelvet.server.dfs.service.impl;


import com.twelvet.server.dfs.service.IDFSService;
import com.twelvet.server.dfs.utils.DFSUploadUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 本地文件存储
 */
@Primary
@Service
public class LocalDFSServiceImpl implements IDFSService {
    /**
     * 资源映射路径 前缀
     */
    @Value("${file.prefix}")
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    @Value("${file.domain}")
    public String domain;

    /**
     * 上传文件存储在本地的根路径
     */
    @Value("${file.path}")
    private String localFilePath;

    /**
     * 本地文件上传接口
     * @param file 上传的文件
     * @return
     * @throws Exception
     */
    @Override
    public String uploadFile(MultipartFile file) throws Exception {
        String name = DFSUploadUtils.upload(localFilePath, file);
        return domain + localFilePrefix + name;
    }
}
