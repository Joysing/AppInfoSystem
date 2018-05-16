package cn.appsys.service.developer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppInfo;

/**
 * APP信息服务类
 * 
 * @author 117
 *
 */
public interface AppInfoService {
	/**
	 * 分页获取APP信息
	 * 
	 * @param querySoftwareName
	 *            软件的名字(模糊)
	 * @param queryStatus
	 *            状态
	 * @param queryCategoryLevel1
	 *            一级分类
	 * @param queryCategoryLevel2
	 *            二级分类
	 * @param queryCategoryLevel3
	 *            三级分类
	 * @param queryFlatformId
	 *            所属平台
	 * @param devId
	 *            开发者id
	 * @param from
	 *            分页开始的条数
	 * @param pageSize
	 *            分页大小
	 * @return APP信息列表
	 * @throws Exception
	 */
	List<AppInfo> getAppInfos(String querySoftwareName, Integer queryStatus, Integer queryCategoryLevel1,
                              Integer queryCategoryLevel2, Integer queryCategoryLevel3, Integer queryFlatformId, Integer devId,
                              Integer from, Integer pageSize) throws Exception;

	/**
	 * 获取APP信息总数
	 * 
	 * @param querySoftwareName
	 *            软件的名字(模糊)
	 * @param queryStatus
	 *            状态
	 * @param queryCategoryLevel1
	 *            一级分类
	 * @param queryCategoryLevel2
	 *            二级分类
	 * @param queryCategoryLevel3
	 *            三级分类
	 * @param queryFlatformId
	 *            所属平台
	 * @param devId
	 *            开发者id
	 * @return
	 * @throws Exception
	 */
	int getAppInfoCount(String querySoftwareName, Integer queryStatus, Integer queryCategoryLevel1,
                        Integer queryCategoryLevel2, Integer queryCategoryLevel3, Integer queryFlatformId, Integer devId)
					throws Exception;

	/**
	 * 添加APP信息
	 * 
	 * @param appInfo
	 * @return
	 * @throws Exception
	 */
	boolean add(AppInfo appInfo) throws Exception;

	/**
	 * 更新APP信息
	 * 
	 * @param appInfo
	 * @return
	 * @throws Exception
	 */
	boolean modify(AppInfo appInfo) throws Exception;

	/**
	 * 根据id删除APP信息
	 * 
	 * @param delId
	 * @return
	 * @throws Exception
	 */
	boolean deleteAppInfoById(Integer delId) throws Exception;

	/**
	 * 根据id或者apk名称获取APP信息
	 * 
	 * @param id
	 * @param APKName
	 * @return
	 * @throws Exception
	 */
	AppInfo getAppInfo(Integer id, String APKName) throws Exception;

	/**
	 * 删除APPlogo
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	boolean deleteAppLogo(Integer id) throws Exception;

	/**
	 * 根据appId，更新最新versionId
	 * 
	 * @param versionId
	 * @param appId
	 * @return
	 * @throws Exception
	 */
	boolean updateVersionId(Integer versionId, Integer appId) throws Exception;

	/*
	 * 更新app状态
	 * 
	 * @param status
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 * @throws Exception
	 */
	boolean updateSatus(Integer status, Integer id) throws Exception;
	/**
	 * 业务：根据appId删除APP信息
	 * 1、通过appId，查询app_verion表中是否有数据
	 * 2、若版本表中有该app应用对应的版本信息，则进行级联删除，先删版本信息（app_version），后删app基本信息（app_info）
	 * 3、若版本表中无该app应用对应的版本信息，则直接删除app基本信息（app_info）。
	 * 注意：事务控制，上传文件的删除
	 */
	public boolean appsysdeleteAppById(Integer id) throws Exception;
}
