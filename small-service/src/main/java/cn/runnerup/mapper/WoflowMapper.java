package cn.runnerup.mapper;

import cn.runnerup.model.Woflow;

public interface WoflowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Woflow record);

    Woflow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeyWithBLOBs(Woflow record);

    int updateByPrimaryKey(Woflow record);
}