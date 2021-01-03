package com.twelvet.server.dfs.mapper;

import com.twelvet.api.dfs.domain.SysDfs;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 文件上传Mapper
 */
public interface DFSMapper {

    /**
     * 插入数据
     *
     * @return 响应条数
     */
    int batchSysDfs(List<SysDfs> sysDfsList);

    /**
     * 删除数据
     *
     * @param fileIds 文件id
     * @return 影响行数
     */
    int deleteSysDfsByFileIds(Long[] fileIds);

    /**
     * 获取文件列表
     *
     * @param sysDfs SysDfs
     * @return SysDfs
     */
    List<SysDfs> selectDfsList(SysDfs sysDfs);

    /**
     * 根据fileIds获取文件列表
     *
     * @param fileIds 文件id
     * @return SysDfs
     */
    SysDfs selectDfsByFileIds(Long fileIds);

    /**
     * 根据fileIds获取文件列表
     *
     * @param fileIds 文件id
     * @return SysDfs
     */
    List<SysDfs> selectDfsListByFileIds(Long[] fileIds);

}
