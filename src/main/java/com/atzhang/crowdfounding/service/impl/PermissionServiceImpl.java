package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.dao.PermissionMapper;
import com.atzhang.crowdfounding.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper=null;
    //获取所有权限根节点
    @Override
    public List<Permission> getRootsNodes() {
        return permissionMapper.getRootsNodes();
    }
    //获取所有权限的子节点
    @Override
    public List<Permission> getChildNodes(Integer id) {
        return permissionMapper.getChildNodes(id);
    }
    //添加权限
    @Override
    public void InsertPermission(Permission permission) {
        permissionMapper.InsertPermission(permission);
    }
    //删除权限
    @Override
    public void deletePermission(Integer id) {
        permissionMapper.deletePermission(id);
    }
    //更新权限
    @Override
    public void updatePermission(Permission permission) {
        permissionMapper.updatePermission(permission);
    }
    //根据id查找权限
    @Override
    public Permission findPermissionById(Integer id) {
        return permissionMapper.findPermissionById(id);
    }

    @Override
    public List<Integer> getPermissionByRoleId(Integer roleid) {
        return permissionMapper.getPermissionByRoleId(roleid);
    }

    @Override
    public List<Permission> getAllPerission() {
        return permissionMapper.getAllPerission();
    }

    @Override
    public List<Permission> getPermissionByUserId(User dbUser) {
        return permissionMapper.getPermissionByUserId(dbUser);
    }
}
