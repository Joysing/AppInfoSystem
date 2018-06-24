package cn.appsys.android.backend;

import cn.appsys.pojo.*;
import cn.appsys.service.backend.BackendUserService;
import cn.appsys.service.developer.AppCategoryService;
import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.service.developer.DataDictionaryService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;
import cn.appsys.tool.PageSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/android/backend/appInfo")
public class AndroidBackendController {
	@Resource
	private AppInfoService appInfoService;
	@Resource
	private DataDictionaryService dataDictionaryService;
	@Resource
	private AppCategoryService appCategoryService;
	@Resource
	private AppVersionService appVersionService;
	@Resource
	private BackendUserService backendUserService;

	@RequestMapping(value = "/appList")
	@ResponseBody
	public List<AppInfo> applist(
			@RequestParam(value = "querySoftwareName", required = false) String querySoftwareName,
			@RequestParam(value = "queryStatus", required = false) String _queryStatus,
			@RequestParam(value = "queryCategoryLevel1", required = false) String _queryCategoryLevel1,
			@RequestParam(value = "queryCategoryLevel2", required = false) String _queryCategoryLevel2,
			@RequestParam(value = "queryCategoryLevel3", required = false) String _queryCategoryLevel3,
			@RequestParam(value = "queryFlatformId", required = false) String _queryFlatformId,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {

		// 定义各种变量
		List<AppInfo> appInfos = null;// APP信息集合
		List<DataDictionary> statusList = null;// 状态数据
		List<DataDictionary> flatFormList = null;// 平台数据
		List<AppCategory> categoryLevel1List = null;// 一级分类列表
		List<AppCategory> categoryLevel2List;// 二级和三级分类列表通过异步ajax获取
		List<AppCategory> categoryLevel3List;

		// 转换数据类型
		Integer queryStatus = null;
		if (EmptyUtils.isNotEmpty(_queryStatus)) {
			queryStatus = Integer.parseInt(_queryStatus);
		}
		Integer queryCategoryLevel1 = null;
		if (EmptyUtils.isNotEmpty(_queryCategoryLevel1)) {
			queryCategoryLevel1 = Integer.parseInt(_queryCategoryLevel1);
		}
		Integer queryCategoryLevel2 = null;
		if (EmptyUtils.isNotEmpty(_queryCategoryLevel2)) {
			queryCategoryLevel2 = Integer.parseInt(_queryCategoryLevel2);
		}
		Integer queryCategoryLevel3 = null;
		if (EmptyUtils.isNotEmpty(_queryCategoryLevel3)) {
			queryCategoryLevel3 = Integer.parseInt(_queryCategoryLevel3);
		}
		Integer queryFlatformId = null;
		if (EmptyUtils.isNotEmpty(_queryFlatformId)) {
			queryFlatformId = Integer.parseInt(_queryFlatformId);
		}
		// 分页数据处理
		int pageSize = Constants.PAGESIZE;
		Integer currentPageNo = 1;
		if (pageIndex != null) {
			currentPageNo = Integer.parseInt(pageIndex);
		}
		int totalCount = 0;
		try {
			totalCount = appInfoService.getAppInfoCount(querySoftwareName, queryStatus, queryCategoryLevel1, queryCategoryLevel2,
					queryCategoryLevel3, queryFlatformId, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
		PageSupport pages = new PageSupport(currentPageNo, totalCount, pageSize);
		int from = pages.getFrom();// 数据开始的行数(limit)

		// 获取各种数据
		try {
			appInfos = appInfoService.getAppInfos(querySoftwareName, queryStatus, queryCategoryLevel1, queryCategoryLevel2,
					queryCategoryLevel3, queryFlatformId, null, from, pageSize);

			categoryLevel1List = appCategoryService.getAppCategories(null);
			statusList = dataDictionaryService.getDataDictionaries(Constants.APP_STATUS);
			flatFormList = dataDictionaryService.getDataDictionaries(Constants.APP_FLATFORM);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 二级三级类型回显
		if (EmptyUtils.isNotEmpty(queryCategoryLevel2)) {
			categoryLevel2List = appCategoryService.getAppCategories(queryCategoryLevel1);
		}
		if (EmptyUtils.isNotEmpty(queryCategoryLevel3)) {
			categoryLevel3List = appCategoryService.getAppCategories(queryCategoryLevel2);
		}

		return appInfos;
	}

	/**
	 * 获取APP分类信息
	 * 
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value = "/category.json")
	@ResponseBody
	public List<AppCategory> getAppCategories(@RequestParam(value = "parentId") String parentId) {
		List<AppCategory> appCategories = null;
		if (EmptyUtils.isEmpty(parentId)) {
			appCategories = appCategoryService.getAppCategories(null);
		} else {
			appCategories = appCategoryService.getAppCategories(Integer.parseInt(parentId));
		}
		return appCategories;
	}

	/**
	 * 进入审核页面
	 * 
	 * @param appinfoid
	 * @param versionid
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/appCheck")
	public String appCheck(@RequestParam(value = "appinfoid") String appinfoid,
			@RequestParam(value = "versionid") String versionid, Model model) {
		AppInfo appInfo = null;
		AppVersion appVersion = null;
		try {
			appInfo = appInfoService.getAppInfo(Integer.parseInt(appinfoid), null);
			appVersion = appVersionService.getAppVersionById(Integer.parseInt(versionid));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("appInfo", appInfo);
		model.addAttribute("appVersion", appVersion);

		return "backend/appCheck";
	}

	/**
	 * 审核
	 * 
	 * @param status
	 * @param appInfoId
	 * @return
	 */
	@RequestMapping(value = "/doCheck")
	@ResponseBody
	public Object doCheck(@RequestParam(value = "status") String status,
			@RequestParam(value = "appInfoId") String appInfoId) {

		try {
			boolean b=appInfoService.updateSatus(Integer.parseInt(status), Integer.parseInt(appInfoId));
			return b;
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}

}
