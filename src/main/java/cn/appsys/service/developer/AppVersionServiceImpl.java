package cn.appsys.service.developer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.appInfo.AppInfoMapper;
import cn.appsys.dao.appVersion.AppVersionMapper;
import cn.appsys.pojo.AppVersion;

@Service
@Transactional
public class AppVersionServiceImpl implements AppVersionService {
	@Resource
	private AppVersionMapper appVersionMapper;
	@Resource
	private AppInfoMapper appInfoMapper;

	@Override
	public List<AppVersion> findAppVersions(Integer appId) {
		return appVersionMapper.findAppVersions(appId);
	}

	@Override
	public int getAppVersionsCount(Integer appId) {
		return appVersionMapper.getAppVersionsCount(appId);
	}

	@Override
	public boolean delAll(Integer appId) {
		boolean flag = false;
		if (appVersionMapper.delAll(appId) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean del(Integer id) {
		boolean flag = false;
		if (appVersionMapper.del(id) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public AppVersion getAppVersionById(Integer id) {
		return appVersionMapper.getAppVersionById(id);
	}

	@Override
	public boolean add(AppVersion appVersion) {
		Integer versionId;
		boolean flag = false;
		if (appVersionMapper.add(appVersion) > 0) {
			versionId = appVersion.getId();
			try {
				if (appInfoMapper.updateVersionId(versionId, appVersion.getAppId()) > 0) {
					flag = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return flag;
	}

	@Override
	public boolean update(AppVersion appVersion) {
		boolean flag = false;
		if (appVersionMapper.update(appVersion) > 0) {
			flag = true;
		}
		return flag;
	}

}
