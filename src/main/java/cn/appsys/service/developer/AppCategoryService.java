package cn.appsys.service.developer;

import java.util.List;

import cn.appsys.pojo.AppCategory;

/**
 * APP分类服务类接口
 * 
 * @author 117
 *
 */
public interface AppCategoryService {
	/**
	 * 根据父级id获取APP分类集合
	 * 
	 * @param parentId
	 * @return
	 */
	List<AppCategory> getAppCategories(Integer parentId);
}
