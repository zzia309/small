package cn.runnerup.mapper.commons;

import java.util.List;
import java.util.Map;

import cn.runnerup.kpi.model.KpiModel;

public interface IndexMapper {

	 List<KpiModel> selectBussinessCount(Map<String, Object> map);

}
