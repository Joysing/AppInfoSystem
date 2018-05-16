package cn.appsys.dao.appCategory;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.appsys.pojo.AppCategory;

public interface AppCategoryMapper {
	List<AppCategory> getAppCategories(@Param(value = "parentId") Integer parentId);
}
