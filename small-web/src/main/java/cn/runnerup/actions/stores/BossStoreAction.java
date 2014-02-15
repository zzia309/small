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

public class BossStoreAction extends RunnerSupport implements ModelDriven<List<KpiModel>>{

	private static final long serialVersionUID = 1L;

	private List<KpiModel> model = new ArrayList<KpiModel>();

	@Autowired
	private IndexMapper indexMapper;

	public String index(){
		Map<String, Object> map = new HashMap<String, Object>();
		String start = servletRequest.getParameter("start");
		String end = servletRequest.getParameter("end");
		if(StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)){
			map.put("start", start);
			map.put("end", end);
		}
		model = indexMapper.selectBoss(map);
		return SUCCESS;

	}

	@Override
	public List<KpiModel> getModel() {
		return model;
	}

}
