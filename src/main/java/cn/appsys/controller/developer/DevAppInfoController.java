package cn.appsys.controller.developer;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.appsys.dao.appCategory.AppCategoryMapper;
import cn.appsys.dao.dataDictionary.DataDictionaryMapper;
import cn.appsys.pojo.*;
import cn.appsys.tool.PageSupport;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;


/**
 * 开发者APP信息控制器
 * 
 * @author 117
 *
 */
@Controller
@RequestMapping("/dev/appInfo")
public class DevAppInfoController {
	private static Logger logger = Logger.getLogger(DevAppInfoController.class);
	@Resource
	private AppInfoService appInfoService;
	@Resource
	private AppVersionService appVersionService;
	@Resource
	private AppCategoryMapper appCategoryService;
	@Resource
	private DataDictionaryMapper dataDictionaryService;


	/**
	 * 获取APP信息列表
	 *
	 * @param model
	 * @param session
	 * @param querySoftwareName
	 * @param _queryStatus
	 * @param _queryCategoryLevel1
	 * @param _queryCategoryLevel2
	 * @param _queryCategoryLevel3
	 * @param _queryFlatformId
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String getAppInfos(Model model, HttpSession session,
							  @RequestParam(value = "querySoftwareName", required = false) String querySoftwareName,
							  @RequestParam(value = "queryStatus", required = false) String _queryStatus,
							  @RequestParam(value = "queryCategoryLevel1", required = false) String _queryCategoryLevel1,
							  @RequestParam(value = "queryCategoryLevel2", required = false) String _queryCategoryLevel2,
							  @RequestParam(value = "queryCategoryLevel3", required = false) String _queryCategoryLevel3,
							  @RequestParam(value = "queryFlatformId", required = false) String _queryFlatformId,
							  @RequestParam(value = "pageIndex", required = false) String pageIndex) {
		// 获取开发者用户id
		Integer devId = ((DevUser) session.getAttribute(Constants.DEV_USER_SESSION)).getId();

		// 定义各种变量
		List<AppInfo> appInfos = null;// APP信息集合
		List<DataDictionary> statusList = null;// 状态数据
		List<DataDictionary> flatFormList = null;// 平台数据
		List<AppCategory> categoryLevel1List = null;// 一级分类列表
		List<AppCategory> categoryLevel2List = null;// 二级和三级分类列表通过异步ajax获取
		List<AppCategory> categoryLevel3List = null;

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
			totalCount = appInfoService.getAppInfoCount(querySoftwareName, queryStatus, queryCategoryLevel1,
					queryCategoryLevel2, queryCategoryLevel3, queryFlatformId, devId);

		} catch (Exception e) {
			e.printStackTrace();
		}
		PageSupport pages = new PageSupport(currentPageNo, totalCount, pageSize);
		int from = pages.getFrom();// 数据开始的行数(limit)

		// 获取各种数据
		try {
			appInfos = appInfoService.getAppInfos(querySoftwareName, queryStatus, queryCategoryLevel1,
					queryCategoryLevel2, queryCategoryLevel3, queryFlatformId, devId, from, pageSize);
			categoryLevel1List = appCategoryService.getAppCategories(null);
			statusList = dataDictionaryService.getDataDictionaries(Constants.APP_STATUS);
			flatFormList = dataDictionaryService.getDataDictionaries(Constants.APP_FLATFORM);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 向模型添加数据
		model.addAttribute("appInfos", appInfos);
		model.addAttribute("statusList", statusList);
		model.addAttribute("flatFormList", flatFormList);
		model.addAttribute("categoryLevel1List", categoryLevel1List);
		model.addAttribute("pages", pages);
		model.addAttribute("queryStatus", queryStatus);
		model.addAttribute("querySoftwareName", querySoftwareName);
		model.addAttribute("queryCategoryLevel1", queryCategoryLevel1);
		model.addAttribute("queryCategoryLevel2", queryCategoryLevel2);
		model.addAttribute("queryCategoryLevel3", queryCategoryLevel3);
		model.addAttribute("queryFlatformId", queryFlatformId);

		// 二级三级类型回显
		if (EmptyUtils.isNotEmpty(queryCategoryLevel2)) {
			categoryLevel2List = appCategoryService.getAppCategories(queryCategoryLevel1);
			model.addAttribute("categoryLevel2List", categoryLevel2List);
		}
		if (EmptyUtils.isNotEmpty(queryCategoryLevel3)) {
			categoryLevel3List = appCategoryService.getAppCategories(queryCategoryLevel2);
			model.addAttribute("categoryLevel3List", categoryLevel3List);
		}

		return "developer/appInfoList";
	}


	/**
	 * 进入添加版本页面
	 * 
	 * @param appVersion
	 * @return
	 */
	@RequestMapping(value = "/addVersion")
	public String addVersion(@ModelAttribute("appVersion") AppVersion appVersion,
			@RequestParam(value = "appInfoId") String appInfoId, Model model) {
		AppInfo appInfo = null;
		List<AppVersion> appVersions = null;
		try {
			if (EmptyUtils.isNotEmpty(appInfoId)) {
				appInfo = appInfoService.getAppInfo(Integer.parseInt(appInfoId), null);
				appVersions = appVersionService.findaAppVersions(Integer.parseInt(appInfoId));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("加载信息失败!!");
		}

		model.addAttribute("appInfo", appInfo);
		model.addAttribute("appVersions", appVersions);

		return "developer/addVersion";
	}

	/**
	 * 进行版本添加
	 * 
	 * @param appVersion
	 * @param updateFile
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/doVersion")
	public String doAdd(AppVersion appVersion,
			@RequestParam(value = "apkFile", required = false) MultipartFile updateFile, Model model,
			HttpServletRequest request) {
		String downloadLink = null;// 下载链接S
		String apkLocPath = null;// apk文件的服务器存储路径

		if (!updateFile.isEmpty()) {
			logger.info("111111111111111111111111111111111111111");
			String path = request.getSession().getServletContext().getRealPath("/") + "/statics/updateFiles";// 项目实际路径
			String suffix = FilenameUtils.getExtension(updateFile.getOriginalFilename());// 上传文件后缀名称
			int fileSize = 50000000;// 文件大小
			if (updateFile.getSize() > fileSize) {
				model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
				return "developer/addVersion";
			} else if (suffix.equals("apk")) {
				String fileName = appVersion.getAppName() + "-" + appVersion.getVersionNo() + ".apk";// 文件名称
				logger.info(suffix + fileName + path);
				File file = new File(path, fileName);

				if (!file.exists()) {// 如果文件不存在则创建
					file.mkdirs();
				}

				try {
					updateFile.transferTo(file);// 上传文件
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
				}

				downloadLink = request.getContextPath() + "/statics/updateFiles";
				apkLocPath = path + File.separator + fileName;

			} else {
				model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
				return "developer/addVersion";
			}
		}

		appVersion.setCreationDate(new Date());
		appVersion.setApkLocPath(apkLocPath);
		appVersion.setDownloadLink(downloadLink);

		if (appVersionService.add(appVersion)) {
			return "redirect:list";
		}

		return "developer/addVersion";
	}


}
