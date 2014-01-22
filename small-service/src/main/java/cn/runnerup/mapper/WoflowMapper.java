package cn.runnerup.mapper;

import cn.runnerup.model.Woflow;

public interface WoflowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Woflow record);

    int insertSelective(Woflow record);

    Woflow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Woflow record);

    int updateByPrimaryKeyWithBLOBs(Woflow record);

    int updateByPrimaryKey(Woflow record);
}