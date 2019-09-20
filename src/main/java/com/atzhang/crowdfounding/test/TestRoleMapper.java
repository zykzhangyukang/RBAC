package com.atzhang.crowdfounding.test;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.dao.RoleMapper;
import com.atzhang.crowdfounding.service.RoleService;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;
import java.util.List;

public class TestRoleMapper {
    private RoleService roleService=null;
    private ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    {
        roleService=ctx.getBean(RoleService.class);
    }
    @Test
    public void testfindrolelike(){
        PageInfo<Role> pageInfo = roleService.queryForRole("zhang", 1, 3);
        System.out.println(pageInfo.getList().size());
    }
    @Test
    public void testbatchdeleteuserandrole(){
        roleService.batchDelete(Arrays.asList(110,111));
    }
    /**
     * 删除角色的时候,删除对应角色和用户的关系数据
     */
    @Test
    public void batchdelete(){
        roleService.deteleRole(109);
    }
    @Test
    public void testupdaterole(){
        Role role = new Role();
        role.setId(109);
        role.setRolename("justiner");
        roleService.updateRole(role);
    }
    @Test
    public  void testbatchdeleterole(){
        List<Integer> integers = Arrays.asList(10, 11, 12);
        roleService.batchDelete(integers);
    }
    private SqlSessionFactory sessionFactory=ctx.getBean(SqlSessionFactory.class);
    @Test
    public void testsaverole(){
        SqlSession sqlSession =
                sessionFactory.openSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        for (int i = 0; i < 100;i++) {
            Role role = new Role();
            role.setRoledesc("dfasf");
            role.setRolename("角色"+ i+"号");
            mapper.saveRole(role);
        }
        sqlSession.commit();
    }
    @Test
    public void testgetrolesPage(){
        PageInfo<Role> page = roleService.getPage(1, 3);
        System.out.println(page.getList());
    }
}
