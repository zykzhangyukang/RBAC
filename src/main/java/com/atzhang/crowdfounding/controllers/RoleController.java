package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.service.RoleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService = null;

    /**
     * 给用角色配权限
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/doAssign")
    public Msg doAssign(@RequestParam("roleid") Integer roleid, Integer[] permissionids) {
        Map<String, Object> map = new HashMap<>();
        map.put("roleid", roleid);
        map.put("permissionids", permissionids);
        try {
            roleService.InsertRolePermission(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }

        return new Msg().success();
    }

    /**
     * 去赋予角色权限的页面
     *
     * @return
     */
    @RequestMapping("/assign")
    public String toassignPage() {
        return "role/assign";
    }

    @RequestMapping(value = "/index")
    public String index() {
        return "/role/index";
    }

    /**
     * 查询角色信息
     *
     * @param key
     * @param pageno
     * @param pagesize
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryForRole")
    public Msg queryForRole(@RequestParam("keyword") String key,
                            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageno,
                            @RequestParam(value = "pageSize", defaultValue = "6") Integer pagesize) {
        PageInfo<Role> rolePageInfo;
        rolePageInfo = roleService.queryForRole(key, pageno, pagesize);
        return new Msg().success().add("page", rolePageInfo);
    }

    /**
     * 更新角色的信息
     *
     * @param role
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateRole", method = RequestMethod.POST)
    public Msg updateRole(Role role) {
        try {
            roleService.updateRole(role);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }
        return new Msg().success();
    }

    /**
     * 角色编辑准备数据
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/editRole")
    public Msg editRole(@RequestParam("id") Integer id) {
        Role role = null;
        try {
            role = roleService.findRoleById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }
        return new Msg().success().add("role", role);
    }

    /**
     * 删除角色
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteRole", method = RequestMethod.GET)
    public Msg deleteRole(@RequestParam("ids") String ids) {
        if (ids.contains("-")) {
            List<Integer> idslist = new ArrayList<>();
            for (String s : ids.split("-")) {

                idslist.add(Integer.parseInt(s));
            }
            roleService.batchDelete(idslist);

        } else {
            roleService.deteleRole(Integer.parseInt(ids.trim()));
        }
        return new Msg().success();
    }

    /**
     * 角色添加
     *
     * @param role
     * @return
     */
    @ResponseBody
    @RequestMapping("/addRole")
    public Msg addRole(Role role) {
        roleService.saveRole(role);
        return new Msg().success();
    }

    /**
     * 角色分页
     *
     * @param pageno
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/getpage")
    public Msg getRolePage(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageno
            , @RequestParam(value = "pageSize", defaultValue = "6") Integer pageSize) {
        PageInfo<Role> pageInfo = roleService.getPage(pageno, pageSize);
        return new Msg().success().add("page", pageInfo);
    }
}
