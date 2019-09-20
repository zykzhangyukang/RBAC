<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>资质维护</title>
</head>
<style>
    body.modal-open {
        padding-right: 0 !important;
        overflow-y: scroll;
        padding-right: 0 !important;
    }
</style>

<body>
<div class="modal fade" id="AddCertModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form id="myaddform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">资质名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="name" id="certname" class="form-control" placeholder="资质名称">
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary saveCert">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="UpdateCertModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form id="myeditform" class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">资质名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="name" id="certname" class="form-control" placeholder="资质名称">
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button"  class="btn btn-primary updatCertbtn">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <jsp:include page="common/menu.jsp"></jsp:include>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <jsp:include page="common/top_nav.jsp"></jsp:include>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 资质维护</h3>
            </div>
            <div class="panel-body">
                <form class="form-inline" role="form" style="float:left;">
                    <div class="form-group has-feedback">
                        <div class="input-group">
                            <div class="input-group-addon">查询条件</div>
                            <input id="queryText" class="form-control has-success" type="text"
                                   placeholder="请输入查询条件">
                        </div>
                    </div>
                    <button id="queryBtn" type="button" class="btn btn-warning"><i
                            class="glyphicon glyphicon-search"></i> 查询
                    </button>
                </form>
                <button type="button" class="btn btn-danger" id="delete_all" style="float:right;margin-left:10px;">
                    <i class=" glyphicon glyphicon-remove"></i> 删除
                </button>
                <button type="button" class="btn btn-primary" style="float:right;" id="user_save"><i
                        class="glyphicon glyphicon-plus"></i> 新增
                </button>
                <br>
                <hr style="clear:both;">
                <div class="table-responsive">

                    <table class="table  table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th width="30"><input type="checkbox" id="check_all"></th>
                            <th>证书名称</th>
                            <th width="100">编辑</th>
                            <th width="100">删除</th>
                        </tr>
                        </thead>
                        <tbody id="tb">

                        </tbody>

                        <tfoot>
                        <tr>
                            <td colspan="10" align="center">

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
    </div>
</div>
</body>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/style/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
</html>
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
            url: "${APP_PATH}/getCertPage",
            data: {
                "pageno": pageno,
                "pagesize": 8
            },
            beforeSend: function () {
                loadingIndex = layer.msg('加载列表中', {icon: 16});
            },
            success: function (data) {
                layer.close(loadingIndex);
                if (data.code == "100") {
                    //构建列表信息
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

    //点击批量删除
    $("#delete_all").click(function () {
        var ids = "";
        var userNames = "";
        $(".check_item:checked").each(function () {
            userNames += $(this).parent().parent().find("td").eq(2).text() + ",";
            ids += $(this).parent().parent().find("td").eq(0).text() + "-";
        })
        userNames = userNames.substring(0, userNames.length - 1);
        ids = ids.substring(0, ids.length - 1);
        if (ids != "") {
            if (confirm("是否要删除[" + userNames + "]")) {
                //发请求批量删除
                var url = "${APP_PATH}/deleteCertificate";
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
    //编辑
    $("table").delegate(".edit-btn", "click", function () {
        //获取用户的表单字段
        getCertDetails($(this).parent().parent().find("td").eq(0).text());
        //弹出编辑模态框
        $("#UpdateCertModal").find(".updatCertbtn").attr("certid",$(this).parent().parent().find("td").eq(0).text());
        $("#UpdateCertModal").modal("show");

    });

    //回显员工信息
    function getCertDetails(id) {
        var url = "${APP_PATH}/editCertificate";
        $.get(url, {"id": id.trim(), "time": new Date()}, function (data) {
            var certificate = data.extend.certificate;
            $("#UpdateCertModal").find("#certname").val(certificate.name);

        })
    }

    //点击更新
    $(".updatCertbtn").click(function () {
        //验证字端是否为空
        var name=$("#UpdateCertModal").find("#certname").val().trim();
        if(name==""){
            layer.msg("输入的字段不能为空", {time: 2000, icon: 4}, function () {
            });
            return false;
        }
        var url = "${APP_PATH}/updateCertificate";
        var args = $("#myeditform").serialize() + "&id=" + $(this).attr("certid") + "";
        args = args.trim();
        $.post(url, args, function (data) {
            //更新成功
            if (data.code == "100") {
                layer.msg("更新成功", {time: 2000, icon: 1}, function () {
                    $("#UpdateCertModal").modal("hide");
                    to_page(currentpage);
                });

            }
        })
    })
    //添加
    $("#user_save").click(function () {
        //重置表单的信息
        $('#myaddform')[0].reset();
        $("#AddCertModal").modal("show");
        return false;
    });

    //保存员工
    $(".saveCert").click(function () {
        //验证添加用户
        var certname = $("#AddCertModal").find("#certname").val();
        alert(certname)
        if (certname == "") {
            layer.msg("用户登录账号不能为空，请输入", {time: 2000, icon: 5, shift: 3}, function () {});
            return false;
        }
        var args = $("#myaddform").serialize();
        $.ajax({
            url: "${APP_PATH}/addCertificate",
            method: "POST",
            data: args,
            //var token = Session::token()
            success: function (data) {
                //关闭模态框
                layer.msg("添加成功", {time: 1000, icon: 6}, function () {
                    $("#AddCertModal").modal("hide");
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
                url: "${APP_PATH}/queryForCert",
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
        }else{
            layer.msg("查询条件不能为空", {time: 1000, icon: 5}, function () {
            });
        }

    })

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
            var CertIdTd = $("<td></td>").append(item.id);
            var CertNameTd = $("<td></td>").append(item.name);
            var editBtn = $("<button></button>").addClass("edit-btn btn btn btn-success btn-sm glyphicon glyphicon-pencil").append("编辑");
            var editTd = $("<td></td>").append(editBtn);
            var deleteBtn = $("<button></button>").addClass("delete-btn btn btn-danger btn-sm glyphicon glyphicon-trash").append("删除");
            var deleteTd = $("<td></td>").append(deleteBtn);
            var Tr = $('<tr></tr>')
                .append(CertIdTd)
                .append(CheckBox)
                .append(CertNameTd)
                .append(editTd)
                .append(deleteTd)
                .appendTo("#tb")
        })
    }
    //点击删除员工
    $("table").delegate(".delete-btn", "click", function () {

        var flag = confirm("是否要删除用户");
        if (!flag) {
            return false;
        }
        var url = "${APP_PATH}/deleteCertificate";
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
</script>
