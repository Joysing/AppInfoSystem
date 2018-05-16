package cn.appsys.controller.developer;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.appsys.pojo.AppCategory;
import cn.appsys.pojo.AppInfo;
import cn.appsys.pojo.AppVersion;
import cn.appsys.pojo.DataDictionary;
import cn.appsys.pojo.DevUser;
import cn.appsys.service.developer.AppCategoryService;
import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.service.developer.DataDictionaryService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;
import cn.appsys.tool.PageSupport;

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
	private DataDictionaryService dataDictionaryService;
	@Resource
	private AppCategoryService appCategoryService;
	@Resource
	private AppVersionService appVersionService;

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
	 * 跳转到添加页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/add")
	public String addInfo(@ModelAttribute("appInfo") AppInfo appInfo) {
		return "developer/appInfoAdd";
	}

	/**
	 * 添加APP信息
	 * 
	 * @param session
	 * @param model
	 * @param softwareName
	 * @param APKName
	 * @param supportROM
	 * @param interfaceLanguage
	 * @param softwareSize
	 * @param downloads
	 * @param flatformId
	 * @param categoryLevel1
	 * @param categoryLevel2
	 * @param categoryLevel3
	 * @return
	 */
	@RequestMapping(value = "/doAdd")
	public String addAppInfo(HttpSession session, HttpServletRequest request, Model model, AppInfo appInfo,
			@RequestParam(value = "_logoPicPath", required = false) MultipartFile updateFile) {
		// 获取开发者id
		Integer devId = ((DevUser) session.getAttribute(Constants.DEV_USER_SESSION)).getId();
		String logoPicPath = null;// 相对路径
		String logoLocPath = null;// 决定路径

		if (!updateFile.isEmpty()) {// 如果上传文件不为空
			String path = request.getSession().getServletContext().getRealPath("/") + "/statics/updateFiles";// 项目实际路径
			logger.info(path);
			String suffix = FilenameUtils.getExtension(updateFile.getOriginalFilename());// 上传文件后缀名称
			int fileSize = 500000;// 文件大小

			if (updateFile.getSize() > fileSize) {// 如果文件过大
				model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_4);
				return "developer/appInfoAdd";
			} else if (suffix.equalsIgnoreCase("jpg") || suffix.equalsIgnoreCase("jepg")
					|| suffix.equalsIgnoreCase("pneg") || suffix.equalsIgnoreCase("png")) {// 判断格式是否正确
				String fileName = appInfo.getAPKName() + "." + suffix;// 新文件名称
				File file = new File(path, fileName);

				if (!file.exists()) {// 判断文件是否存在
					file.mkdirs();
				}
				try {
					updateFile.transferTo(file);// 上传文件
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_2);
				}
				logoPicPath = request.getContextPath() + "/statics/updateFiles" + fileName;
				logoLocPath = path + file.separator + fileName;
				logger.info(logoLocPath + "\n" + logoPicPath);
			} else {
				model.addAttribute("fileUploadError", Constants.FILEUPLOAD_ERROR_3);
				return "developer/appInfoAdd";
			}
		}
		// 添加APP信息
		appInfo.setStatus(1);
		appInfo.setDevId(devId);
		appInfo.setLogoLocPath(logoLocPath);
		appInfo.setLogoPicPath(logoPicPath);
		appInfo.setCreatedBy(devId);
		appInfo.setCreationDate(new Date());
		appInfo.setDevId(devId);

		try {
			appInfoService.add(appInfo);// 想数据库添加数据
			return "redirect:/dev/appInfo/list";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "developer/appInfoAdd";
	}

	/**
	 * 删除APP信息
	 * 
	 * @param id
	 * @return 是否删除成功
	 */
	@RequestMapping(value = "/delAppInfo.json")
	@ResponseBody
	public String delAppInfo(@RequestParam(value = "id") String id) {
		boolean flag = false;
		if (EmptyUtils.isNotEmpty(id)) {
			try {
				flag = appInfoService.deleteAppInfoById(Integer.parseInt(id));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("加载信息失败!!");
			}
		}
		if (flag) {
			return "true";
		}
		return "false";
	}

	/**
	 * 判断apk名称是否存在JSON
	 * 
	 * @param APKName
	 * @return
	 */
	@RequestMapping(value = "/apkEmpty.json")
	@ResponseBody
	public Object apkIsEmpty(@RequestParam(value = "APKName") String APKName) {
		Map<String, String> isEmpty = new HashMap<String, String>();
		if (EmptyUtils.isEmpty(APKName)) {
			isEmpty.put("APKName", "empty");
		} else {
			AppInfo appInfo = null;
			try {
				appInfo = appInfoService.getAppInfo(null, APKName);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("加载信息失败!!");
			}
			if (EmptyUtils.isEmpty(appInfo)) {
				isEmpty.put("APKName", "true");
			} else {
				isEmpty.put("APKName", "false");
			}
		}

		return isEmpty;
	}

	/**
	 * 返回所属平台
	 * 
	 * @return
	 */
	@RequestMapping(value = "/flatform.json")
	@ResponseBody
	public List<DataDictionary> getDataDictionaries() {
		return dataDictionaryService.getDataDictionaries(Constants.APP_FLATFORM);
	}

	/**
	 * 查看APP信息
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/appInfoView")
	public String appInfoView(Model model, @RequestParam(value = "id") String id) {
		AppInfo appInfo = null;
		List<AppVersion> appVersions = null;
		try {
			appInfo = appInfoService.getAppInfo(Integer.parseInt(id), null);
			appVersions = appVersionService.findaAppVersions(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("加载信息失败!!");
		}
		model.addAttribute("appInfo", appInfo);
		model.addAttribute("appVersions", appVersions);
		return "developer/appInfoView";
	}

	@RequestMapping("/down")
	public void down(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "apkFileName") String apkFileName,
			@RequestParam(value = "apkLocPath") String apkLocPath) throws Exception {
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(apkLocPath)));
		// 假如以中文名下载的话需要 转码，免得文件名中文乱码
		apkFileName = URLEncoder.encode(apkFileName, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + apkFileName);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
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

	/**
	 * 进入修改页面
	 * 
	 * @param appInfoId
	 * @return
	 */
	@RequestMapping(value = "/update")
	public String update(@RequestParam(value = "appInfoId") String appInfoId, @ModelAttribute("app") AppInfo app,
			Model model) {
		List<AppCategory> categoryLevel1List = null;// 一级列表
		List<DataDictionary> flatFormList = null;// 平台数据
		AppInfo appInfo = null;

		try {// 加载各种信息
			appInfo = appInfoService.getAppInfo(Integer.parseInt(appInfoId), null);
			categoryLevel1List = appCategoryService.getAppCategories(null);
			flatFormList = dataDictionaryService.getDataDictionaries(Constants.APP_FLATFORM);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("加载信息失败!!");
		}
		// 向模板添加信息
		model.addAttribute("appInfo", appInfo);
		model.addAttribute("categoryLevel1List", categoryLevel1List);
		model.addAttribute("flatFormList", flatFormList);
		return "developer/appInfoUpdate";
	}

	/**
	 * 更新APP信息
	 * 
	 * @param appInfo
	 * @return
	 */
	@RequestMapping(value = "/doUpdate")
	public String doUpate(AppInfo appInfo) {
		if (EmptyUtils.isNotEmpty(appInfo)) {
			try {
				appInfoService.modify(appInfo);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("更新APP信息失败!!");
			}
		}
		return "redirect:list";
	}

	/**
	 * 删除APP信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delapp.json")
	@ResponseBody
	public Object delapp(@RequestParam(value = "id") String id) {
		Map<String, String> data = new HashMap<String, String>();
		if (EmptyUtils.isNotEmpty(id)) {
			try {
				if (appVersionService.getAppVeersionsCount(Integer.parseInt(id)) > 0) {// 如果有版本信息则删除
					appVersionService.delAll(Integer.parseInt(id));
				}
				if (appInfoService.deleteAppInfoById(Integer.parseInt(id))) {
					data.put("delResult", "true");
				} else {
					data.put("delResult", "false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return data;
	}

	/**
	 * 上架
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/soldUp.json")
	@ResponseBody
	public Object soldUp(@RequestParam(value = "id") String id) {
		Map<String, String> data = new HashMap<String, String>();
		if (EmptyUtils.isNotEmpty(id)) {
			try {
				if (appInfoService.updateSatus(4, Integer.parseInt(id))) {
					data.put("result", "true");
				} else {
					data.put("result", "false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			data.put("result", "null");
		}
		return data;
	}

	/**
	 * 下架
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/soldDown.json")
	@ResponseBody
	public Object soldDown(@RequestParam(value = "id") String id) {
		Map<String, String> data = new HashMap<String, String>();
		if (EmptyUtils.isNotEmpty(id)) {
			try {
				if (appInfoService.updateSatus(5, Integer.parseInt(id))) {
					data.put("result", "true");
				} else {
					data.put("result", "false");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			data.put("result", "null");
		}
		return data;
	}

	/**
	 * 进入更新APP版本页面
	 * 
	 * @param appInfoId
	 * @param appVersionId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/updateVersion")
	public String updateVersion(@RequestParam(value = "appInfoId") String appInfoId,
			@RequestParam(value = "versionId") String appVersionId, Model model,
			@ModelAttribute(value = "appVersion") AppVersion appVersion) {
		AppInfo appInfo = null;
		AppVersion newAppVersion = null;
		List<AppVersion> appVersions = null;
		if (EmptyUtils.isNotEmpty(appVersionId) && EmptyUtils.isNotEmpty(appInfoId)) {
			try {
				newAppVersion = appVersionService.getAppVersionById(Integer.parseInt(appVersionId));
				appVersions = appVersionService.findaAppVersions(Integer.parseInt(appInfoId));
				appInfo = appInfoService.getAppInfo(Integer.parseInt(appInfoId), null);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("newAppVersion", newAppVersion);
			model.addAttribute("appVersions", appVersions);
			model.addAttribute("appInfo", appInfo);

			return "developer/updateVersion";
		}
		throw new RuntimeException("进入更新页面失败!!");
	}

	@RequestMapping(value = "doUpdateVersion")
	public String doUpdateVersion(AppVersion appVersion, Model model) {
		if (appVersionService.update(appVersion)) {
			return "redirect:list";
		}
		throw new RuntimeException("更新失败!!");
	}
}
