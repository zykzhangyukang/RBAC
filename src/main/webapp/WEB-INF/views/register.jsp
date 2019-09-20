<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">
    <title>注册</title>
    <link href="style/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="style/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="style/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="style/css/animate.css" rel="stylesheet">
    <link href="style/css/style.css?v=2.2.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
        </div>
        <h3>欢迎注册 H+</h3>
        <p>创建一个H+新账户${message}</p>
        <form class="m-t" role="form" action="${APP_PATH}/doRegister" METHOD="post">
            <div class="form-group">
                <input type="text" name="username" class="form-control" placeholder="用户名" required="">
            </div>
            <div class="form-group">
                <input type="text" name="loginId" id="loginacct" class="form-control" placeholder="请输入账号" required="">
            </div>
            <div class="form-group">
                <input type="password" name="password" id="userpswd"  class="form-control" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="email" name="email" id="useremail"  class="form-control" placeholder="请输入邮箱" required="">
            </div>
            <div class="form-group">
                <input type="tel" name="phonenumber" id=""  class="form-control" placeholder="请输入电话号码" required="">
            </div>
            <div class="form-group">
                <input type="number" name="age" id=""  class="form-control" placeholder="请输入年龄" required="">
            </div>

            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding">
                        <input type="checkbox"><i></i> 我同意注册协议</label>
                </div>
            </div>
            <button type="submit"  class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.html">点此登录</a>
            </p>

        </form>
    </div>
</div>
<!-- Mainly scripts -->
<script src="style/js/jquery-2.1.1.min.js"></script>
<script src="style/js/bootstrap.min.js?v=3.4.0"></script>
<!-- iCheck -->
<script src="style/js/plugins/iCheck/icheck.min.js"></script>
</body>
</html>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

</script>
