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
<style>
    body.modal-open {
        padding-right: 0 !important;
        overflow-y: scroll;
        padding-right: 0 !important;
    }
</style>
<body>
<!--添加模态框-->
<div class="modal fade" id="EditModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑用户</h4>
            </div>
            <div class="modal-body">
                <form id="myeditform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="loginId">email@example.com</p>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" id="userName" class="form-control" placeholder="账号">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-8">
                            <input type="text" name="age" class="form-control" id="userAge" placeholder="年龄">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control"
                                   id="userEmail" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-8">
                            <input type="email" name="phonenumber" class="form-control"
                                   id="phoneNumber" placeholder="电话">
                            <span class="help-block"></span>
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
<!-- 编辑模态框 -->
<div class="modal fade" id="AddModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">用户添加</h4>
            </div>
            <div class="modal-body">
                <form id="myaddform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-8">
                            <input type="text" name="loginId" id="loginId" class="form-control" placeholder="账号">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="username" id="userName" class="form-control" placeholder="账号">
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">年龄</label>
                        <div class="col-sm-8">
                            <input type="text" name="age" class="form-control" id="userAge" placeholder="年龄">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8">
                            <input type="email" name="email" class="form-control"
                                   id="userEmail" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-8">
                            <input type="email" name="phonenumber" class="form-control"
                                   id="phoneNumber" placeholder="电话">
                            <span class="help-block"></span>
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
        <br>
        <hr style="clear:both;">
        <table id="DataTables_Table_0_wrapper" class="table dataTables_wrapper form-inline   table-bordered" role="grid">
            <thead>
            <tr>
                <th>#</th>
                <th><input type="checkbox" id="check_all"></th>
                <th>新闻标题</th>
                <th>类型</th>
                <th>发布时间</th>
                <th>浏览量</th>
                <th>点赞人数</th>
                <th>发布人</th>
                <th>操作</th>
                <th>删除</th>
            </tr>
            </thead>

            <tbody id="tb"role="grid">

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
    </div>
    </div>
