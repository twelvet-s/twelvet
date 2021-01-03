package com.twelvet.server.dfs.controller;

import com.twelvet.api.dfs.domain.SysDfs;
import com.twelvet.api.system.domain.SysFile;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.utils.file.FileUtils;
import com.twelvet.server.dfs.mapper.DFSMapper;
import com.twelvet.server.dfs.service.IDFSService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 文件请求处理
 */
@RestController
public class DFSController extends TWTController {

    private static final Logger log = LoggerFactory.getLogger(DFSController.class);

    @Autowired
    private IDFSService sysFileService;

    /**
     * @param files MultipartFile[]
     * @return R<SysFile>
     */
    @Log(service = "文件上传", businessType = BusinessType.IMPORT)
    @PostMapping("/upload")
    public AjaxResult upload(MultipartFile[] files) {
        try {
            // 上传并返回访问地址
            List<SysDfs> sysDfsList = sysFileService.uploadFile(files);

            return AjaxResult.success(sysDfsList);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            return AjaxResult.error(e.getMessage());
        }
    }

    @Log(service = "下载文件", businessType = BusinessType.EXPORT)
    @PostMapping("/download/{fileId}")
    public void download(@PathVariable Long fileId) {
        sysFileService.download(fileId);
    }

    /**
     * 删除文件
     *
     * @param fileIds 文件地址
     * @return AjaxResult
     */
    @Log(service = "删除文件", businessType = BusinessType.DELETE)
    @DeleteMapping("/{fileIds}")
    public AjaxResult deleteFile(@PathVariable Long[] fileIds) {
        sysFileService.deleteFile(fileIds);
        return AjaxResult.success();
    }

    /**
     * 分页查询
     *
     * @param sysDfs SysDfs
     * @return AjaxResult
     */
    @GetMapping("/pageQuery")
    public AjaxResult pageQuery(SysDfs sysDfs) {
        startPage();
        List<SysDfs> sysDfsList = sysFileService.selectUserList(sysDfs);
        return AjaxResult.success(getDataTable(sysDfsList));
    }

}