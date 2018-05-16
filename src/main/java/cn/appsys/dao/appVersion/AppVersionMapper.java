package cn.appsys.dao.appVersion;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppVersion;

public interface AppVersionMapper {
	/**
	 * 根据APPid获取版本信息
	 * 
	 * @param appId
	 * @return
	 */
	List<AppVersion> findaAppVersions(@Param("appId") Integer appId);

	/**
	 * 根据APPid获取版本数量
	 * 
	 * @param appId
	 * @return
	 */
	int getAppVeersionsCount(@Param("appId") Integer appId);

	/**
	 * 根据APPid删除所有版本信息
	 * 
	 * @param appId
	 * @return
	 */
	int delAll(@Param("appId") Integer appId);

	/**
	 * 根据版本id删除版本
	 * 
	 * @param id
	 * @return
	 */
	int del(@Param("id") Integer id);

	/**
	 * 根据版本id获取版本
	 * 
	 * @param id
	 * @return
	 */
	AppVersion getAppVersionById(@Param("id") Integer id);

	/**
	 * 添加APP版本信息
	 * 
	 * @param appVersion
	 * @return
	 */
	int add(AppVersion appVersion);

	/**
	 * 更新版本信息
	 * 
	 * @param appVersion
	 * @return
	 */
	int update(AppVersion appVersion);
}
