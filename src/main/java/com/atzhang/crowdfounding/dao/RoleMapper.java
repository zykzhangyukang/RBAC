package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.Role;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    @Select("select * from role ")
    List<Role> getAll();

    @Select(value = "insert into role(rolename,roledesc) values(#{rolename},#{roledesc})")
    void saveRole(Role role);

    @Select("delete from role where id=#{id}")
    void deleteRole(Integer id);

    void batchdelete(List<Integer> idslist);

    @Select(value = "select * from role where id=#{id}")
    Role getRoleById(Integer id);

    void updateRole(Role role);

    List<Role> getAllLike(String key);

    void batchDeleteUserRole(List<Integer> idlist);

    @Select(value = "delete from user_role where role_id=#{id}")
    void deleteUserRole(Integer id);

    void InsertRolePermission(Map<String, Object> map);

    @Delete(value = "delete from role_permission where role_id=#{roleid}")
    void deleteAllRolePermission(Integer roleid);

    void batchDeleteRolePermission(List<Integer> idslist);

}
