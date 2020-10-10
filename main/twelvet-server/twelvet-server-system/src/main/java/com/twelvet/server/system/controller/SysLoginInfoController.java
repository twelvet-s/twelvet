package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysLoginInfo;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.utils.http.IpUtils;
import com.twelvet.server.system.service.ISysLoginInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 系统操作/访问日志
 */
@RestController
@RequestMapping("/loginInfo")
public class SysLoginInfoController extends TWTController {

    @Autowired
    private ISysLoginInfoService iSysLoginInfoService;

    /**
     * 登录日志查询
     *
     * @param loginInfo SysLoginInfo
     * @return 查询数据
     */
    @GetMapping
    public AjaxResult pageQuery(SysLoginInfo loginInfo) {
        bindPage();
        List<SysLoginInfo> list = iSysLoginInfoService.selectLoginInfoList(loginInfo);
        return AjaxResult.success(getDataTable(list));
    }

    /**
     * 批量删除日志
     *
     * @param infoIds 日志Id list
     * @return 操作结果
     */
    @DeleteMapping("/{infoIds}")
    public AjaxResult remove(@PathVariable Long[] infoIds) {
        return json(iSysLoginInfoService.deleteLoginInfoByIds(infoIds));
    }

    /**
     * 记录登录信息
     *
     * @param username 账号
     * @param status   是否登录成功
     * @param message  登录系统信息
     * @return 记录结果
     */
    @PostMapping
    public AjaxResult add(
            @RequestParam("username") String username,
            @RequestParam("status") String status,
            @RequestParam("message") String message
    ) {

        String ip = IpUtils.getIpAddr();

        SysLoginInfo loginInfo = new SysLoginInfo();
        loginInfo.setUserName(username);
        loginInfo.setIpaddr(ip);
        // TODO 处理状态
        // loginInfo.setStatus(status);
        loginInfo.setMsg(message);

        return json(iSysLoginInfoService.insertLoginInfo(loginInfo));
    }

}
