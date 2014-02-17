package cn.runnerup.actions.businesses.checks;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.runnerup.actions.RunnerSupport;
import cn.runnerup.model.Code;
import cn.runnerup.service.CodeService;

public class IndexAction extends RunnerSupport{

	private static final long serialVersionUID = -796312040123705819L;

	@Autowired
	private CodeService codeService;

	public String index(){
		return SUCCESS;
	}

	public List<Code> getCodes(String entity) {
		return codeService.getCodesByType(entity);
	}
}
