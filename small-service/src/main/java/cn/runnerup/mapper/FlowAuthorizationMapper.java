package cn.runnerup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.runnerup.model.FlowAuthorization;

public interface FlowAuthorizationMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(FlowAuthorization record);

    FlowAuthorization selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(FlowAuthorization record);

    List<String> selectFromStatus(Integer role);

    List<String> selectToStatus(@Param("role")Integer role, @Param("fromStatus")String fromStatus);

}