package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.beans.User;

import java.util.List;
import java.util.Map;

public interface PermissionService {

    List<Permission> getRootsNodes();

    List<Permission> getChildNodes(Integer id);

    void InsertPermission(Permission permission);

    void deletePermission(Integer id);

    void updatePermission(Permission permission);

    Permission findPermissionById(Integer id);

    List<Integer> getPermissionByRoleId(Integer roleid);

    List<Permission> getAllPerission();

    List<Permission> getPermissionByUserId(User dbUser);

}