</div>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/style/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
<script>

    $(function () {
        //总记录数
        var totalpageo;
        //当前页
        var currentpage;
        //到第几页,默认到第一页
        to_page(1);
    });

    function to_page(pageno) {
        //加载完成之后,发送请求到服务器,拿到jason数据,构建列表数据
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/news/getnewspage",
            data: {
                "pageno": pageno,
                "pagesize": 11
            },
            beforeSend: function () {
                loadingIndex = layer.msg('加载列表中', {icon: 16});
            },
            success: function (data) {
                layer.close(loadingIndex);
                if (data.code == "100") {
                    //构建员工列表信息
                    build_user_table(data);
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
        $('.page_info-area').append("当前第" + page.pageNum + "页,共" + page.pages + "页,共" + page.total + "条记录")
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

    //构建员工列表
    function build_user_table(data) {
        //清空
        $("#tb").empty();
        var users = data.extend.page.list;
        $.each(users, function (index, item) {
            var CheckBox = $("<td></td>").append($("<input class='check_item' type='checkbox'/>"));
            var newIdTd = $("<td></td>").append(item.newsid);
            var newrTitleTd = $("<td></td>").append(item.newstitle);
            var newsType=$("<td></td>").append(item.newType.typeName);
            var newdateTd = $("<td></td>").append(new Date(item.newsdate).format("yyyy年MM月dd日 hh:mm:ss"));
            var dzTd = $("<td></td>").append(1);
            var newLookTd = $("<td></td>").append(item.newslooknum);
            var senduserTd= $("<td></td>").append(item.user.username);
            var editBtn = $("<button></button>").addClass("edit-btn btn btn btn-success btn-sm glyphicon glyphicon-pencil").append("编辑");
            var editTd = $("<td></td>").append(editBtn);
            var deleteBtn = $("<button></button>").addClass("delete-btn btn btn-danger btn-sm glyphicon glyphicon-trash").append("删除");
            var deleteTd = $("<td></td>").append(deleteBtn);
            var Tr = $('<tr></tr>')
                .append(newIdTd)
                .append(CheckBox)
                .append(newrTitleTd)
                .append(newsType)
                .append(newdateTd)
                .append(newLookTd)
                .append(dzTd)
                .append(senduserTd)
                .append(editTd)
                .append(deleteTd)
                .appendTo("#tb")
        })
    }

    //点击删除员工
    $("table").delegate(".delete-btn", "click", function () {

        var flag = confirm("是否要删除该新闻");
        if (!flag) {
            return false;
        }
        var url = "${APP_PATH}/news/deleteNew";
        var id = $(this).parent().parent().find("td").eq(0).text();
        var args = {"ids": id, "time:": new Date()};
        $.get(url, args, function (data) {
            if (data.code = "100") {
                layer.msg("删除成功", {time: 2000, icon: 6}, function () {
                    to_page(currentpage);
                });
            }
        })
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
            if (confirm("是否要删除[" + userNames + "]")) {
                //发请求批量删除
                var url = "${APP_PATH}/news/deleteNew";
                var args = {"ids": ids, "time:": new Date()};
                $.get(url, args, function (data) {
                    if (data.code = "100") {
                        to_page(currentpage);
                        layer.msg("删除成功", {time: 2000, icon: 6}, function () {

                        });
                    }
                })

            }
        } else {
            layer.msg("亲!,至少要选中一个", {time: 2000, icon: 5, shift: 6}, function () {
            });
        }
    })
    //编辑用户
    //编辑员工信息
    $("table").delegate(".edit-btn", "click", function () {
        //获取用户的表单字段
        getUserDetails($(this).parent().parent().find("td").eq(0).text());
        //弹出编辑模态框

        $("#EditModal").modal("show");

    });

    //回显员工信息
    function getUserDetails(id) {
        var url = "${APP_PATH}/user/editUser";
        $.get(url, {"id": id.trim(), "time": new Date()}, function (data) {
            var user = data.extend.user;
            console.log(user);
            $("#EditModal").find("#loginId").html(user.loginId);
            $("#EditModal").find("#userName").val(user.username);
            $("#EditModal").find("#userAge").val(user.age);
            $("#EditModal").find("#userEmail").val(user.email);
            $("#EditModal").find("#phoneNumber").val(user.phonenumber);
            $("#EditModal").find("#update-btn").attr("userid", id);
        })
    }

    //格式化时间
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1,
            "d+": this.getDate(),
            "h+": this.getHours(),
            "m+": this.getMinutes(),
            "s+": this.getSeconds(),
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds()
        }
        if (/(y+)/.test(format)) {
            format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }

        for (var k in o) {
            if (new RegExp("(" + k + ")").test(format)) {
                format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
            }
        }
        return format;
    }
    //点击更新
    $("#update-btn").click(function () {
        var url = "${APP_PATH}/user/updateUser";
        var args = $("#myeditform").serialize() + "&id=" + $(this).attr("userid") + "";
        args = args.trim();
        $.post(url, args, function (data) {
            //更新成功
            if (data.code == "100") {
                layer.msg("更新成功", {time: 2000, icon: 1}, function () {
                    $("#EditModal").modal("hide");
                    to_page(currentpage);
                });

            }
        })
    })
    //添加
    $("#user_save").click(function () {
        //重置表单的信息
        $('#myaddform')[0].reset();
        $("#AddModal").modal("show");
        return false;
    });
    //保存员工
    $(".save").click(function () {
        //验证添加用户
        var loginId = $("#AddModal").find("#loginId").val();
        var username = $("#AddModal").find("#userName").val();
        var userage = $("#AddModal").find("#userAge").val();
        var email = $("#AddModal").find("#email").val();
        var phonenumber = $("#AddModal").find("#phoneNumber").val();
        if (loginId == "") {
            layer.msg("用户登录账号不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {});
            return false;
        }
        if (username == "") {
            layer.msg("用户姓名不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {});
            return false;
        }
        if (userage == "") {
            layer.msg("年龄不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {});
            return false;
        }else{
            var rex=/^[1-9]([0-9])*$/;
            if(!rex.test(userage)){
                layer.msg("年龄不合法", {time: 2000, icon: 5, shift: 6}, function () {
                });
            }
        }
        if (email == "") {
            layer.msg("邮箱不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {
            });
            return false;
        }
        if (phonenumber == "") {
            layer.msg("电话号码不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {
            });
            return false;
        }
        var args = $("#myaddform").serialize();
        $.ajax({
            url: "${APP_PATH}/user/addUser",
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
                url: "${APP_PATH}/user/queryForUser",
                method: "GET",
                data: {
                    "keyword": keyword,
                    "pageNo": 1,
                    "pageSize": 8
                },
                beforeSend: function () {
                    loadingIndex = layer.msg('正在查询中', {time: 2000,icon: 16});
                },
                //var token = Session::token()
                success: function (data) {
                    layer.close(loadingIndex);
                    //构建员工列表信息
                    build_user_table(data);
                    //构建分页信息
                    build_page_nav(data);
                }
            });
        }

    })
    //点击分配
    $("body").delegate(".assBtn", "click", function () {

        window.location.href="${APP_PATH}/user/assign?id="+$(this).parent().parent().find("td").eq(0).text()+"";
        return false;
    });
</script>
