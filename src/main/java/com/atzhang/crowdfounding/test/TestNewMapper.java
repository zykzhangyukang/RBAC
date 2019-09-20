package com.atzhang.crowdfounding.test;

import com.atzhang.crowdfounding.beans.New;
import com.atzhang.crowdfounding.beans.NewExample;
import com.atzhang.crowdfounding.beans.NewType;
import com.atzhang.crowdfounding.dao.NewMapper;
import com.atzhang.crowdfounding.service.NewService;
import com.atzhang.crowdfounding.service.NewTypeService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapters;
import java.util.Date;
import java.util.List;

public class TestNewMapper{
    private NewService newService;
    private NewMapper newMapper;
    private SqlSessionFactory sqlSessionFactory;
    private NewTypeService newTypeService;
    private ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    {
        newService=ctx.getBean(NewService.class);
        sqlSessionFactory=ctx.getBean(SqlSessionFactory.class);
        newTypeService=ctx.getBean(NewTypeService.class);
        newMapper=ctx.getBean(NewMapper.class);
    }

    @Test
    public void testgetnewstype(){
        NewExample example=new NewExample();
        NewExample.Criteria criteria = example.createCriteria();
        criteria.andNewsidEqualTo(43);
        List<New> news = newMapper.selectByExampleWithType(example);
        System.out.println(news);
        for (New aNew : news) {
            String typeDesc = aNew.getNewType().getTypeDesc();
            System.out.println(typeDesc);
        }
    }
    @Test
    public void testgetallnewstype(){
        List<NewType> all = newTypeService.getAll();
        System.out.println(all);
        for (NewType newType : all) {
            String typeDesc = newType.getTypeDesc();
            System.out.println(typeDesc);
        }
    }
    @Test
    public void insertnewss(){
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NewMapper mapper = sqlSession.getMapper(NewMapper.class);
        New aNew = new New();
        aNew.setNewscontent("div class=\"hr-line-dashed\"></div>\n" +
                "                                <div class=\"search-result\">\n" +
                "                                    <h3><a href=\"search_results.html#\">定制后台的主题目录(Theme)</a></h3>\n" +
                "                                    <a href=\"search_results.html#\" class=\"search-link\">koda.iteye.com/blog/10...</a>\n" +
                "                                    <p>\n" +
                "                                        不像前台Theme目录的改变可以通过后台界面配置,后台的主题目录要自己修改相应的配置文件。 Theme目录的配置再Adminhtml模块,打开后台的配置文件 $MAGENO_DIR\\app\\code...");
        aNew.setNewsdate(new Date());
        aNew.setNewsdesc("myBatis 是一个可以自定义SQL、存储过程和高级映射的持久层框架；order by 表示以...排序的意思；clause 表示从句，分句，条款，款项等意思");
        aNew.setNewsimagepath("c/app.png");

        aNew.setNewstitle("myBatis 是一个可以自定义SQL、存储过程和高级映射的持久层框架");
        for (int i = 0; i < 10; i++) {
            mapper.insert(aNew);
        }
        sqlSession.commit();

    }
    @Test
    public void test(){
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NewMapper mapper = sqlSession.getMapper(NewMapper.class);
        List<New> news = mapper.selectByExampleWithType(null);
        System.out.println(news);
    }
    @Test
    public void testgetallnews(){
        PageInfo<New> newPage = newService.getNewPage(1, 1);
        long total = newPage.getTotal();
        int prePage = newPage.getPrePage();
        int nextPage = newPage.getNextPage();
    }

}
