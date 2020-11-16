package com.twelvet.server.system.controller;

import com.twelvet.api.system.domain.SysDictData;
import com.twelvet.framework.core.application.controller.TWTController;
import com.twelvet.framework.core.application.domain.AjaxResult;
import com.twelvet.framework.log.annotation.Log;
import com.twelvet.framework.log.enums.BusinessType;
import com.twelvet.framework.security.utils.SecurityUtils;
import com.twelvet.framework.utils.ExcelUtils;
import com.twelvet.server.system.service.ISysDictDataService;
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
@RequestMapping("/dictionaries/data")
public class SysDictDataController extends TWTController
{
    @Autowired
    private ISysDictDataService dictDataService;
    
    @Autowired
    private ISysDictTypeService dictTypeService;

    @GetMapping
    public AjaxResult pageQuery(SysDictData sysDictData)
    {
        startPage();
        List<SysDictData> list = dictDataService.selectDictDataList(sysDictData);
        return AjaxResult.success(getDataTable(list));
    }

    @Log(service = "字典数据", businessType = BusinessType.EXPORT)
    @PostMapping("/exportExcel")
    public void export(HttpServletResponse response, SysDictData sysDictData) {
        List<SysDictData> list = dictDataService.selectDictDataList(sysDictData);
        ExcelUtils<SysDictData> excelUtils = new ExcelUtils<>(SysDictData.class);
        excelUtils.exportExcel(response, list, "字典数据");
    }

    /**
     * 查询字典数据详细
     */
    @GetMapping(value = "/{dictCode}")
    public AjaxResult getInfo(@PathVariable Long dictCode)
    {
        return AjaxResult.success(dictDataService.selectDictDataById(dictCode));
    }

    /**
     * 根据字典类型查询字典数据信息
     */
    @GetMapping(value = "/type/{dictType}")
    public AjaxResult dictType(@PathVariable String dictType)
    {
        return AjaxResult.success(dictTypeService.selectDictDataByType(dictType));
    }

    /**
     * 新增字典类型
     */
    @Log(service = "字典数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysDictData sysDictData)
    {
        sysDictData.setCreateBy(SecurityUtils.getUsername());
        return json(dictDataService.insertDictData(sysDictData));
    }

    /**
     * 修改保存字典类型
     */
    @Log(service = "字典数据", businessType = BusinessType.PUT)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysDictData sysDictData)
    {
        sysDictData.setUpdateBy(SecurityUtils.getUsername());
        return json(dictDataService.updateDictData(sysDictData));
    }

    /**
     * 删除字典类型
     */
    @Log(service = "字典类型", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dictCodes}")
    public AjaxResult remove(@PathVariable Long[] dictCodes)
    {
        return json(dictDataService.deleteDictDataByIds(dictCodes));
    }
}