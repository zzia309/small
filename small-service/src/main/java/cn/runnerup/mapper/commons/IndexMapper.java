package cn.runnerup.mapper.commons;

import java.util.List;
import java.util.Map;

import cn.runnerup.kpi.model.KpiModel;

public interface IndexMapper {

	 List<KpiModel> selectBussinessCount(Map<String, Object> map);
	 List<KpiModel> selectProfits(Map<String, Object> map);
	 List<KpiModel> selectSales(Map<String, Object> map);
	 KpiModel selectBySales(Map<String, Object> map);
	 List<KpiModel> selectTypeProfits(Map<String, Object> map);
	 List<KpiModel> selectBoss(Map<String, Object> map);
}