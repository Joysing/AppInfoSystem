package cn.appsys.dao.devUser;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.DevUser;

/**
* @Description 开发者用户类映射接口类
* @Param
* @Author Joysing
*/
public interface DevUserMapper {
	/**
	 * 根据开发者用户名查找用户
	 * 
	 * @param devCode
	 * @return
	 */
	public DevUser getDevUserByCode(@Param("devCode") String devCode);
}
