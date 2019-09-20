package com.atzhang.crowdfounding.test;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.dao.UserMapper;
import com.atzhang.crowdfounding.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class TestUserMapper {
    ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
    private UserService userService = null;
    private DataSource dataSource = null;
    private SqlSessionFactory sessionFactory = null;
    private UserMapper userMapper = null;
    {
        sessionFactory = ctx.getBean(SqlSessionFactory.class);
        dataSource = ctx.getBean(DataSource.class);
        userService = ctx.getBean(UserService.class);
        userMapper = ctx.getBean(UserMapper.class);
    }
    @Test
    public void testgetuserbytoken(){
        User user = userMapper.getUserByTokenid("aef0d8f9-e9c3-47bb-8e25-931ffe36e1c5");
        System.out.println(user);
    }
    /**
     * 用户取消角色
     */
    @Test
    public void testassignroleids(){
        Map<String,Object> map=new HashMap<>();
        map.put("id",303);
        map.put("assignroleids",Arrays.asList(112,114));
        userService.unAssignRole(map);
    }
    /**
     * 给用户分配角色
     */
    @Test
    public void testAssignRole(){
        Map<String,Object> map=new HashMap<>();
        map.put("id",422);
        map.put("unassignroleids",Arrays.asList(225,226));
        userService.AssignRole(map);
    }
    @Test
    public void testqueryForUser(){
//        List<User> userLike = userService.findUserLike("2");
//        System.out.println(userLike);
    }
    @Test
    public void testupdateuser(){
        User user=new User();
        user.setId(1);
        user.setUsername("justin");
        userService.updateUser(user);
    }
    @Test
    public void tesetfindUserById(){
        User userById = userService.findUserById(1);
        System.out.println(userById);
    }
    @Test
    public void testuserservice(){
        UserService bean = ctx.getBean(UserService.class);
        System.out.println(bean.getClass());
        System.out.println(SqlSessionFactory.class);
    }
    @Test
    public void testbatchdeleteUser() {
        List<Integer> idlist = new ArrayList<>();
        idlist = Arrays.asList(107, 108);
        System.out.println(idlist);
        userService.BatchDelete(idlist);

    }
    @Test
    public void testdeleteByid() {
        userService.deleteUser(106);
    }

    @Test
    public void testbathsaveUser() {
        SqlSession sqlSession = sessionFactory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        for (int i = 0; i < 100; i++) {
            User user = new User();
            user.setPassword("123456");
            user.setAge(14 + i);
            user.setLoginId(String.valueOf(UUID.randomUUID().toString().substring(0,4)));
            user.setUsername(UUID.randomUUID().toString().substring(0, 4));
            user.setEmail(UUID.randomUUID().toString().substring(0, 5) + "@qq.com");
            user.setPhonenumber("1212111" + i);
            mapper.add(user);
        }
        sqlSession.commit();
    }
    @Test
    public void tesetgetUnHaveRoles(){
        List<Role> unHaveRoles = userService.getUnHaveRoles(303);
        System.out.println(unHaveRoles.size());
    }
    @Test
    public void testgetAllReadyRoles(){
        //获取用户已经分配的角色
        List<Role> allReadyRoles = userService.getAllReadyRoles(303);
        System.out.println(allReadyRoles.size());
        for (Role allReadyRole : allReadyRoles) {
            String rolename = allReadyRole.getRolename();
            System.out.println(rolename);
        }
    }
    @Test
    public void testsaveuser() {
        User user = new User();
        userMapper.add(user);
    }

    @Test
    public void testgetuserpage() {
        PageInfo<User> userPage = userService.getUserPage(1, 3);
        List<User> list = userPage.getList();
        for (User user : list) {
            System.out.println(user);
        }
    }

    @Test
    public void testishaveuser() {
        User user = userMapper.isHaveUser("zhangyukang");
        System.out.println(user);
    }

    @Test
    public void testgetuser() {
        User user1 = new User();
        user1.setLoginId("zhangyukang");
        user1.setPassword("123456");
        User user = userMapper.QueryForLogin(user1);
        System.out.println(user);
    }

    @Test
    public void testgetusermapper() {
        System.out.println(userMapper);
    }

    @Test
    public void testgetconnection() throws SQLException {
        Connection connection =
                dataSource.getConnection();
        System.out.println(connection);
    }

}
