package cn.appsys.service.developer;

import cn.appsys.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

/**
 * @Date 2018/5/15 15:39
 * @Author Joysing
 */

public interface DevUserService {
    /**
     * 根据开发者用户名查找用户
     *
     * @param devCode 开发者登录名
     * @return
     */
    public DevUser getDevUserByCode(@Param("devCode") String devCode);
}
