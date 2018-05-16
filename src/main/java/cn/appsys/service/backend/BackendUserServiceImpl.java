package cn.appsys.service.backend;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.backendUser.BackendUserMapper;
import cn.appsys.pojo.BackendUser;

@Service
@Transactional
public class BackendUserServiceImpl implements BackendUserService {
	@Resource
	private BackendUserMapper backendUserMapper;

	@Override
	public BackendUser findUser(String userCode) {
		return backendUserMapper.findUser(userCode);
	}

}
