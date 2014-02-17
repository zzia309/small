package cn.runnerup.actions.businesses;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.FlowAuthorizationMapper;
import cn.runnerup.model.User;
import cn.runnerup.service.BusinessService;

import com.opensymphony.xwork2.ModelDriven;

public class ListAction extends RunnerSupport implements ModelDriven<ListModel>{

	private static final long serialVersionUID = -2993395498134509472L;

	private ListModel model = new ListModel();

	@Autowired
	private BusinessService businessService;

	@Autowired
	private FlowAuthorizationMapper flowAuthorizationMapper;

	public String index(){
		User user = getUser();
		Map<String, Object> map = new HashMap<String, Object>();
		String condition = servletRequest.getParameter("condition");
		String area = servletRequest.getParameter("area");
		String type = servletRequest.getParameter("type");
		String starttime = servletRequest.getParameter("starttime");
		String endtime = servletRequest.getParameter("endtime");
		String carno = servletRequest.getParameter("carno");
		System.out.println(condition);
		map.put("limit", model.getLimit());
		map.put("start", model.getStart());
		if(StringUtils.isNotBlank(area))
			map.put("area", area);
		if(StringUtils.isNotBlank(type))
			map.put("type", type);
		if(StringUtils.isNotBlank(starttime) && StringUtils.isNotBlank(endtime)){
			map.put("start", starttime);
			map.put("end", endtime);
		}
		if(StringUtils.isNotBlank(carno))
			map.put("carno", carno);
		if(StringUtils.isNotBlank(condition))
			map.put("condition", condition);
		List<String> status = flowAuthorizationMapper.selectFromStatus(user.getPriority());
		map.put("status", status);
		model.setModels(businessService.getAllBusinesses(map));
		model.setTotal(businessService.getBusinessCount(map));
		return SUCCESS;	}

	public ListModel getModel() {
		return model;
	}

}
