package cn.runnerup.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.runnerup.mapper.CodeMapper;
import cn.runnerup.model.Code;

@Service
public class CodeService {

	@Autowired
	private CodeMapper codeMapper;

	public Code getCode(Integer id){
		return codeMapper.selectByPrimaryKey(id);
	}

	public void deleteCode(Code code){
		codeMapper.deleteByPrimaryKey(code.getId());
	}

	public List<Code> getCodes(Map<String, Object> map){
		return codeMapper.selectCodes(map);
	}

	public Integer getCodesCount(Map<String, Object> map){
		return codeMapper.selectCodesCount(map);
	}

	public void updateCode(Code code){
		codeMapper.updateByPrimaryKey(code);
	}

	public Code createCode(Code code){
		codeMapper.insert(code);
		return code;
	}

}
