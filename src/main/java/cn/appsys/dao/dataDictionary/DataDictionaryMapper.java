package cn.appsys.dao.dataDictionary;

import java.util.List;

import cn.appsys.pojo.DataDictionary;

public interface DataDictionaryMapper {
	List<DataDictionary> getDataDictionaries(String typeCode);
}
