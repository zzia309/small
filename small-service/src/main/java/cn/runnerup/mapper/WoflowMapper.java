package cn.runnerup.mapper;

import java.util.List;

import cn.runnerup.model.Woflow;

public interface WoflowMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Woflow record);

    Woflow selectByPrimaryKey(Integer id);

    int updateByPrimaryKeyWithBLOBs(Woflow record);

    int updateByPrimaryKey(Woflow record);

    List<Woflow> getBusinessFlow(Integer wo);

}