package cn.runnerup.actions.codes;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.CodeMapper;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = 7270504304658896647L;

	private ListModel model = new ListModel();

	@Autowired
	private CodeMapper codeMapper;

	public String index(){
		String type = servletRequest.getParameter("type");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		if(StringUtils.isNotBlank(type))
			map.put("type", type);
		model.setModels(codeMapper.selectCodes(map));
		model.setTotal(codeMapper.selectCodesCount(map));
		return SUCCESS;
	}

	@Override
	public ListModel getModel() {
		return model;
	}

}
