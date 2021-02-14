package com.twelvet.server.dfs.controller;

import com.twelvet.api.dfs.domain.SysDfs;
import com.twelvet.api.dfs.domain.SysFile;
import com.twelvet.framework.security.annotation.AuthIgnore;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.utils.file.FileUtils;
import com.twelvet.server.dfs.service.IDFSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 文件请求处理
 */
@RestController
public class DFSController extends TWTController {

    @Autowired
    private IDFSService sysFileService;

    /**
     * 域名或本机访问地址
     */
    @Value("${fdfs.domain}")
    public String domain;

    /**
     * 多文件上传
     *
     * @param files MultipartFile[]
     * @return R<SysFile>
     */
    @Log(service = "多文件上传", businessType = BusinessType.IMPORT)
    @PostMapping("/uploads")
    public AjaxResult upload(MultipartFile[] files) {
        // 上传并返回访问地址
        List<SysDfs> sysDfsList = sysFileService.uploadFiles(files);

        return AjaxResult.success(sysDfsList);
    }

    /**
     * 单文件上传API
     *
     * @param file MultipartFile
     * @return R<SysFile>
     */
    @AuthIgnore
    @Log(service = "单文件上传", businessType = BusinessType.IMPORT)
    @PostMapping("/upload")
    public R<SysFile> upload(MultipartFile file) {
        // 上传并返回访问地址
        SysDfs sysDfs = sysFileService.uploadFile(file);

        String path = sysDfs.getPath();

        String url = domain + File.separator + path;

        SysFile sysFile = new SysFile();
        sysFile.setName(FileUtils.getName(url));
        sysFile.setUrl(url);

        return R.ok(sysFile);
    }

    /**
     * 下载文件
     *
     * @param fileId 文件ID
     */
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