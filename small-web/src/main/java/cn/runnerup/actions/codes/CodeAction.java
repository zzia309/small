package cn.runnerup.actions.codes;

import java.util.Calendar;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts2.rest.DefaultHttpHeaders;
import org.apache.struts2.rest.HttpHeaders;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.mapper.CodeMapper;
import cn.runnerup.model.Code;
import cn.runnerup.model.User;
import cn.runnerup.service.CodeService;

public class CodeAction extends RunnerSupport implements ModelDriven<CodeModel>{

	private static final long serialVersionUID = 7594518361567534838L;

	private Code code;

	private Integer id;

	private CodeModel model = new CodeModel();

	@Autowired
	private CodeMapper codeMapper;

	@Autowired
	private CodeService codeService;

	public String show(){
		model.setSuccess(true);
		return SUCCESS;
	}

	public String editNew() {
		model.setSuccess(true);
		return "edit";
	}


	public String edit() {
		model.setSuccess(code != null);
		return "edit";
	}

	public HttpHeaders create() {
		try {
			User user = getUser();
			model.setCreatedby(user);
			model.setCreated(Calendar.getInstance().getTime());
			codeService.createCode(model);
			model.setSuccess(true);
		} catch (Exception e) {

		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders update() {
		if(code != null) {
			codeService.updateCode(model);
			model.setSuccess(true);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public HttpHeaders destroy() {
		if(code != null) {
			codeService.deleteCode(model);
			model.setSuccess(true);
		}
		return new DefaultHttpHeaders(SUCCESS).setLocationId(model.getId());
	}

	public CodeModel getModel() {
		return model;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) throws Exception {
		if(id != null){
			code = codeMapper.selectByPrimaryKey(id);
			PropertyUtils.copyProperties(model, code);
		}else{
			addActionError("error");
		}
		this.id = id;
	}

}
