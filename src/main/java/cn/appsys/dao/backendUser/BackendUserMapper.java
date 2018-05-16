package cn.appsys.dao.backendUser;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.BackendUser;

public interface BackendUserMapper {
	/**
	 * 根据用户名查找用户
	 * 
	 * @param devCode
	 * @return
	 */
	BackendUser findUser(@Param("userCode") String userCode);
}
