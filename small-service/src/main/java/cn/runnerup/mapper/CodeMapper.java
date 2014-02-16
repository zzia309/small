package cn.runnerup.mapper;

import java.util.List;
import java.util.Map;

import cn.runnerup.model.Code;

public interface CodeMapper {
    int deleteByPrimaryKey(Integer id);
    int insert(Code code);
    Code selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Code code);
    List<Code> selectCodes(Map<String, Object> map);
    int selectCodesCount(Map<String, Object> map);
}