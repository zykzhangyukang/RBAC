<%@page pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新闻首页</title>
</head>
<body>
<div class="modal fade" id="addTypeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">
                <form action="${APP_PATH}/news/addNewType" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">标签名</label>
                        <input type="text" name="typeName" class="form-control" id="exampleInputEmail1" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">描述信息</label>
                        <textarea name="typeDesc" class="form-control" id="desc" placeholder="请填写描述信息"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                </form>
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
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-9">
                <h2>Pin Board</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">主页</a>
                    </li>
                    <li>
                        附加页面
                    </li>
                    <li>
                        <strong>标签墙</strong>
                    </li>
                </ol>
            </div>


        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInUp">
                    <ul class="notes">
                        <c:forEach items="${requestScope.types}" var="type">
                            <li id="typeitem${type.id}">
                                <div>
                                    <small id="time">${type.createTime}</small>
                                    <h4>${type.typeName}</h4>
                                    <p>${type.typeDesc}</p>
                                    <a id="${type.id}" onclick="deleteNewType(this.id);"><i class="fa fa-trash-o "></i></a>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                    <a class="btn btn-sm btn-success" onclick="addType();">添加标签</a>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="pull-right">
                By：<a href="http://www.zi-han.net" target="_blank">zihan's blog</a>
            </div>
            <div>
                <strong>Copyright</strong> H+ © 2014
            </div>
        </div>

    </div>
</div>

</body>
</html>
<!-- Mainly scripts -->
<script src="${APP_PATH}/style/js/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/style/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${APP_PATH}/style/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${APP_PATH}/style/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${APP_PATH}/layer/layer.js"></script>
<script>
    //添加新闻类
    function addType() {
        //弹出模态框
        $("#addTypeModal").modal("show");
    }
    //删除新闻的类型
    function deleteNewType(id) {
        $.get("${APP_PATH}/news/deleteNewType",{"id":id,"time:":new Date()},function (data) {
           if(data.code=="100"){
               layer.msg("删除成功", {time: 1000, icon: 6}, function () {
                   $("#typeitem"+id+"").remove();
               });
           }else{
               alert("删除失败");
           }
        })
    }

    function getNowDate(date) {
        var sign1 = "-";
        var sign2 = ":";
        var year = date.getFullYear() // 年
        var month = date.getMonth() + 1; // 月
        var day = date.getDate(); // 日
        var hour = date.getHours(); // 时
        var minutes = date.getMinutes(); // 分
        var seconds = date.getSeconds() //秒
        var weekArr = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期天'];
        var week = weekArr[date.getDay()];
        // 给一位数数据前面加 “0”
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (day >= 0 && day <= 9) {
            day = "0" + day;
        }
        if (hour >= 0 && hour <= 9) {
            hour = "0" + hour;
        }
        if (minutes >= 0 && minutes <= 9) {
            minutes = "0" + minutes;
        }
        if (seconds >= 0 && seconds <= 9) {
            seconds = "0" + seconds;
        }
        var currentdate = year + sign1 + month + sign1 + day + " " + hour + sign2 + minutes + sign2 + seconds + " " + week;
        return date;
    }

</script>

