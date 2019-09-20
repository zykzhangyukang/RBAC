package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.NewType;
import com.atzhang.crowdfounding.beans.NewTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewTypeMapper {
    long countByExample(NewTypeExample example);

    int deleteByExample(NewTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewType record);

    int insertSelective(NewType record);

    List<NewType> selectByExample(NewTypeExample example);

    NewType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewType record, @Param("example") NewTypeExample example);

    int updateByExample(@Param("record") NewType record, @Param("example") NewTypeExample example);

    int updateByPrimaryKeySelective(NewType record);

    int updateByPrimaryKey(NewType record);
}