package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.NewsImg;
import com.atzhang.crowdfounding.beans.NewsImgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsImgMapper {
    long countByExample(NewsImgExample example);

    int deleteByExample(NewsImgExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewsImg record);

    int insertSelective(NewsImg record);

    List<NewsImg> selectByExample(NewsImgExample example);

    NewsImg selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewsImg record, @Param("example") NewsImgExample example);

    int updateByExample(@Param("record") NewsImg record, @Param("example") NewsImgExample example);

    int updateByPrimaryKeySelective(NewsImg record);

    int updateByPrimaryKey(NewsImg record);
}