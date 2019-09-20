package com.atzhang.crowdfounding.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.util.DigestUtils;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DBTest {
    private DataSource dataSource=null;
    private ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    {
        dataSource=ctx.getBean(DataSource.class);
    }

    @Test
    public void testgetconnection() throws SQLException {
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
    }
    @Test
    public void testmd5(){
        String s = DigestUtils.md5DigestAsHex("123456".getBytes());
        System.out.println(s);
    }
}
