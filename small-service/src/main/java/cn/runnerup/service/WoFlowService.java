package cn.runnerup.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.runnerup.mapper.WoflowMapper;
import cn.runnerup.model.User;
import cn.runnerup.model.Woflow;

@Service
public class WoFlowService {

	@Autowired
	private WoflowMapper woflowMapper;

	public void createWoFlow(User createdby, String descr, String oldstatus, String status, Integer wo, String buqicailiao) {
		Woflow record = new Woflow();
		record.setCreated(Calendar.getInstance().getTime());
		record.setDescr(descr);
		record.setOldstatus(oldstatus);
		record.setStatus(status);
		record.setWo(wo);
		record.setCreatedby(createdby);
		record.setBuqicailiao(buqicailiao);
		woflowMapper.insert(record);
	}

	public List<Woflow> getBusinessFlow(Integer wo) {
		return woflowMapper.getBusinessFlow(wo);
	}

}
