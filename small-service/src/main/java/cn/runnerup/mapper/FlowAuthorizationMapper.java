package cn.runnerup.mapper;

import cn.runnerup.model.FlowAuthorization;

public interface FlowAuthorizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FlowAuthorization record);

    int insertSelective(FlowAuthorization record);

    FlowAuthorization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FlowAuthorization record);

    int updateByPrimaryKey(FlowAuthorization record);
}