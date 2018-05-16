package cn.appsys.service.developer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.appsys.dao.dataDictionary.DataDictionaryMapper;
import cn.appsys.pojo.DataDictionary;

/**
 * 数据字典服务接口实现类
 * 
 * @author 117
 *
 */
@Service
@Transactional
public class DataDictionaryServiceImpl implements DataDictionaryService {
	@Resource
	private DataDictionaryMapper dataDictionaryMapper;

	@Override
	public List<DataDictionary> getDataDictionaries(String typeCode) {
		return dataDictionaryMapper.getDataDictionaries(typeCode);
	}

}
