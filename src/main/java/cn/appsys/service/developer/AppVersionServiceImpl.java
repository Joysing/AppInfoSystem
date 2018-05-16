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
	public List<AppVersion> findaAppVersions(Integer appId) {
		return appVersionMapper.findaAppVersions(appId);
	}

	@Override
	public int getAppVeersionsCount(Integer appId) {
		return appVersionMapper.getAppVeersionsCount(appId);
	}

	@Override
	public boolean delAll(Integer appId) {
		boolean falg = false;
		if (appVersionMapper.delAll(appId) > 0) {
			falg = true;
		}
		return falg;
	}

	@Override
	public boolean del(Integer id) {
		boolean falg = false;
		if (appVersionMapper.del(id) > 0) {
			falg = true;
		}
		return falg;
	}

	@Override
	public AppVersion getAppVersionById(Integer id) {
		return appVersionMapper.getAppVersionById(id);
	}

	@Override
	public boolean add(AppVersion appVersion) {
		int version;
		boolean falg = false;
		if (appVersionMapper.add(appVersion) > 0) {
			version = appVersion.getId();
			try {
				if (appInfoMapper.updateVersionId(version, appVersion.getAppId()) > 0) {
					falg = true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return falg;
	}

	@Override
	public boolean update(AppVersion appVersion) {
		boolean falg = false;
		if (appVersionMapper.update(appVersion) > 0) {
			falg = true;
		}
		return falg;
	}

}
