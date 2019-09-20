package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.New;
import com.atzhang.crowdfounding.beans.NewExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface NewMapper {
    long countByExample(NewExample example);

    int deleteByExample(NewExample example);

    int deleteByPrimaryKey(Integer newsid);

    int insert(New record);

    int insertSelective(New record);

    List<New> selectByExample(NewExample example);

    List<New> selectByExampleWithType(NewExample example);

    New selectByPrimaryKey(Integer newsid);

    int updateByExampleSelective(@Param("record") New record, @Param("example") NewExample example);

    int updateByExample(@Param("record") New record, @Param("example") NewExample example);

    int updateByPrimaryKeySelective(New record);

    int updateByPrimaryKey(New record);

    @Update(value = "update from news set newslooknum=newslooknum+1 where newsID=#{id}")
    void addLookNumber(Integer id);
}