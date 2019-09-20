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
<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">H+</h1>
        </div>
        <h3>忘记密码 H+</h3>
        <form action="${APP_PATH}/sendEmail" id="findpwd_form" method="post" role="form">

            <div class="form-group">
                <input type="email" class="form-control" id="email_input" name="email" placeholder="请输入邮箱" required="">
            </div>
            <button type="submit" onclick="javascript:findpwd();" class="btn btn-primary block full-width m-b">
                找回密码
            </button>

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
    function findpwd() {
        var email=$("#email_input").val().trim();
        if(email==""){
            layer.msg("不能为空，请输入", {time:2000, icon:5, shift:6}, function(){
            });
            return false;
        }else {

        }
    }
</script>