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
      <link rel="stylesheet" href="${APP_PATH}/ztree/zTreeStyle.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
    /*
      .ztree li span.button.ico_docu {margin-right:2px; background-position: -110px -32px; vertical-align:top; *vertical-align:middle}
      加载bootstrap的图标，使用它的叶子图标-2015-12-23*/
	table tbody tr:nth-child(odd){background:#F4F4F4;}
    table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>
  <body>
    <!--许可修改信息-->
    <div class="modal fade" id="EditPermission" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="exampleInputPassword1">许可名称</label>
                            <input type="text" class="form-control" id="permissionname" placeholder="请输入许可名称">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">链接地址</label>
                            <input type="text" class="form-control"  id="url" placeholder="请输入链接地址">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">菜单图标</label>
                            <input type="text" class="form-control"  id="icon" placeholder="菜单图标">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button id="updateBtn" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i> 修改</button>
                    <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <!--许可添加模态框-->
    <div class="modal fade" id="AddPermission" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Modal title</h4>
                </div>
                <div class="modal-body">
                    <form role="form">
                        <div class="form-group">
                            <label for="exampleInputPassword1">许可名称</label>
                            <input type="text" class="form-control" id="permissionname" placeholder="请输入许可名称">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">链接地址</label>
                            <input type="text" class="form-control" id="url" placeholder="请输入链接地址">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">菜单图标</label>
                            <input type="text" class="form-control" id="icon" placeholder="请输入菜单图标">
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button id="insertBtn" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <button type="button" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <jsp:include page="../common/menu.jsp"></jsp:include>
        </nav>
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <jsp:include page="../common/top_nav.jsp"></jsp:include>
            </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                    </div>
                    <br>
                    <div class="panel-body">
                        <ul id="permissionTree" class="ztree"></ul>
                    </div>
                </div>
        </div>
    </div>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>
    <script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
    <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            var setting = {
                async: {
                    enable: true,
                    url:"${APP_PATH}/permission/loadData",
                    autoParam:["id", "name=n", "level=lv"]
                },
                view: {
                    selectedMulti: false,
                    addDiyDom: function(treeId, treeNode){
                        var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                        if ( treeNode.icon ) {
                            icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
                        }

                    },
                    addHoverDom: function(treeId, treeNode){
                        //   <a><span></span></a>
                        var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                        aObj.attr("href", "javascript:;");
                        if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
                        var s = '<span id="btnGroup'+treeNode.tId+'">';
                        if ( treeNode.level == 0 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                        } else if ( treeNode.level == 1 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                            if (treeNode.children.length == 0) {
                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                            }
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                        } else if ( treeNode.level == 2 ) {
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                            s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                        }

                        s += '</span>';
                        aObj.after(s);
                    },
                    removeHoverDom: function(treeId, treeNode){
                        $("#btnGroup"+treeNode.tId).remove();
                    }
                }
            };
            $.fn.zTree.init($("#permissionTree"), setting);
            //添加许可信息
            function addNode(id) {
                $("#AddPermission").modal("show");
                $("#insertBtn").attr("parentid",id);
            	//window.location.href = "${APP_PATH}/permission/add?id="+id;
            }
            $("#insertBtn").click(function(){
                var permissionname = $("#AddPermission").find("#permissionname").val();
                if ( permissionname == "" ) {
                    alert(permissionname);
                    layer.msg("许可名称不能为空，请输入", {time:2000, icon:5, shift:6}, function(){

                    });
                    return;
                }

                var loadingIndex = null;
                $.ajax({
                    type : "POST",
                    url  : "${APP_PATH}/permission/insert",
                    data : {
                        "name" : permissionname,
                        "url"  : $("#AddPermission").find("#url").val(),
                        "icon" :$("#AddPermission").find("#icon").val(),
                        "parent"  : $("#insertBtn").attr("parentid")
                    },
                    beforeSend : function() {
                        loadingIndex = layer.msg('处理中', {icon: 16});
                    },
                    success : function(result) {
                        layer.close(loadingIndex);
                        if ( result.code="100" ) {
                            layer.msg("许可信息保存成功", {time:1000, icon:6}, function(){
                                window.location.href = "${APP_PATH}/permission/index";
                            });
                        } else {
                            layer.msg("许可信息保存失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                            });
                        }
                    }
                });
            });
            function editNode(id) {
                $.get("${APP_PATH}/permission/edit",{"id":id,"time":new Date()},function (data) {
                    if(data.code="100"){
                        $("#permissionname").val(data.extend.permission.name);
                        $("#url").val(data.extend.permission.url);
                        $("#icon").val(data.extend.permission.icon);
                        $("#updateBtn").attr("permissionid",id);
                    }else {
                        layer.msg("请求失败", {time:2000, icon:5, shift:6}, function(){

                        });
                    }
                })
                $("#EditPermission").modal("show");
                //window.location.href = "${APP_PATH}/permission/edit?id="+id;
            }
            function deleteNode(id) {
    			layer.confirm("删除许可信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
    				// 删除选择的用户信息
    				$.ajax({
    					type : "POST",
    					url  : "${APP_PATH}/permission/delete",
    					data : {
    						id : id
    					},
    					success : function(result) {
    						if ( result.code="100" ) {
                                // 刷新数据
    							var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
                                // 异步获取树形结构数据
                               treeObj.reAsyncChildNodes(null, "refresh");
    						} else {
                                layer.msg("许可信息删除失败", {time:2000, icon:5, shift:6}, function(){
                                	
                                });
    						}
    					}
    				});
    				
    				layer.close(cindex);
    			}, function(cindex){
    			    layer.close(cindex);
    			});
            }
            //刷新当前节点
            function rereshNode(id){
                var treeObj = $.fn.zTree.getZTreeObj("tree");
                var nownode = treeObj.getNodesByParam("id", id);
                treeObj.reAsyncChildNodes(nownode[0], "refresh");
            }
            $("#updateBtn").click(function(){
                var permissionname = $("#EditPermission").find("#permissionname").val();
                if ( permissionname == "" ) {
                    layer.msg("许可名称不能为空，请输入", {time:2000, icon:5, shift:6}, function(){

                    });
                    return;
                }

                var loadingIndex = null;
                $.ajax({
                    type : "POST",
                    url  : "${APP_PATH}/permission/update",
                    data : {
                        "name" : permissionname,
                        "url"  :  $("#EditPermission").find("#url").val(),
                        "icon": $("#EditPermission").find("#icon").val(),
                        "id"  : $("#updateBtn").attr("permissionid")
                    },
                    beforeSend : function() {
                        loadingIndex = layer.msg('处理中', {icon: 16});
                    },
                    success : function(result) {
                        layer.close(loadingIndex);
                        if ( result.code="100" ) {
                            $("#EditPermission").modal("hide");
                            layer.msg("许可信息修改成功", {time:1000, icon:6}, function(){
                                var setting = {
                                    async: {
                                        enable: true,
                                        url:"${APP_PATH}/permission/loadData",
                                        autoParam:["id", "name=n", "level=lv"]
                                    },
                                    view: {
                                        selectedMulti: false,
                                        addDiyDom: function(treeId, treeNode){
                                            var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                                            if ( treeNode.icon ) {
                                                icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
                                            }

                                        },
                                        addHoverDom: function(treeId, treeNode){
                                            //   <a><span></span></a>
                                            var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                                            aObj.attr("href", "javascript:;");
                                            if (treeNode.editNameFlag || $("#btnGroup"+treeNode.tId).length>0) return;
                                            var s = '<span id="btnGroup'+treeNode.tId+'">';
                                            if ( treeNode.level == 0 ) {
                                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                                            } else if ( treeNode.level == 1 ) {
                                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                                                if (treeNode.children.length == 0) {
                                                    s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                                                }
                                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="addNode('+treeNode.id+')" href="#" >&nbsp;&nbsp;<i class="fa fa-fw fa-plus rbg "></i></a>';
                                            } else if ( treeNode.level == 2 ) {
                                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;"  onclick="editNode('+treeNode.id+')" href="#" title="修改权限信息">&nbsp;&nbsp;<i class="fa fa-fw fa-edit rbg "></i></a>';
                                                s += '<a class="btn btn-info dropdown-toggle btn-xs" style="margin-left:10px;padding-top:0px;" onclick="deleteNode('+treeNode.id+')" href="#">&nbsp;&nbsp;<i class="fa fa-fw fa-times rbg "></i></a>';
                                            }

                                            s += '</span>';
                                            aObj.after(s);
                                        },
                                        removeHoverDom: function(treeId, treeNode){
                                            $("#btnGroup"+treeNode.tId).remove();
                                        }
                                    }
                                };
                                $.fn.zTree.init($("#permissionTree"), setting);
                            });
                        } else {
                            layer.msg("许可信息修改失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                            });
                        }
                    }
                });
            });
        </script>
  </body>
</html>
