package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.beans.User;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
/**
 * 角色权限
 */
public interface PermissionMapper {
    /**
     * 查询权限所有的根节点
     * @return
     */
    @Select(value = "select * from permission where parent is null ")
    List<Permission> getRootsNodes();

    @Select(value = "select * from permission where parent=#{id} ")
    List<Permission> getChildNodes(Integer id);

    @Select(value = "insert into permission(name,parent,url,icon) values(#{name},#{parent},#{url},#{icon})")
    void InsertPermission(Permission permission);

    @Select(value = "delete from permission where id= #{id}")
    void deletePermission(Integer id);

    @Update("update permission set name= #{name}, url=#{url} ,icon =#{icon} where id=#{id}")
    void updatePermission(Permission permission);

    @Select("select * from permission where id=#{id}")
    Permission findPermissionById(Integer id);

    @Select(value = "select permission_id from role_permission where role_id=#{roleid}")
    List<Integer> getPermissionByRoleId(Integer roleid);

    @Select(value = "select * from permission ")
    List<Permission> getAllPerission();

    List<Permission> getPermissionByUserId(User dbUser);
}
