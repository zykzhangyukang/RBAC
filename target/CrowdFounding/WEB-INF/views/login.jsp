<%@ page import="com.atzhang.crowdfounding.beans.User" %>
<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登入页面</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link href="style/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="style/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="style/css/animate.css" rel="stylesheet">
    <link href="style/css/style.css?v=2.2.0" rel="stylesheet">
</head>
<%--
    Cookie[] cookies = request.getCookies();
    for (int i=0;i<cookies.length;i++){
        if("autologin_token".equals(cookies[i].getName())) {
            String token = cookies[i].getValue();
            User user = (User) session.getServletContext().getAttribute("AutoLoginUser");
            if(user!=null){
                session.setAttribute("loginUser",user);
                request.getRequestDispatcher( "/WEB-INF/views/main.jsp").forward(request,response);
            }else{

            }

        }
    }
--%>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">H+</h1>
        </div>
        <h3>欢迎使用 H+</h3>
        <h4>${msg}</h4>
        <form class="m-t" id="loginForm" role="form">
            <div class="form-group">
                <input type="username" id="loginacct" name="loginacct" class="form-control" placeholder="账号" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="userpswd" name="userpswd" placeholder="密码" required="">
            </div>
            <div class="form-group text-left">
                <input type="checkbox" id="remeber_me" name="remeber_me" value="1">记住我
            </div>
            <button type="button" onclick="javascript:dologin();" class="btn btn-primary block full-width m-b">
               登录
            </button>


            <p class="text-muted text-center">
                <a href="${APP_PATH}/fgtpwd">
                <small>忘记密码了？
                </small>
            </a>
                | <a href="${APP_PATH}/toRegister">注册一个新账号</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>
</body>
</html>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/js/common.js"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
<script>
    function dologin() {
        // 非空校验
        var loginacct= $("#loginacct").val();
        // 表单元素的value取值不会为null, 取值是空字符串
        if ( loginacct == "" ) {
            //alert("用户登录账号不能为空，请输入");
            layer.msg("用户登录账号不能为空，请输入", {time:2000, icon:5, shift:6}, function(){

            });
            return;
        }

        var userpswd = $("#userpswd").val();
        if ( userpswd == "" ) {
            //alert("用户登录密码不能为空，请输入");
            layer.msg("用户登录密码不能为空，请输入", {time:2000, icon:5, shift:6}, function(){

            });
            return;
        }

        // 提交表单
        //alert("提交表单");
        //$("#loginForm").submit();
        // 使用AJAX提交数据
        var loadingIndex = null;
        $.ajax({
            type : "POST",
            url  : "${APP_PATH}/doAJAXLogin",
            data : {
                "loginId" : loginacct,
                "password"  : userpswd,
                "remeber_me":$("#remeber_me").val()
            },
            beforeSend : function(){
                loadingIndex = layer.msg('处理中', {time:2000,icon: 16});
            },
            success : function(data) {
                layer.close(loadingIndex);
                if (data.code=="100") {
                    window.location.href = "main";
                } else {
                    layer.msg(data.extend.msg, {time:1000, icon:5, shift:6}, function(){

                    });
                }
            }
        });
        return false;
    }
</script>
