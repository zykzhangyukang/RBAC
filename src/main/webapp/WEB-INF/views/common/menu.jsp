<%@page pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${APP_PATH}/style/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
<link href="${APP_PATH}/style/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
<!-- Morris -->
<link href="${APP_PATH}/style/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">
<!-- Gritter -->
<link href="${APP_PATH}/style/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
<link href="${APP_PATH}/style/css/animate.css" rel="stylesheet">
<link href="${APP_PATH}/style/css/style.css?v=2.2.0" rel="stylesheet">
<ul class="nav" id="side-menu">
    <li class="nav-header">

		<div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" width="64" src="${APP_PATH}/style/img/1559739096427.jpg"/>
                             </span>
			<a data-toggle="dropdown" class="dropdown-toggle" href="">
                                <span class="clear"> <span class="block m-t-xs"> <strong
										class="font-bold">${sessionScope.loginUser.username}</strong>
                             </span> <span class="text-muted text-xs block">超级管理员 <b class="caret"></b></span> </span>
			</a>
			<ul class="dropdown-menu animated fadeInRight m-t-xs">
				<li><a href="form_avatar.html">修改头像</a>
				</li>
				<li><a href="profile.html">个人资料</a>
				</li>
				<li><a href="contacts.html">联系我们</a>
				</li>
				<li><a href="mailbox.html">信箱</a>
				</li>
				<li class="divider"></li>
				<li><a href="${APP_PATH}/logout">安全退出</a>
				</li>
			</ul>
		</div>
		<div class="logo-element">
			H+
		</div>

	</li>

	<c:forEach items="${rootNode.children}" var="permission">
		<li>
			<a href="${APP_PATH}${permission.url}"><i class="${permission.icon}"></i>
				<span class="nav-label">${permission.name}</span><span class="badge" style="float:right">${permission.children.size()}</span></a>
			<ul class="nav nav-second-level">
				<c:forEach items="${permission.children}" var="child">
					<li><a href="${APP_PATH}${child.url}">${child.name}</a>
					</li>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>

<script src="${APP_PATH}/style/js/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/style/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${APP_PATH}/style/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${APP_PATH}/style/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Custom and plugin javascript -->
<script src="${APP_PATH}/style/js/hplus.js?v=2.2.0"></script>
<script src="${APP_PATH}/style/js/plugins/pace/pace.min.js"></script>
