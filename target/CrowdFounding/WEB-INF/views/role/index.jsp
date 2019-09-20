<%@page pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
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
            cursor: pointer;
        }

        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #303030;
            font-size: 13px;
        }

        body.modal-open {
            padding-right: 0 !important;
            overflow-y: scroll;
            padding-right: 0 !important;
        }
    </style>

</head>
<body>
<!--编辑模态框-->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑角色</h4>
            </div>
            <div class="modal-body">
                <form id="myeditform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">角色名</label>
                        <div class="col-sm-8">
                            <input type="text" name="rolename" id="roleName" class="form-control" placeholder="账号">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">角色描述</label>
                        <div class="col-sm-8">
                            <textarea type="text" name="roledesc" id="desc" class="form-control" cols="30" rows="10"
                                      placeholder="账号"></textarea>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-danger" id="update-btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!--添加-->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">角色添加</h4>
            </div>
            <div class="modal-body">
                <form id="myaddform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">角色名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="rolename" id="roleName" class="form-control" placeholder="角色名称">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">角色介绍</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name="roledesc" id="desc" cols="30" rows="10"
                                      placeholder="角色功能介绍"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary save">保存</button>
            </div>
        </div>
    </div>
</div>
<!--授权模态框-->
<div class="modal fade" id="AssginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">角色赋予权限</h4>
            </div>
            <div class="modal-body">
                <div class="panel panel-default">

                    <div class="panel-body">

                        <ul id="permissionTree" class="ztree"></ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" id="doAssign">分配许可</button>
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
        <div class="panel-body">
            <form class="form-inline" role="form" style="float:left;">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <div class="input-group-addon">查询条件</div>
                        <input id="queryText" class="form-control has-success" type="text"
                               placeholder="请输入角色名称">
                    </div>
                </div>
                <button id="queryBtn" type="button" class="btn btn-warning"><i
                        class="glyphicon glyphicon-search"></i> 查询
                </button>
            </form>
            <button type="button" class="btn btn-danger" id="delete_all"
                    style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除
            </button>
            <button type="button" id="role_save" class="btn btn-primary" style="float:right;"><i
                    class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <form id="roleForm">
                    <table class="table  table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th><input type="checkbox" id="check_all"></th>
                            <th>角色名称</th>
                            <th width="450">角色介绍</th>
                            <th>操作</th>
                            <th>删除</th>
                            <th >分配权限</th>
                        </tr>
                        </thead>

                        <tbody id="tb">

                        </tbody>

                        <tfoot>
                        <tr>
                            <td colspan="9" align="center">

                                <span class="page_info-area"></span>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">

                                    </ul>
                                </nav>

                            </td>
                        </tr>

                        </tfoot>
                    </table>
                </form>
            </div>
        </div>

    </div>
