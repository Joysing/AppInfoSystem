package cn.appsys.service.developer;

import java.util.List;

import cn.appsys.pojo.DataDictionary;

/**
 * 数据字典服务接口
 * 
 * @author 117
 *
 */
public interface DataDictionaryService {
	/**
	 * 根据类型获取数据字典集合
	 * 
	 * @param typeCode
	 * @return
	 */
	List<DataDictionary> getDataDictionaries(String typeCode);
}
