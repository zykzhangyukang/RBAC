package com.atzhang.crowdfounding.test;

import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.service.PermissionService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestPermissionMapper {

    private PermissionService permissionService;
    private ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
    {
        permissionService=ctx.getBean(PermissionService.class);
    }
    @Test
    public void testgetPermissionByUserId(){
        User user = new User();
        user.setId(303);
        List<Permission> permissionByUserId = permissionService.getPermissionByUserId(user);
        System.out.println(permissionByUserId.size());
    }
    @Test
    public void testgetchildnode(){
        List<Permission> childNodes = permissionService.getChildNodes(1);
        System.out.println(childNodes);
    }
    @Test
    public void testgetallpartent(){
        List<Permission> rootsNodes = permissionService.getRootsNodes();
        System.out.println(rootsNodes);
    }
}
