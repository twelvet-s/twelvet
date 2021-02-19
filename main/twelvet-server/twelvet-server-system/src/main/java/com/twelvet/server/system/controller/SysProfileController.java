package com.twelvet.server.system.controller;


import com.twelvet.api.dfs.domain.SysFile;
import com.twelvet.api.dfs.feign.RemoteFileService;
import com.twelvet.api.system.domain.SysUser;
import com.twelvet.api.system.domain.vo.UserInfoVo;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.domain.R;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.domain.LoginUser;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.StringUtils;
import com.twelvet.server.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MissingServletRequestPartException;

import java.io.IOException;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: DFS控制器
 */
@RestController
@RequestMapping("/user/profile")
public class SysProfileController extends TWTController {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private RemoteFileService remoteFileService;

    /**
     * 个人信息
     *
     * @return AjaxResult
     */
    @GetMapping
    public AjaxResult profile() {
        String username = SecurityUtils.getUsername();
        SysUser user = userService.selectUserByUserName(username);

        UserInfoVo userInfoVo = new UserInfoVo();

        userInfoVo.setUser(user);
        userInfoVo.setPostGroup(userService.selectUserPostGroup(username));
        userInfoVo.setRoleGroup(userService.selectUserRoleGroup(username));

        return AjaxResult.success(userInfoVo);
    }

    /**
     * 修改用户头像
     *
     * @param file
     * @return 上传信息
     * @throws IOException IO异常
     */
    @Log(service = "用户头像", businessType = BusinessType.UPDATE)
    @PostMapping("/avatar")
    public AjaxResult avatar(@RequestParam("avatarFile") MultipartFile file) {

        try {
            R<SysFile> fileResult = remoteFileService.upload(file);

            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData())) {
                return AjaxResult.error("文件服务异常，请联系管理员");
            }

            String url = fileResult.getData().getUrl();

            LoginUser user = SecurityUtils.getLoginUser();

            if (userService.updateUserAvatar(user.getUsername(), url)) {
                AjaxResult ajax = AjaxResult.success("上传成功");
                ajax.put("imgUrl", url);
                return ajax;
            }
        } catch (Exception e) {
            return AjaxResult.error("请上传图片");
        }
        return AjaxResult.error("上传失败");
    }

}