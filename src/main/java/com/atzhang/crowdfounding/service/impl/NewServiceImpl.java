package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.*;
import com.atzhang.crowdfounding.dao.NewMapper;
import com.atzhang.crowdfounding.dao.NewsCommentMapper;
import com.atzhang.crowdfounding.dao.NewsImgMapper;
import com.atzhang.crowdfounding.dao.UserMapper;
import com.atzhang.crowdfounding.service.NewService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.webkit.network.URLs;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.NotWritablePropertyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class NewServiceImpl implements NewService {

    @Autowired
    private NewMapper newMapper;

    @Autowired
    private NewsImgMapper newsImgMapper;

    @Autowired
    private NewsCommentMapper newsCommentMapper;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public PageInfo<New> getNewPage(Integer pageno, Integer pagesize) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NewMapper mapper = sqlSession.getMapper(NewMapper.class);
        PageHelper.startPage(pageno, pagesize);
        NewExample example = new NewExample();
        example.setOrderByClause("newsdate desc");
        List<New> news = mapper.selectByExampleWithType(example);
        PageInfo<New> newPageInfo = new PageInfo<>(news);
        return newPageInfo;
    }

    @Override
    public New getFindNewsDetails(Integer id) {
        New aNew = newMapper.selectByPrimaryKey(id);
        //浏览量增加
        Integer newslooknum = aNew.getNewslooknum();
        if (newslooknum == null) {
            newslooknum = 0;
        }
        aNew.setNewslooknum(newslooknum + 1);
        newMapper.updateByPrimaryKeySelective(aNew);
        return aNew;
    }

    @Override
    public void deleteNew(int i) {
        newMapper.deleteByPrimaryKey(i);
    }

    @Override
    public void BatchDeleteNews(List<Integer> ids) {
        NewExample example = new NewExample();
        NewExample.Criteria criteria = example.createCriteria();
        criteria.andNewsidIn(ids);
        newMapper.deleteByExample(example);
    }

    @Override
    public void doAddNew(New ne, List<String> imgpaths, HttpSession session) {
        User manager = (User) session.getAttribute("loginUser");
        ne.setNewslooknum(0);
        ne.setNewsdate(new Date());
        ne.setSendUserId(manager.getId());
        ne.setUser(manager);
        //设置第一张图片为新闻的海报图
        String s = imgpaths.get(0);
        ne.setNewsimagepath(s);
        newMapper.insert(ne);
        //插入图片到图片表
        for (String imgpath : imgpaths) {
            NewsImg newsImg = new NewsImg();
            newsImg.setImgPath(imgpath);
            newsImg.setNewsId(ne.getNewsid());
            newsImgMapper.insert(newsImg);
        }
    }

    @Override
    public List<String> getAllImgs(Integer id) {
        NewsImgExample example = new NewsImgExample();
        NewsImgExample.Criteria criteria = example.createCriteria();
        criteria.andNewsIdEqualTo(id);
        List<NewsImg> newsImgs = newsImgMapper.selectByExample(example);
        List<String> urls = new ArrayList<>();
        for (NewsImg newsImg : newsImgs) {
            urls.add(newsImg.getImgPath());
        }
        return urls;
    }
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<NewsComment> getAllComment(Integer id) {
        NewsCommentExample example=new NewsCommentExample();
        NewsCommentExample.Criteria criteria = example.createCriteria();
        criteria.andNewsIdEqualTo(id);
        List<NewsComment> newsComments = newsCommentMapper.selectByExampleWithUser(example);
        return newsComments;
    }


}
