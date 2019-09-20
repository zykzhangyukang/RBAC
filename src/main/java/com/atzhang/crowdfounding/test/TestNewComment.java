package com.atzhang.crowdfounding.test;

import com.atzhang.crowdfounding.beans.NewsComment;
import com.atzhang.crowdfounding.beans.NewsCommentExample;
import com.atzhang.crowdfounding.dao.NewsCommentMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestNewComment {
    @Autowired
    private NewsCommentMapper newsCommentMapper;
    private ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    {
        newsCommentMapper=ctx.getBean(NewsCommentMapper.class);
    }
    @Test
    public void testgetallcomment(){
        NewsCommentExample example=new NewsCommentExample();
        NewsCommentExample.Criteria criteria = example.createCriteria();
        criteria.andNewsIdEqualTo(43);
        List<NewsComment> newsComments =
                newsCommentMapper.selectByExampleWithUser(example);
        for (NewsComment newsComment : newsComments) {
            System.out.println(newsComment.getUser().getUsername());
        }
    }

}
