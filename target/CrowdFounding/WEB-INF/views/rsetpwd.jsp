<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>重置密码</title>
</head>
<body>
    重置密码页面
    <form action="${APP_PATH}/doRsetPwd" method="post">
        <input type="hidden" name="token" value="${param.token}">
        <input type="password" name="newpwd"/>
        <input type="submit" value="重置"/>
    </form>
</body>
</html>
