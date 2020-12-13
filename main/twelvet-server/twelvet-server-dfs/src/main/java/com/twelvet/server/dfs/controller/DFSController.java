package com.twelvet.server.dfs.controller;

import com.twelvet.api.system.domain.SysFile;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.utils.file.FileUtils;
import com.twelvet.server.dfs.service.IDFSService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
     * @param file MultipartFile
     * @return R<SysFile>
     */
    @PostMapping("/upload")
    public R<SysFile> upload(MultipartFile file) {
        try {
            // 上传并返回访问地址
            String url = sysFileService.uploadFile(file);
            SysFile sysFile = new SysFile();
            sysFile.setName(FileUtils.getName(url));
            sysFile.setUrl(url);
            return R.ok(sysFile);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            return R.fail(e.getMessage());
        }
    }
}