package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysDictType;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.core.constant.UserConstants;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.system.service.ISysDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author twelvet
 * @WebSite www.twelvet.cn
 * @Description: 数据字典信息
 */
@RestController
@RequestMapping("/dictionaries/type")
public class SysDictTypeController extends TWTController {
    @Autowired
    private ISysDictTypeService dictTypeService;

    @GetMapping
    public AjaxResult pageQuery(SysDictType dictType) {
        startPage();
        List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
        return AjaxResult.success(getDataTable(list));
    }

    @Log(service = "字典类型", businessType = BusinessType.EXPORT)
    @PostMapping("/exportExcel")
    public void export(HttpServletResponse response, SysDictType dictType) {
        List<SysDictType> list = dictTypeService.selectDictTypeList(dictType);
        ExcelUtils<SysDictType> excelUtils = new ExcelUtils<>(SysDictType.class);
        excelUtils.exportExcel(response, list, "字典类型");
    }

    /**
     * 查询字典类型详细
     */
    @GetMapping(value = "/{dictId}")
    public AjaxResult getInfo(@PathVariable Long dictId) {
        return AjaxResult.success(dictTypeService.selectDictTypeById(dictId));
    }

    /**
     * 新增字典类型
     */
    @Log(service = "字典类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysDictType dict) {
        if (UserConstants.NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict))) {
            return AjaxResult.error("新增字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }
        dict.setCreateBy(SecurityUtils.getUsername());
        return json(dictTypeService.insertDictType(dict));
    }

    /**
     * 修改字典类型
     */
    @Log(service = "字典类型", businessType = BusinessType.PUT)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysDictType dict) {
        if (UserConstants.NOT_UNIQUE.equals(dictTypeService.checkDictTypeUnique(dict))) {
            return AjaxResult.error("修改字典'" + dict.getDictName() + "'失败，字典类型已存在");
        }
        dict.setUpdateBy(SecurityUtils.getUsername());
        return json(dictTypeService.updateDictType(dict));
    }

    /**
     * 删除字典类型
     */
    @Log(service = "字典类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dictIds}")
    public AjaxResult remove(@PathVariable Long[] dictIds) {
        return json(dictTypeService.deleteDictTypeByIds(dictIds));
    }

    /**
     * 清空缓存
     */
    @Log(service = "字典类型", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clearCache")
    public AjaxResult clearCache() {
        dictTypeService.clearCache();
        return AjaxResult.success();
    }

    /**
     * 获取字典选择框列表
     *
     * @return AjaxResult
     */
    @GetMapping("/optionSelect")
    public AjaxResult optionSelect() {
        List<SysDictType> dictTypes = dictTypeService.selectDictTypeAll();
        return AjaxResult.success(dictTypes);
    }
}