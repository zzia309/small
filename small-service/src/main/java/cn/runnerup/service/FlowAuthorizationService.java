package cn.runnerup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.runnerup.mapper.FlowAuthorizationMapper;

@Service
public class FlowAuthorizationService {

	@Autowired
	private FlowAuthorizationMapper flowAuthorizationMapper;

}
