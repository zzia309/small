package cn.runnerup.actions.stores;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.kpi.model.KpiModel;
import cn.runnerup.mapper.commons.IndexMapper;

public class TypeBusinessStoreAction extends RunnerSupport implements ModelDriven<List<KpiModel>>{

	private static final long serialVersionUID = -6215099222663412886L;

	private List<KpiModel> model = new ArrayList<KpiModel>();

	@Autowired
	private IndexMapper indexMapper;

	public String index(){
		Map<String, Object> map = new HashMap<String, Object>();
		String type = servletRequest.getParameter("type");
		String sales = servletRequest.getParameter("sales");
		String branch = servletRequest.getParameter("branch");
		String start = servletRequest.getParameter("start");
		String end = servletRequest.getParameter("end");
		
		if(StringUtils.isNotBlank(type))
			map.put("type", type);
		if(StringUtils.isNotBlank(sales))
			map.put("sales", sales);
		if(StringUtils.isNotBlank(branch))
			map.put("branch", branch);
		if(StringUtils.isNotBlank(start))
			map.put("start", start);
		if(StringUtils.isNotBlank(end))
			map.put("end", end);
		model = indexMapper.selectBussinessCount(map);
		return SUCCESS;
	}

	@Override
	public List<KpiModel> getModel() {
		return model;
	}

}
