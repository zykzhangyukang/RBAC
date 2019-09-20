package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.dao.RoleMapper;
import com.atzhang.crowdfounding.service.RoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.awt.util.IdentityArrayList;

import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private SqlSessionFactory sessionFactory;
    @Override
    public PageInfo<Role> getPage(Integer pageno, Integer pageSize) {
        SqlSession sqlSession =
                sessionFactory.openSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        PageHelper.startPage(pageno,pageSize);
        List<Role> roles=mapper.getAll();
        PageInfo<Role> pageInfo=new PageInfo<>(roles);
        return pageInfo;
    }

    @Override
    public void saveRole(Role role) {
        roleMapper.saveRole(role);
    }


    @Override
    public void deteleRole(Integer id) {
        //删除该角色关联用户的关系的数据
        roleMapper.deleteUserRole(id);
        //删除该角色关联权限表中的数据
        roleMapper.deleteAllRolePermission(id);
        //删除该角色
        roleMapper.deleteRole(id);
    }

    @Override
    public void batchDelete(List<Integer> idslist) {
        //删除该角色关联用户的关系的数据
        roleMapper.batchDeleteUserRole(idslist);
        //删除该角色关联权限表中的数据
        roleMapper.batchDeleteRolePermission(idslist);
        //删除角色
        roleMapper.batchdelete(idslist);
    }

    @Override
    public Role findRoleById(Integer id) {
        return roleMapper.getRoleById(id);
    }

    @Override
    public void updateRole(Role role) {
        roleMapper.updateRole(role);
    }

    @Override
    public PageInfo<Role> queryForRole(String key, Integer pageno, Integer pagesize) {
        PageHelper.startPage(pageno,pagesize);
        SqlSession sqlSession = sessionFactory.openSession();
        RoleMapper mapper = sqlSession.getMapper(RoleMapper.class);
        List<Role> all = mapper.getAllLike(key);
        return new PageInfo<>(all);
    }

    @Override
    public void InsertRolePermission(Map<String, Object> map) {
        //在插入之前将该角色拥有的权限清空
        roleMapper.deleteAllRolePermission((Integer)map.get("roleid"));
        roleMapper.InsertRolePermission(map);
    }

}
