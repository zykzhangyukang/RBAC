package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.service.PermissionService;
import com.atzhang.crowdfounding.service.RoleService;
import com.atzhang.crowdfounding.service.UserService;
import com.mysql.fabric.Response;
import com.sun.deploy.net.HttpResponse;
import com.sun.xml.internal.ws.resources.HttpserverMessages;
import jdk.nashorn.internal.parser.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.*;

@Controller
public class DispatcherController {
    @Autowired
    private UserService userService;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/error")
    public String error(){
        return "error";
    }
    /**
     * 登入跳转
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request,HttpSession session){
        return "login";
    }

    /**
     * 去注册页面
     * @return
     */
    @RequestMapping("/toRegister")
    public  String gotToRegister(){
        return "register";
    }
    /**
     * 跳转到后台主页面
     * @return
     */
    @RequestMapping(value = "/main")
    public String main(){
        return "main";
    }
    //退出登入
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        session.invalidate();
        /**
        Cookie[] cookies = request.getCookies();
        for(int i=0;i<cookies.length;i++){
            if(cookies[i]!=null&&cookies[i].getName().equals("autologin_token")){
                cookies[i].setMaxAge(0);
                response.addCookie(cookies[i]);
            }
        }
         **/
        return "/login";
    }
    //重置密码
    @RequestMapping("/doRsetPwd")
    public String RsetPassword(@RequestParam("newpwd") String newpwd,@RequestParam("token") String token,Map<String,Object> map){
        System.out.println(newpwd);
        System.out.println(token);
        boolean isrset= userService.doSetPwd(newpwd,token);
        if(isrset){
            map.put("msg","重置密码成功");
            return "login";
        }else{
            map.put("msg","重置密码失败");
            return "rsetpwd";
        }
    }
    //邮箱验证(支持网易云,qq邮箱)
    @RequestMapping("/sendEmail")
    public String sendEmail(@RequestParam("email") String email,Map<String,Object> map){
        boolean send=userService.sendEmail(email);
        if(send){
            map.put("msg","我们已经成功发送一封邮箱");
        }else{
            map.put("msg","我们已经发送一封邮箱");
        }
        return "emailsend";
    }
    //注册
    /**
     * 用户注册
     * @param user
     * @param session
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("/doRegister")
    public String doRegister(User user, HttpSession session, Map<String,Object> map, HttpServletRequest request){
        System.out.println("user = [" + user + "]");
       //将user保存在数据库中
        boolean success =userService.Register(user);
        if(success){
            //将用户保存在session中
            session.setAttribute("loginUser",user);
        }else{
            map.put("message","该账号已经被注册");
            return "forward:/toRegister";
        }
        return "main";
    }
    //登入
    @ResponseBody
    @RequestMapping("/doAJAXLogin")
    public Msg doAJAXLogin(User user, HttpSession session, HttpServletRequest request,
                           @RequestParam(value = "remeber_me",defaultValue = "0") String remeberme,
                           HttpServletResponse response){
        User dbUser =null;
        String msg="";
        Permission root=null;
        //是否存在该登入的账号
        dbUser=userService.IsHaveUserByAccountId(user.getLoginId());
        if (dbUser == null) {
            msg="不存在该账号";
        }else if (user!=null){
            boolean isMatch =userService.IdIsMatchPwd(user,dbUser);
            if(!isMatch){
                msg="登入密码错误";
            }else{
                //登入成功
                //是否勾选记住我
                /**
                 if(remeberme!=null&&remeberme.equals("1")){
                 //将auto_login_token保存
                 String token = UUID.randomUUID().toString();
                 userService.saveToken(dbUser.getId(),token);
                 //将token保存在cookie中
                 Cookie cookie = new Cookie("autologin_token", token);

                 cookie.setPath(request.getContextPath());
                 cookie.setMaxAge(3600*24*7);
                 //保存cookie
                 response.addCookie(cookie);
                 }
                 **/
                //获取该用户对应的权限信息,动态生成菜单
                List<Permission> permissions=permissionService.getPermissionByUserId(dbUser);
                Set<String> authorsurl=new HashSet<>();//保存用户权限的url
                Map<Integer, Permission> permissionMap = new HashMap<>();
                for (Permission permission : permissions) {
                    permissionMap.put(permission.getId(),permission);
                    if(permission.getUrl()!=null&&!"".equals(permission.getUrl())){
                        authorsurl.add(request.getContextPath()+permission.getUrl());
                    }
                }
                session.setAttribute("authorsurl",authorsurl);
                root = getPermission(root, permissions, permissionMap);

                //建立菜单之间的关系
                session.setAttribute("rootNode",root);
                session.setAttribute("loginUser",dbUser);
                return new Msg().success();
            }
        }
        return new Msg().fail().add("msg",msg);
    }
    //权限菜单
    private Permission getPermission(Permission root, List<Permission> permissions, Map<Integer, Permission> permissionMap) {
        for ( Permission p :permissions ) {
            Permission child = p;
            if ( child.getParent() == 0 ) {
                root=child;
            } else {
                Permission parent = permissionMap.get(child.getParent());
                parent.getChildren().add(child);
            }
        }
        return root;
    }
}
