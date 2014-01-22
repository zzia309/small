package cn.runnerup.mapper;

import java.util.List;

import cn.runnerup.model.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);

    List<Business> getAllBusinesses();
}