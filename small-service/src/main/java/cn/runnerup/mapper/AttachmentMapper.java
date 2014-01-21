package cn.runnerup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.runnerup.model.Attachment;

public interface AttachmentMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Attachment record);

    int insertSelective(Attachment record);

    Attachment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Attachment record);

    int updateByPrimaryKey(Attachment record);

    List<Attachment> getAttachments(@Param("model")String model, @Param("record")String record, @Param("type")int type);

}