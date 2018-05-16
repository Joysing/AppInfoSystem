package cn.appsys.service.developer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.appCategory.AppCategoryMapper;
import cn.appsys.pojo.AppCategory;

/**
 * APP分类服务类接口实现类
 * 
 * @author 117
 *
 */
@Service
@Transactional
public class AppCategoryServiceImpl implements AppCategoryService {
	@Resource
	private AppCategoryMapper appCategoryMapper;

	@Override
	public List<AppCategory> getAppCategories(Integer parentId) {
		return appCategoryMapper.getAppCategories(parentId);
	}

}
