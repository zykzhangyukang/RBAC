package com.atzhang.crowdfounding.web;

import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.html.HTMLHtmlElement;
import sun.misc.Request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 权限拦截器
 */
public class AuthorityInterceptor implements HandlerInterceptor {
    @Autowired
    private PermissionService permissionService;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String path = httpServletRequest.getContextPath();
        HttpSession session = httpServletRequest.getSession();
        //用户访问的url
        String url = httpServletRequest.getRequestURI();
        //判断url是否需要权限验证
        List<Permission> allPerission = permissionService.getAllPerission();
        Set<String> allurls=new HashSet<>();//所有需要权限验证的路径
        for(Permission p:allPerission){
            if(p.getUrl()!=null&&!"".equals(p.getUrl())){
                allurls.add(path+p.getUrl());
            }
        }
        if(allurls.contains(url)){
            //需要权限验正,拿到用户的所有权限的url
            Set<String> authorsurl = (Set<String>) session.getAttribute("authorsurl");
            if(authorsurl.contains(url)){
                //权限验证成功
                return true;
            }else {
                httpServletResponse.sendRedirect(path+"/error");
                return false;
            }
        }else{
            //不需要权限验证
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
