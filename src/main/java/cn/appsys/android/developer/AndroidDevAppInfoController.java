package cn.appsys.android.developer;

import cn.appsys.pojo.*;
import cn.appsys.service.developer.AppCategoryService;
import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.service.developer.DataDictionaryService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;
import cn.appsys.tool.PageSupport;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 开发者APP信息控制器
 * 
 * @author Joysing
 *
 */
@Controller
@RequestMapping("/android/dev/appInfo")
public class AndroidDevAppInfoController {
	private static Logger logger = Logger.getLogger(AndroidDevAppInfoController.class);
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
	 * @param querySoftwareName
	 * @param _queryStatus
	 * @param _queryCategoryLevel1
	 * @param _queryCategoryLevel2
	 * @param _queryCategoryLevel3
	 * @param _queryFlatformId
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/appList")
	@ResponseBody
	public List<AppInfo> getAppInfos(
	        @RequestParam(value = "devId", required = true) Integer devId,
			@RequestParam(value = "querySoftwareName", required = false) String querySoftwareName,
			@RequestParam(value = "queryStatus", required = false) String _queryStatus,
			@RequestParam(value = "queryCategoryLevel1", required = false) String _queryCategoryLevel1,
			@RequestParam(value = "queryCategoryLevel2", required = false) String _queryCategoryLevel2,
			@RequestParam(value = "queryCategoryLevel3", required = false) String _queryCategoryLevel3,
			@RequestParam(value = "queryFlatformId", required = false) String _queryFlatformId,
			@RequestParam(value = "pageIndex", required = false) String pageIndex) {


		// 定义各种变量
		List<AppInfo> appInfos = null;// APP信息集合

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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return appInfos;
	}

