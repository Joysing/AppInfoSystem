package cn.appsys.service.developer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.devUser.DevUserMapper;
import cn.appsys.pojo.DevUser;

/**
 * @Date 2018/5/15 15:39
 * @Author Joysing
 */
@Service
@Transactional
public class DevUserServiceImpl implements DevUserService {
	@Resource
	private DevUserMapper devUserMapper;

	@Override
	public DevUser getDevUserByCode(String devCode) {
		return devUserMapper.getDevUserByCode(devCode);
	}

}
