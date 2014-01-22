package cn.runnerup.mapper.commons;

import java.util.List;
import java.util.Map;

import cn.runnerup.model.User;

public interface UserExMapper {

	User selectByUsername(String username);

    List<User> selectAllUsers(Map<String, Object> param);

    int selectCount(Map<String, Object> param);

}