	/**
	 * 查看APP信息
	 */
	@RequestMapping(value = "/appInfoView")
    @ResponseBody
	public Object appInfoView(@RequestParam(value = "id") String id) {
		AppInfo appInfo = null;
		try {
			appInfo = appInfoService.getAppInfo(Integer.parseInt(id), null);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("加载信息失败!!");
		}
		return appInfo;
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
	 * 添加APP信息
	 */
	@RequestMapping(value = "/doAdd")
	@ResponseBody
	public Object addAppInfo(AppInfo appInfo,HttpServletRequest request,
                             @RequestParam(value = "softwareName") String softwareName,
                             @RequestParam(value = "apkName") String apkName,
                             @RequestParam(value = "supportROM") String supportROM,
                             @RequestParam(value = "interfaceLanguage") String interfaceLanguage,
                             @RequestParam(value = "softwareSize") String softwareSize,
                             @RequestParam(value = "downloads") Integer downloads,
                             @RequestParam(value = "appInfomation") String appInfomation,
                             @RequestParam(value = "flatFormId") Integer flatFormId,
                             @RequestParam(value = "categoryOneId") Integer categoryOneId,
                             @RequestParam(value = "categoryTwoId") Integer categoryTwoId,
                             @RequestParam(value = "categoryThreeId") Integer categoryThreeId,
                             @RequestParam(value = "devId") Integer devId,
							 @RequestParam(value = "_logoPicPath", required = false) MultipartFile updateFile) {
        Map<String, String> result = new HashMap<>();
		String logoPicPath = null;// 相对路径
		String logoLocPath = null;// 决定路径

        if (updateFile!=null&&!updateFile.isEmpty()) {// 如果上传文件不为空
            String path = request.getSession().getServletContext().getRealPath("/") + "statics"+File.separator+"uploadFiles";// 项目实际路径
            String suffix = FilenameUtils.getExtension(updateFile.getOriginalFilename());// 上传文件后缀名称
            int fileSize = 500000;// 文件大小
            if (updateFile.getSize() > fileSize) {// 如果文件过大
                result.put("message","图片过大，不能超过500KB");
                return result;
            } else if (suffix.equalsIgnoreCase("jpg") || suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("pneg") || suffix.equalsIgnoreCase("png")) {// 判断格式是否正确
            	String fileName = appInfo.getApkName() + "." + suffix;// 新文件名称
                File file = new File(path, fileName);

                if (!file.exists()) {// 判断文件是否存在
                    file.mkdirs();
                }
                try {
                    updateFile.transferTo(file);// 上传文件
                } catch (Exception e) {
                    e.printStackTrace();
                    result.put("message","图片上传失败");
                    return result;
                }
                logoPicPath = "/statics/uploadFiles/" + fileName;
                logoLocPath = path + file.separator + fileName;
            } else {//上传失败
                result.put("message","只能上传图片文件，后缀为jpg、jpeg、png、pneg");
                return result;
            }
        }

		// 添加APP信息
        appInfo.setSoftwareName(softwareName);
		appInfo.setApkName(apkName);
		appInfo.setSupportROM(supportROM);
		appInfo.setInterfaceLanguage(interfaceLanguage);
		appInfo.setSoftwareSize(new BigDecimal(softwareSize));
		appInfo.setDownloads(downloads);
		appInfo.setAppInfo(appInfomation);
		appInfo.setFlatformId(flatFormId);
		appInfo.setCategoryLevel1(categoryOneId);
		appInfo.setCategoryLevel2(categoryTwoId);
		appInfo.setCategoryLevel3(categoryThreeId);
		appInfo.setStatus(1);
		appInfo.setDevId(devId);
		appInfo.setLogoLocPath(logoLocPath);
		appInfo.setLogoPicPath(logoPicPath);
		appInfo.setCreatedBy(devId);
		appInfo.setCreationDate(new Date());
		appInfo.setDevId(devId);

		try {
			appInfoService.add(appInfo);// 想数据库添加数据
            result.put("result","true");
		} catch (Exception e) {
			e.printStackTrace();
            result.put("message","向数据库添加数据失败");
		}
		return result;
	}
    /**
     * 更新APP信息
     *
     * @param appInfo
     * @return
     */
    @RequestMapping(value = "/doUpdate")
    @ResponseBody
    public Object doUpdate(AppInfo appInfo,HttpServletRequest request,
              @RequestParam(value = "appInfoId") String appInfoId,
              @RequestParam(value = "softwareName") String softwareName,
              @RequestParam(value = "apkName") String apkName,
              @RequestParam(value = "supportROM") String supportROM,
              @RequestParam(value = "interfaceLanguage") String interfaceLanguage,
              @RequestParam(value = "softwareSize") String softwareSize,
              @RequestParam(value = "downloads") Integer downloads,
              @RequestParam(value = "appInfomation") String appInfomation,
              @RequestParam(value = "flatFormId") Integer flatFormId,
              @RequestParam(value = "categoryOneId") Integer categoryOneId,
              @RequestParam(value = "categoryTwoId") Integer categoryTwoId,
              @RequestParam(value = "categoryThreeId") Integer categoryThreeId,
              @RequestParam(value = "devId") Integer devId,
               @RequestParam(value = "_logoPicPath", required = false) MultipartFile updateFile){
        Map<String, String> result = new HashMap<>();
        String logoPicPath = null;// 相对路径
        String logoLocPath = null;// 决定路径

        if (updateFile!=null&&!updateFile.isEmpty()) {// 如果上传文件不为空
            String path = request.getSession().getServletContext().getRealPath("/") + "statics"+File.separator+"uploadFiles";// 项目实际路径
            String suffix = FilenameUtils.getExtension(updateFile.getOriginalFilename());// 上传文件后缀名称
            int fileSize = 500000;// 文件大小
            if (updateFile.getSize() > fileSize) {// 如果文件过大
                result.put("message","图片过大，不能超过500KB");
                return result;
            } else if (suffix.equalsIgnoreCase("jpg") || suffix.equalsIgnoreCase("jpeg")
                    || suffix.equalsIgnoreCase("pneg") || suffix.equalsIgnoreCase("png")) {// 判断格式是否正确
                String fileName = appInfo.getApkName() + "." + suffix;// 新文件名称
                File file = new File(path, fileName);

                if (!file.exists()) {// 判断文件是否存在
                    file.mkdirs();
                }
                try {
                    updateFile.transferTo(file);// 上传文件
                } catch (Exception e) {
                    e.printStackTrace();
                    result.put("message","图片上传失败");
                    return result;
                }
                logoPicPath = "/statics/uploadFiles/" + fileName;
                logoLocPath = path + file.separator + fileName;
            } else {//上传失败
                result.put("message","只能上传图片文件，后缀为jpg、jpeg、png、pneg");
                return result;
            }
        }
        // 添加APP信息
        appInfo.setId(Integer.parseInt(appInfoId));
        appInfo.setSoftwareName(softwareName);
        appInfo.setApkName(apkName);
        appInfo.setSupportROM(supportROM);
        appInfo.setInterfaceLanguage(interfaceLanguage);
        appInfo.setSoftwareSize(new BigDecimal(softwareSize));
        appInfo.setDownloads(downloads);
        appInfo.setAppInfo(appInfomation);
        appInfo.setFlatformId(flatFormId);
        appInfo.setCategoryLevel1(categoryOneId);
        appInfo.setCategoryLevel2(categoryTwoId);
        appInfo.setCategoryLevel3(categoryThreeId);
        appInfo.setDevId(devId);
        appInfo.setModifyBy(devId);
        appInfo.setModifyDate(new Date());
        appInfo.setLogoLocPath(logoLocPath);
        appInfo.setLogoPicPath(logoPicPath);

        if (EmptyUtils.isNotEmpty(appInfo)) {
            try {
                appInfoService.modify(appInfo);
                result.put("result","true");
            } catch (Exception e) {
                e.printStackTrace();
                result.put("message","向数据库添加数据失败");
            }
        }
        return result;
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
	 * @param apkName
	 * @return
	 */
	@RequestMapping(value = "/apkEmpty.json")
	@ResponseBody
	public Object apkIsEmpty(@RequestParam(value = "apkName") String apkName) {
		Map<String, String> isEmpty = new HashMap<String, String>();
		if (EmptyUtils.isEmpty(apkName)) {
			isEmpty.put("apkName", "empty");
		} else {
			AppInfo appInfo = null;
			try {
				appInfo = appInfoService.getAppInfo(null, apkName);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("加载信息失败!!");
			}
			if (EmptyUtils.isEmpty(appInfo)) {
				isEmpty.put("apkName", "true");
			} else {
				isEmpty.put("apkName", "false");
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
	 * 查看APP版本
	 */
	@RequestMapping(value = "/appVersion")
	@ResponseBody
	public Object appInfoView(Model model, @RequestParam(value = "id") String id) {
		List<AppVersion> appVersions;
		try {
			appVersions = appVersionService.findAppVersions(Integer.parseInt(id));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("加载信息失败!!");
		}
		return appVersions;
	}

	/**
	 * 进行版本添加
	 */
	@RequestMapping(value = "/doVersion")
    @ResponseBody
	public Object doAdd(AppVersion appVersion,
//			@RequestParam(value = "versionNo")String versionNo,
//            @RequestParam(value = "versionSize")String versionSize,
//            @RequestParam(value = "versionInfo")String versionInfo,
//            @RequestParam(value = "appId")String appId,
//            @RequestParam(value = "createdBy")String createdBy,
			@RequestParam(value = "apkFile", required = false) MultipartFile updateFile,
			HttpServletRequest request) {
        Map<String, String> result = new HashMap<>();
		String downloadLink = null;// 下载链接S
		String apkLocPath = null;// apk文件的服务器存储路径
		String apkFileName=null;
		if (updateFile!=null&&!updateFile.isEmpty()) {
			String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"updateFiles");// 项目实际路径
			String suffix = FilenameUtils.getExtension(updateFile.getOriginalFilename());// 上传文件后缀名称
			int fileSize = 52428800;// 文件大小不能超过50M，1M=1024k=1048576字节
			if (updateFile.getSize() > fileSize) {
                result.put("message","apk文件不能超过50M");
                return result;
			} else if (suffix.equals("apk")) {
				try {
					apkFileName =appInfoService.getAppInfo(appVersion.getAppId(),null).getApkName()
							+ "-" + appVersion.getVersionNo() + ".apk";// 文件名称
				} catch (Exception e) {
					e.printStackTrace();
				}
				logger.info(suffix + apkFileName + path);
				File file = new File(path, apkFileName);

				if (!file.exists()) {// 如果文件不存在则创建
					file.mkdirs();
				}

				try {
					updateFile.transferTo(file);// 上传文件
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
                    result.put("message","apk文件上传失败");
                    return result;
				}

				downloadLink = "/statics/updateFiles/"+apkFileName;
				apkLocPath = path+File.separator+apkFileName;

			} else {
                result.put("message","请选择正确的apk文件");
                return result;
			}
		}
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=simpleDateFormat.format(new Date().getTime());
		try {
			appVersion.setCreationDate(simpleDateFormat.parse(dateString));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//        appVersion.setVersionNo(versionNo);
//		appVersion.setVersionSize(new BigDecimal(versionSize));
//		appVersion.setVersionInfo(versionInfo);
//		appVersion.setAppId(Integer.parseInt(appId));
//		appVersion.setCreatedBy(Integer.parseInt(createdBy));
		appVersion.setApkLocPath(apkLocPath);
		appVersion.setDownloadLink(downloadLink);
		appVersion.setApkFileName(apkFileName);
        appVersion.setPublishStatus(3);
		logger.info(appVersion.toString());
		if (appVersionService.add(appVersion)) {
            result.put("result","true");
		}
		return result;
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
		Map<String, String> data = new HashMap<>();
		if (EmptyUtils.isNotEmpty(id)) {
			try {
				if (appVersionService.getAppVersionsCount(Integer.parseInt(id)) > 0) {// 如果有版本信息则删除
					appVersionService.delAll(Integer.parseInt(id));
				}
				if (appInfoService.deleteAppInfoById(Integer.parseInt(id))) {
					data.put("result", "true");
				} else {
					data.put("result", "false");
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
		Map<String, String> data = new HashMap<>();
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
		Map<String, String> data = new HashMap<>();
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
	 */
	@RequestMapping(value = "/getVersion")
    @ResponseBody
	public Object updateVersion(@RequestParam(value = "appInfoId") String appInfoId,
			@RequestParam(value = "versionId") String appVersionId,
			@ModelAttribute(value = "appVersion") AppVersion appVersion) {
		AppVersion newAppVersion = null;
		if (EmptyUtils.isNotEmpty(appVersionId) && EmptyUtils.isNotEmpty(appInfoId)) {
			try {
				newAppVersion = appVersionService.getAppVersionById(Integer.parseInt(appVersionId));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
        return newAppVersion;
	}

	@RequestMapping(value = "/doUpdateVersion")
    @ResponseBody
	public Object doUpdateVersion(AppVersion appVersion) {
        Map<String, String> data = new HashMap<>();
		if (appVersionService.update(appVersion)) {
            data.put("result", "true");
		}else {
            data.put("result", "false");
        }
		return data;
	}
}
