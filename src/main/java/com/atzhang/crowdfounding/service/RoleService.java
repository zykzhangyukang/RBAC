package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.Role;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface RoleService {
    PageInfo<Role> getPage(Integer pageno, Integer pageSize);

    void saveRole(Role role);

    void deteleRole(Integer id);

    void batchDelete(List<Integer> idslist);

    Role findRoleById(Integer id);

    void updateRole(Role role);

    PageInfo<Role> queryForRole(String key, Integer pageno, Integer pagesize);

    void InsertRolePermission(Map<String, Object> map);

}
