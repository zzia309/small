package cn.runnerup.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.runnerup.mapper.UserMapper;
import cn.runnerup.mapper.commons.UserExMapper;
import cn.runnerup.model.User;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;

	@Autowired
	private UserExMapper userExMapper;

	public void deleteUser(User user){
		mapper.deleteByPrimaryKey(user.getId());
	}

	@Transactional(rollbackFor=Exception.class)
	public User createUser(User user){
		String password = user.getPassword();
		if(StringUtils.isNotEmpty(password))
			user.setPassword(encodePassword(password));
		mapper.insert(user);
		return user;
	}

	public void updateUser(User user){
		mapper.updateByPrimaryKey(user);
	}

	public User select(Integer id){
		return mapper.selectByPrimaryKey(id);
	}

	public User selectUser(String username) {
		return userExMapper.selectByUsername(username);
	}

	public List<User> selectAllUsers(Map<String, Object> param){
		return userExMapper.selectAllUsers(param);
	}

	public int selectCount(Map<String, Object> param) {
		return userExMapper.selectCount(param);
	}

	@Transactional(rollbackFor=Exception.class)
	public int insert(User user) {
		String password = user.getPassword();
		if(StringUtils.isNotEmpty(password))
			user.setPassword(encodePassword(password));
		return mapper.insert(user);
	}

	public boolean verifyPassword(User user, String password) {
		return StringUtils.equals(user.getPassword(), encodePassword(password));
	}

	public String encodePassword(String password) {
		return DigestUtils.sha1Hex(password);
	}

	public List<User> selectAll(){
		return mapper.selectAllUser();
	}
}
