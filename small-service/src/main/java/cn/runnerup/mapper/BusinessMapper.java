package cn.runnerup.mapper;

import java.util.List;
import java.util.Map;

import cn.runnerup.model.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);

    List<Business> getAllBusinesses(Map<String, Object> map);

    int selectCount(Map<String, Object> map);

    Business selectByCustomer(Integer customer);

    List<Business> getBusinessesHistory(Map<String, Object> map);

    int getBusinessesHistoryCount(Map<String, Object> map);

}