</div>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/style/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
<script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
</body>
</html>
<script>
    $(function () {
        //总记录数
        var totalpageo;
        //当前页
        var currentpage = 1;
        //到第几页,默认到第一页
        to_page(currentpage);
        //弹出模态框加载树
        $("table").delegate("#goAssignPage", "click", function () {
            //弹出模态框
            var setting = {
                async: {
                    enable: true,
                    url:"${APP_PATH}/permission/loadAssignData?roleid="+$(this).attr("roleid")+"",
                    autoParam:["id", "name=n", "level=lv"]
                },
                check : {
                    enable : true
                },
                view: {
                    selectedMulti: false,
                    addDiyDom: function(treeId, treeNode){
                        var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                        if ( treeNode.icon ) {
                            icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
                        }

                    },
                }
            };
            $.fn.zTree.init($("#permissionTree"), setting);
            //分配权限
            $("#doAssign").attr("roleid",$(this).attr("roleid"));
            $("#AssginModal").modal("show");
        });
        //确认分配全权限
        //分配权限
        $("#doAssign").click(function () {
            doAssign();
        })
        function doAssign() {
            var treeObj = $.fn.zTree.getZTreeObj("permissionTree");
            var nodes = treeObj.getCheckedNodes(true);
            if ( nodes.length == 0 ) {
                layer.msg("请选择需要分配的许可信息", {time:2000, icon:5, shift:6}, function(){

                });
            } else {
                var d = "roleid="+$("#doAssign").attr("roleid")+"";
                $.each(nodes, function(i, node){
                    d += "&permissionids="+node.id
                });
                $.ajax({
                    type : "POST",
                    url  : "${APP_PATH}/role/doAssign",
                    data : d,
                    success : function (result) {
                        if (result.code=="100") {
                            $("#AssginModal").modal("hide");
                            layer.msg("分配权限信息成功", {time:2000, icon:6}, function(){

                            });
                        } else {
                            layer.msg("分配权限信息失败", {time:2000, icon:5, shift:6}, function(){
                            });
                        }
                    }
                });
            }
        }
        //去第页
        function to_page(pageno) {
            //加载完成之后,发送请求到服务器,拿到jason数据,构建列表数据
            $.ajax({
                type: "GET",
                url: "${APP_PATH}/role/getpage",
                data: {
                    "pageNo": pageno,
                    "pageSize": 10
                },
                beforeSend: function () {
                    loadingIndex = layer.msg('加载列表中', {icon: 16});
                },
                success: function (data) {
                    layer.close(loadingIndex);
                    if (data.code == "100") {
                        //构建员工列表信息
                        build_role_table(data);
                        //构建分页信息
                        build_page_nav(data);
                    } else {
                        layer.msg(data.extend.msg, {time: 2000, icon: 5, shift: 6}, function () {

                        });
                    }
                }
            });


        }
        //构建分页导航
        function build_page_nav(data) {
            var page = data.extend.page;
            //设置当前页
            currentpage = page.pageNum;
            //设置末页
            totalpageo = page.pages;
            $('.page_info-area').empty();
            $(".pagination").empty();
            $('.page_info-area').append("当前第" + page.pageNum + "页,共" + page.pages + "页,共" + page.total + "条记录");
            //分页导航
            var nav = $(".pagination");
            var firstLi = $("<li></li>").append($("<a>首页</a>").attr("href", "#"));
            var prli = $("<li></li>").append($("<a  aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>").attr("href", "#"));
            //首页
            firstLi.click(function () {
                to_page(1);
            });
            //上一页
            prli.click(function () {
                var target = page.pageNum - 1;
                target = target == 0 ? 1 : target;
                to_page(target);
            })
            var lastLi = $("<li></li>").append($("<a>末页</a>").attr("href", "#"));
            var nextli = $("<li></li>").append($("<a  aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>").attr("href", "#"));
            //末页
            lastLi.click(function () {
                //alert("转到:"+page.pages)
                to_page(page.pages);
            })
            //下一页
            nextli.click(function () {
                var target = page.pageNum + 1;
                target = target < page.pages ? target : page.pages;
                to_page(target);
            })
            nav.append(firstLi).append(prli);
            $.each(data.extend.page.navigatepageNums, function (index, item) {
                var li = $("<li></li>").append($("<a>" + item + "</a>").attr("href", "#"));
                if (data.extend.page.pageNum == item) {
                    li.addClass("active");
                }
                //点击翻页
                li.click(function () {
                    $(".pagination>li").removeClass("active");
                    $(this).addClass("active");
                    to_page(item);
                    return false;
                })
                nav.append(li);
            })
            nav.append(nextli).append(lastLi);

        }
        //构建列表
        function build_role_table(data) {
            //清空
            $("#tb").empty();
            var users = data.extend.page.list;
            $.each(users, function (index, item) {
                var CheckBox = $("<td></td>").append($("<input class='check_item' type='checkbox'/>"));
                var roleIdTd = $("<td></td>").append(item.id);
                var roleNameTd = $("<td></td>").append($("<span class='glyphicon glyphicon-user'></span>")).append(item.rolename);
                var roleDescTd = $("<td></td>").append(item.roledesc);
                var editBtn = $("<button></button>").addClass("btn btn btn-success btn-sm edit_role glyphicon glyphicon-pencil").append("编辑");
                var editTd = $("<td></td>").append(editBtn);
                var deleteBtn = $("<button type='button' ></button>").addClass(" btn btn-danger btn-sm delete_role glyphicon glyphicon-trash").append("删除");
                var deleteTd = $("<td></td>").append(deleteBtn);
                var assginBtn = $("<button type='button' roleid=" + item.id + "  id='goAssignPage'></button>").addClass("btn btn btn-primary btn-sm  glyphicon glyphicon-wrench").append("授权");
                var assginTr = $("<td></td>").append(assginBtn);
                var Tr = $('<tr></tr>')
                    .append(roleIdTd)
                    .append(CheckBox)
                    .append(roleNameTd)
                    .append(roleDescTd)
                    .append(editTd)
                    .append(deleteTd)
                    .append(assginTr)
                    .appendTo("#tb");
            })
        }
        //点击删除员工
        $("table").delegate(".delete_role", "click", function () {
            var flag = confirm("是否要删除该角色?,关联用户将失去该角色.");
            if (!flag) {
                return false;
            } else {
                var ids = $(this).parent().parent().find("td").eq(0).text().trim();
                var url = "${APP_PATH}/role/deleteRole";
                var args = {"ids": ids, "time:": new Date()};
                $.get(url, args, function (data) {
                    if (data.code = "100") {
                        layer.msg("删除成功", {time: 2000, icon: 1, shift: 2}, function () {
                            to_page(currentpage);
                        });
                    }
                })
            }

            return false;
        });
        //全选和全不选
        $("#check_all").click(function () {
            $(".check_item").prop("checked", $(this).prop("checked"));
        })
        //checked_item全部选中的时候,全选需要勾上
        $("table").delegate(".check_item", "click", function () {
            var len = $(".check_item:checked").length;
            if (len == $(".check_item").length) {
                $("#check_all").prop("checked", "checked");
            } else {
                $("#check_all").prop("checked", "");
            }
        });
        //点击批量删除
        $("#delete_all").click(function () {
            var ids = "";
            var userNames = "";
            $(".check_item:checked").each(function () {
                userNames += $(this).parent().parent().find("td").eq(3).text() + ",";
                ids += $(this).parent().parent().find("td").eq(0).text() + "-";
            })
            userNames = userNames.substring(0, userNames.length - 1);
            ids = ids.substring(0, ids.length - 1);
            if (ids != "") {
                if (confirm("是否要删除该角色[" + userNames + "],关联用户将失去该角色")) {
                    //发请求批量删除
                    var url = "${APP_PATH}/role/deleteRole";
                    var args = {"ids": ids, "time:": new Date()};
                    $.get(url, args, function (data) {
                        if (data.code == "100") {
                            layer.msg("删除成功", {time: 2000, icon: 6, shift: 4}, function () {
                                to_page(currentpage);
                            });
                        }
                    })

                }
            } else {
                layer.msg("亲!,至少要选中一个", {time: 2000, icon: 5, shift: 6}, function () {
                });
            }
        })
        //编辑
        $("table").delegate(".edit_role", "click", function () {
            //弹出编辑模态框
            $("#EditModal").modal("show");
            //获取用户的表单字段
            //
            getRoleDetails($(this).parent().parent().find("td").eq(0).text());
            return false;
        });

        //回显信息
        function getRoleDetails(id) {
            var url = "${APP_PATH}/role/editRole";
            $.get(url, {"id": id.trim(), "time": new Date()}, function (data) {
                var role = data.extend.role;
                $("#EditModal").find("#roleName").val(role.rolename);
                $("#EditModal").find("#desc").val(role.roledesc);
                $("#update-btn").attr("roleid", id);
            })
        }

        //点击更新
        $("#update-btn").click(function () {
            var url = "${APP_PATH}/role/updateRole";
            var args = $("#myeditform").serialize() + "&id=" + $(this).attr("roleid") + "";
            args = args.trim();
            $.post(url, args, function (data) {
                //更新成功
                if (data.code == "100") {
                    layer.msg("更新成功", {time: 500, icon: 1, shift: 0}, function () {
                        $("#EditModal").modal("hide");
                        to_page(currentpage);
                    });

                } else {
                    layer.msg("更新失败", {time: 2000, icon: 0, shift: 6}, function () {
                        $("#EditModal").modal("hide");
                        to_page(currentpage);
                    });
                }
            })
        })
        //添加
        $("#role_save").click(function () {
            //重置表单的信息
            $('#myaddform')[0].reset();
            $("#AddModal").modal("show");
            return false;
        });
        //保存
        $(".save").click(function () {
            //验证添加用户
            var loginId = $("#AddModal").find("#roleName").val();
            var username = $("#AddModal").find("#desc").val();
            if (loginId == "") {
                layer.msg("角色的名称您还没有填写", {time: 2000, icon: 5, shift: 6}, function () {

                });
                return false;
            }
            if (username == "") {
                layer.msg("请输入角色的描述信息", {time: 2000, icon: 5, shift: 6}, function () {
                });
                return false;
            }
            var args = $("#myaddform").serialize();
            $.ajax({
                url: "${APP_PATH}/role/addRole",
                method: "POST",
                data: args,
                //var token = Session::token()
                success: function (data) {
                    //关闭模态框
                    layer.msg("添加成功", {time: 1000, icon: 6}, function () {
                        $("#AddModal").modal("hide");
                        //到最后一页显示刚刚添加的员工
                        to_page(totalpageo);
                    });
                }
            });
            return false;
        });
        //模糊查询
        $("#queryBtn").click(function () {
            var keyword = $("#queryText").val();
            //alert(keyword);
            if (keyword.trim() != "") {
                $.ajax({
                    url: "${APP_PATH}/role/queryForRole",
                    method: "GET",
                    data: {
                        "keyword": keyword,
                        "pageNo": 1,
                        "pageSize": 8
                    },
                    beforeSend: function () {
                        loadingIndex = layer.msg('正在查询中', {time: 2000, icon: 16});
                    },
                    //var token = Session::token()
                    success: function (data) {
                        layer.close(loadingIndex);
                        //构建员工列表信息
                        build_role_table(data);
                        //构建分页信息
                        build_page_nav(data);
                    }
                });
            }

        })

    });

</script>
