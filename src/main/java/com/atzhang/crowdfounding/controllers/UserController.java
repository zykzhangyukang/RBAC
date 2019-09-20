package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.Id;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户取消角色
     * @return
     */
    @ResponseBody
    @RequestMapping("/dounAssign")
    public Msg dounAssign(@RequestParam("id") Integer id,@RequestParam("assignroleids") List<Integer> unassignroleids){
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("assignroleids",unassignroleids);
        try {
            userService.unAssignRole(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }
        return new Msg().success();
    }
    /**
     * 给用户分配角色
     * @return
     */
    @ResponseBody
    @RequestMapping("/doAssign")
    public Msg doAssign(@RequestParam("id") Integer id,@RequestParam("unassignroleids") List<Integer> unassignroleids){
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("unassignroleids",unassignroleids);
        userService.AssignRole(map);
        return new Msg().success();
    }
    /**
     * 去分配角色页面
     * @return
     */
    @RequestMapping("/assign")
    public String assgin(@RequestParam("id") Integer id, Map<String,Object> map){
        //用户已经分配的角色
        List<Role> Alroles =userService.getAllReadyRoles(id);
        //用户未分配的角色
        List<Role> unHaveRoles =userService.getUnHaveRoles(id);
        map.put("Alroles",Alroles);
        map.put("unHaveRoles",unHaveRoles);
        return "/user/assign";
    }
    /**
     * 删除用户
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteUser")
    public Msg deletUser(@RequestParam("ids") String ids) {
        if (ids.contains("-")) {
            String[] idstrs = ids.split("-");
            List<Integer> idlist = new ArrayList<>();
            for (int i = 0; i < idstrs.length; i++) {
                idlist.add(Integer.parseInt(idstrs[i]));
            }
            //批量
            userService.BatchDelete(idlist);
        } else {
            userService.deleteUser(Integer.parseInt(ids));
        }
        return new Msg().success();
    }

    /**
     * 模糊查询
     * @param keyword
     * @param pageno
     * @param size
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/queryForUser",method = RequestMethod.GET)
    public Msg queryForUser(@RequestParam("keyword") String keyword,
                            @RequestParam(value = "pageNo", defaultValue = "1") Integer pageno,
                            @RequestParam(value = "pageSize", defaultValue = "10") Integer size){
        PageInfo<User> userPageInfo = userService.findUserLike(keyword,pageno,size);
       userPageInfo.setNavigatePages(6);
        return new Msg().success().add("page",userPageInfo);
    }
    /**
     * 用户分页
     * @param pageno
     * @param size
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getpage", method = RequestMethod.GET)
    public Msg getUserPage(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageno,
                           @RequestParam(value = "pageSize", defaultValue = "10") Integer size) {

        PageInfo<User> pageInfo = userService.getUserPage(pageno, size);
        pageInfo.setNavigatePages(6);
        return new Msg().success().add("page", pageInfo);
    }
    /**
     * 用户管理首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "/user/index";
    }

    /**
     * 保存员工信息
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/addUser",method = RequestMethod.POST)
    public Msg saveUser(User user){
        //设置用户的默认密码
        user.setPassword("123456");
        userService.saveUser(user);
        return new Msg().success();
    }
    /**
     * 更新用户信息
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateUser")
    public Msg updateUser(User user){
        userService.updateUser(user);
        return new Msg().success();
    }
    /**
     * 编辑员工信息
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/editUser")
    public Msg editUser(@RequestParam("id") Integer id) {
        User user = userService.findUserById(id);
        return new Msg().success().add("user", user);
    }


}
