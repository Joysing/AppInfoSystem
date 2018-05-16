package cn.appsys.service.developer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.appInfo.AppInfoMapper;
import cn.appsys.pojo.AppInfo;

/**
 * APP信息服务实现类
 * 
 * @author 117
 *
 */
@Service
@Transactional
public class AppInfoServiceImpl implements AppInfoService {
	@Resource
	private AppInfoMapper appInfoMapper;

	@Override
	public List<AppInfo> getAppInfos(String querySoftwareName, Integer queryStatus, Integer queryCategoryLevel1,
			Integer queryCategoryLevel2, Integer queryCategoryLevel3, Integer queryFlatformId, Integer devId,
			Integer from, Integer pageSize) throws Exception {
		return appInfoMapper.getAppInfos(querySoftwareName, queryStatus, queryCategoryLevel1, queryCategoryLevel2,
				queryCategoryLevel3, queryFlatformId, devId, from, pageSize);
	}

	@Override
	public int getAppInfoCount(String querySoftwareName, Integer queryStatus, Integer queryCategoryLevel1,
			Integer queryCategoryLevel2, Integer queryCategoryLevel3, Integer queryFlatformId, Integer devId)
					throws Exception {
		return appInfoMapper.getAppInfoCount(querySoftwareName, queryStatus, queryCategoryLevel1, queryCategoryLevel2,
				queryCategoryLevel3, queryFlatformId, devId);
	}

	@Override
	public boolean add(AppInfo appInfo) throws Exception {
		boolean flag = false;
		if (appInfoMapper.add(appInfo) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean modify(AppInfo appInfo) throws Exception {
		boolean flag = false;
		if (appInfoMapper.modify(appInfo) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean deleteAppInfoById(Integer delId) throws Exception {
		boolean flag = false;
		if (appInfoMapper.deleteAppInfoById(delId) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public AppInfo getAppInfo(Integer id, String APKName) throws Exception {
		return appInfoMapper.getAppInfo(id, APKName);
	}

	@Override
	public boolean deleteAppLogo(Integer id) throws Exception {
		boolean flag = false;
		if (appInfoMapper.deleteAppLogo(id) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateVersionId(Integer versionId, Integer appId) throws Exception {
		boolean flag = false;
		if (appInfoMapper.updateVersionId(versionId, appId) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateSatus(Integer status, Integer id) throws Exception {
		boolean flag = false;
		if (appInfoMapper.updateSatus(status, id) > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean appsysdeleteAppById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
