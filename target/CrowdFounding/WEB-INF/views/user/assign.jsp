<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
  </head>
  <body>
  <div id="wrapper">
	  <nav class="navbar-default navbar-static-side" role="navigation">
		  <jsp:include page="../common/menu.jsp"></jsp:include>
	  </nav>
	  <div id="page-wrapper" class="gray-bg dashbard-1">
		  <div class="row border-bottom">
			  <jsp:include page="../common/top_nav.jsp"></jsp:include>
		  </div>
		  <ol class="breadcrumb">
				  <li><a href="${APP_PATH}/user/index">首页</a></li>
				  <li><a href="${APP_PATH}/user/index">数据列表</a></li>
				  <li class="active">分配角色</li>
			  </ol>
		  <div class="panel panel-default text-center" >
				  <div class="panel-body">
					  <form id="roleForm" role="form" class="form-inline">
						  <input type="hidden" name="id" value="${param.id}">
						  <div class="form-group">
							  <label for="exampleInputPassword1">未分配角色列表</label><br>
							  <select id="leftList" name="unassignroleids" class="form-control" multiple size="20" style="width:200px;overflow-y:auto;">
								  <c:forEach items="${requestScope.unHaveRoles}" var="role">
									  <<option value="${role.id}">${role.rolename}</option>
								  </c:forEach>
							  </select>
						  </div>
						  <div class="form-group">
							  <ul>
								  <li id="left2RightBtn" class="btn btn-default glyphicon glyphicon-arrow-right"></li>
								  <br>
								  <li id="right2LeftBtn" class="btn btn-default glyphicon glyphicon glyphicon-arrow-left" style="margin-top:20px;"></li>
							  </ul>
						  </div>
						  <div class="form-group" style="margin-left:40px;">
							  <label for="exampleInputPassword1">已分配角色列表</label><br>
							  <select id="rightList" name="assignroleids" class="form-control" multiple size="20"  style="width:200px;overflow-y:auto;">
								  <c:forEach items="${requestScope.Alroles}" var="role">
									  <<option value="${role.id}">${role.rolename}</option>
								  </c:forEach>
							  </select>
						  </div>
					  </form>
				  </div>
			  </div>

	  </div>
  </div>

  <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
  <script src="${APP_PATH}/layer/layer.js"></script>
  <script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript">
    $("#left2RightBtn").click(function(){
        var opts = $("#leftList :selected");
        if ( opts.length == 0 ) {
            layer.msg("请选择需要分配的角色数据", {time:2000, icon:5, shift:6}, function(){

            });
        } else {
            $.ajax({
                type : "POST",
                url  : "${APP_PATH}/user/doAssign",
                data : $("#roleForm").serialize(),
                beforeSend : function(){
                    loadingIndex = layer.msg('处理中', {icon: 16});
                },
                success : function(result) {
                    if ( result.code="100" ) {
                        $("#rightList").append(opts);
                        layer.msg("分配角色数据成功", { time:2000, icon:6}, function(){
                        });
                    } else {
                        layer.msg("分配角色数据失败", {time:2000, icon:6, shift:6}, function(){
                        });
                    }
                }
            });
        }
    });
    $("#right2LeftBtn").click(function(){
                var opts = $("#rightList :selected");
                if ( opts.length == 0 ) {
                    layer.msg("请选择需要取消分配的角色数据", {time:2000, icon:5, shift:5}, function(){

                    });
                } else {
                    $.ajax({
                        type : "POST",
                        url  : "${APP_PATH}/user/dounAssign",
                        data : $("#roleForm").serialize(),
                        beforeSend : function(){
                            loadingIndex = layer.msg('处理中', {icon: 16});
                        },
                        success : function(result) {
                            if ( result.code="100" ) {
                                $("#leftList").append(opts);
                                layer.msg("取消分配角色数据成功", {time:2000, icon:6}, function(){
                                });
                            } else {
                                layer.msg("取消分配角色数据失败", {time:2000, icon:5, shift:6}, function(){
                                });
                            }
                        }
                    });

                }
            });

</script>
  </body>
</html>
