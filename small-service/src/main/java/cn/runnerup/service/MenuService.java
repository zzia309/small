package cn.runnerup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.runnerup.mapper.MenuMapper;
import cn.runnerup.model.Menu;

@Service
public class MenuService {

	@Autowired
	private MenuMapper menuMapper;

	@Transactional
	public Menu selectMenu(){
		return menuMapper.selectMenu();
	}
}
