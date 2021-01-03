package com.twelvet.server.dfs.service;

import com.twelvet.api.dfs.domain.SysDfs;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 文件上传接口
 */
public interface IDFSService {

    /**
     * 文件上传接口
     *
     * @param files 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    List<SysDfs> uploadFile(MultipartFile[] files) throws Exception;

    /**
     * 删除文件
     *
     * @param fileIds
     */
    void deleteFile(Long[] fileIds);

    /**
     * 分页查询
     *
     * @param sysDfs SysDfs
     * @return List<SysDfs>
     */
    List<SysDfs> selectUserList(SysDfs sysDfs);

    /**
     * 下载文件导出给予前端
     *
     * @param fileId 文件id
     */
    void download(Long fileId);

}
