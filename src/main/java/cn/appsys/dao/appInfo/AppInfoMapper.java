package cn.appsys.dao.appInfo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppInfo;

public interface AppInfoMapper {
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
	List<AppInfo> getAppInfos(@Param(value = "softwareName") String querySoftwareName,
                              @Param(value = "status") Integer queryStatus, @Param(value = "categoryLevel1") Integer queryCategoryLevel1,
                              @Param(value = "categoryLevel2") Integer queryCategoryLevel2,
                              @Param(value = "categoryLevel3") Integer queryCategoryLevel3,
                              @Param(value = "flatformId") Integer queryFlatformId, @Param(value = "devId") Integer devId,
                              @Param(value = "from") Integer from, @Param(value = "pageSize") Integer pageSize) throws Exception;

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
	int getAppInfoCount(@Param(value = "softwareName") String querySoftwareName,
                        @Param(value = "status") Integer queryStatus, @Param(value = "categoryLevel1") Integer queryCategoryLevel1,
                        @Param(value = "categoryLevel2") Integer queryCategoryLevel2,
                        @Param(value = "categoryLevel3") Integer queryCategoryLevel3,
                        @Param(value = "flatformId") Integer queryFlatformId, @Param(value = "devId") Integer devId)
					throws Exception;

	/**
	 * 添加APP信息
	 * 
	 * @param appInfo
	 * @return
	 * @throws Exception
	 */
	int add(AppInfo appInfo) throws Exception;

	/**
	 * 更新APP信息
	 * 
	 * @param appInfo
	 * @return
	 * @throws Exception
	 */
	int modify(AppInfo appInfo) throws Exception;

	/**
	 * 根据id删除APP信息
	 * 
	 * @param delId
	 * @return
	 * @throws Exception
	 */
	int deleteAppInfoById(@Param(value = "id") Integer delId) throws Exception;

	/**
	 * 根据id或者apk名称获取APP信息
	 * 
	 * @param id
	 * @param APKName
	 * @return
	 * @throws Exception
	 */
	AppInfo getAppInfo(@Param(value = "id") Integer id, @Param(value = "APKName") String APKName) throws Exception;

	/**
	 * 删除APPlogo
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	int deleteAppLogo(@Param(value = "id") Integer id) throws Exception;

	/**
	 * 根据appId，更新最新versionId
	 * 
	 * @param versionId
	 * @param appId
	 * @return
	 * @throws Exception
	 */
	int updateVersionId(@Param(value = "versionId") Integer versionId, @Param(value = "id") Integer appId)
			throws Exception;

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
	int updateSatus(@Param(value = "status") Integer status, @Param(value = "id") Integer id) throws Exception;
}
