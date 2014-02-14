package cn.runnerup.actions.stores;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.kpi.model.KpiModel;
import cn.runnerup.mapper.commons.IndexMapper;

public class SalesStoreAction extends RunnerSupport implements ModelDriven<List<KpiModel>>{

	private static final long serialVersionUID = -7166928141223145205L;

	private List<KpiModel> model = new ArrayList<KpiModel>();

	@Autowired
	private IndexMapper indexMapper;

	public String index(){
		String sales = servletRequest.getParameter("sales");
		Map<String, Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(sales))
			map.put("sales", sales);
		model = indexMapper.selectSales(map);
		return SUCCESS;
	}

	@Override
	public List<KpiModel> getModel() {
		return model;
	}

}
