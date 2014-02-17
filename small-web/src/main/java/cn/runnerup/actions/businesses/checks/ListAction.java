package cn.runnerup.actions.businesses.checks;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.BusinessMapper;
import cn.runnerup.mapper.FlowAuthorizationMapper;
import cn.runnerup.service.BusinessService;

import com.opensymphony.xwork2.ModelDriven;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -2993395498134509472L;

	private ListModel model = new ListModel();

	@Autowired
	private BusinessService businessService;


	@Autowired
	private BusinessMapper businessMapper;



	@Autowired
	private FlowAuthorizationMapper flowAuthorizationMapper;

	public String index(){
		Map<String, Object> map = new HashMap<String, Object>();
		String condition = servletRequest.getParameter("condition");
		String area = servletRequest.getParameter("area");
		String type = servletRequest.getParameter("type");
		String starttime = servletRequest.getParameter("starttime");
		String endtime = servletRequest.getParameter("endtime");
		String carno = servletRequest.getParameter("carno");
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		if(StringUtils.isNotBlank(area))
			map.put("area", area);
		if(StringUtils.isNotBlank(type))
			map.put("type", type);
		if(StringUtils.isNotBlank(starttime) && StringUtils.isNotBlank(endtime)){
			map.put("starttime", starttime);
			map.put("endtime", endtime);
		}
		if(StringUtils.isNotBlank(carno))
			map.put("carno", carno);
		if(StringUtils.isNotBlank(condition))
			map.put("condition", condition);
		map.put("user", getUser().getId());
		model.setModels(businessMapper.getBusinessesHistory(map));
		model.setTotal(businessMapper.getBusinessesHistoryCount(map));
		return SUCCESS;	}

	public ListModel getModel() {
		return model;
	}

}
