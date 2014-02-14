package cn.runnerup.actions.stores;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.commons.IndexMapper;

public class ProfitsStoreAction extends RunnerSupport implements ModelDriven<ProfitsModel>{

	private static final long serialVersionUID = -6851098871011607847L;

	private ProfitsModel model = new ProfitsModel();

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
		model.setModels(indexMapper.selectProfits(map));
		model.setList(indexMapper.selecTypeProfits(map));
		return SUCCESS;

	}

	@Override
	public ProfitsModel getModel() {
		return model;
	}

}
