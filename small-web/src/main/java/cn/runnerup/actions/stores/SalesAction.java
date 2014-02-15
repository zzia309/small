package cn.runnerup.actions.stores;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.kpi.model.KpiModel;
import cn.runnerup.mapper.commons.IndexMapper;

import com.opensymphony.xwork2.ModelDriven;

public class SalesAction extends RunnerSupport implements ModelDriven<KpiModel> {

	private static final long serialVersionUID = 4613296173230100107L;
	
	private KpiModel model = new KpiModel();
	
	@Autowired
	private IndexMapper indexMapper;
	
	private String sales;
	
	public String index() {
		if(StringUtils.isNotEmpty(sales)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sales", sales);
			model = indexMapper.selectBySales(map);
		}
		
		return SUCCESS;
	}

	@Override
	public KpiModel getModel() {
		return model;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

}
