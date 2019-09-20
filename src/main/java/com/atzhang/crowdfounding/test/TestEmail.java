package com.atzhang.crowdfounding.test;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.junit.Test;

import java.util.Date;

public class TestEmail {
    @Test
    public void testSendEmail(){

           SimpleEmail email = new SimpleEmail();
           email.setHostName("127.0.0.1");
           email.setSmtpPort(25);
           email.setAuthentication("zhangyukang@atyukang.com", "123456");//邮件服务器验证：用户名/密码

           try {
               email.setFrom("zhangyukang@atyukang.com");
               email.addTo("zyk3053161401@163.com");
               String msg="测试邮件,"+new Date().toString()+"" +"冲鸭!!!!!";
               email.setContent(msg,"text/html;charset=gb2312");
               email.setSubject(msg);

               email.setMsg("这是一封 测试邮件 ,你好啊!   冲鸭 ! ! !<a>cick me</a>");
               email.send();
           } catch (EmailException e) {
               e.printStackTrace();
           }

    }

}
