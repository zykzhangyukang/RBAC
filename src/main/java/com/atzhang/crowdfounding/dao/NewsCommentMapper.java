package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.NewsComment;
import com.atzhang.crowdfounding.beans.NewsCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsCommentMapper {
    long countByExample(NewsCommentExample example);

    int deleteByExample(NewsCommentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewsComment record);

    int insertSelective(NewsComment record);

    List<NewsComment> selectByExample(NewsCommentExample example);

    List<NewsComment> selectByExampleWithUser(NewsCommentExample example);

    NewsComment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewsComment record, @Param("example") NewsCommentExample example);

    int updateByExample(@Param("record") NewsComment record, @Param("example") NewsCommentExample example);

    int updateByPrimaryKeySelective(NewsComment record);

    int updateByPrimaryKey(NewsComment record);
}