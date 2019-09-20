<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新闻首页</title>
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
            <div>
                <div class="container-fluid">
                    <div class="wrapper wrapper-content animated fadeInRight">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-content">
                                        <h2>
                                            <span id="all_no"></span> <span class="text-navy">“校园新闻”</span>
                                        </h2>
                                        <small>搜索用时  (0.23秒)</small>
                                        <c:forEach items="${requestScope.types}" var="type">
                                            <span class="badge badge-danger">${type.typeName}</span>
                                        </c:forEach>
                                        <div class="search-form">
                                            <form action="index.html" method="get">
                                                <div class="input-group">
                                                    <input type="text" placeholder="校园新闻" name="search" class="form-control input-lg">
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-lg btn-primary" type="submit">
                                                            搜索
                                                        </button>
                                                    </div>
                                                </div>

                                            </form>
                                        </div>
                                        <div id="newswrapper">
                                        </div>

                                        <div class="text-center">
                                            <div class="btn-group">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">

                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                "pagesize": 5
            },
            beforeSend: function () {
                loadingIndex = layer.msg('加载列表中', {icon: 16});
            },
            success: function (data) {
                layer.close(loadingIndex);
                if (data.code == "100") {
                    //构建列表信息
                    build_news(data);
                    //构建分页信息
                   build_nav(data);
                } else {
                    layer.msg(data.extend.msg, {time: 2000, icon: 5, shift: 6}, function () {

                    });
                }
            }
        });


    }

    //构建分页导航
    function build_nav(data) {
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
    function build_news(data) {
        //清空
        $("#newswrapper").empty();
        var news = data.extend.page.list;
        $.each(news, function (index, item) {
           var newheader=$("<div class='hr-line-dashed'></div>");
           var img=$("<img height='80' style='float: left;padding:0px 10px;:' src='http://localhost:8989/fileupload/"+item.newsimagepath+"'></img>");
          var result=$(' <div class="search-result">\n' +
                        ' <h3><a onclick="javascript:getnewDetails('+item.newsid+');">'+item.newstitle+'</a></h3>\n' +
                        ' <a href="search_results.html#" class="search-link">koda.iteye.com/blog/10...' +
              '</a>\n' +
                        ' <p>\n' +
                        ' '+item.newsdesc+'\n' +
                        '  </p>\n' +
                        '   </div>')
            var time=$('<a href="" style="color:#303030" class="search-link">发布时间:'+new Date(item.newsdate).format("yyyy年MM月dd日 hh:mm:ss")+'\n' +
                        ' <span style="color:#000000">浏览量:'+item.newslooknum+'</span></a>');
            var newstype=$("<span style='margin-left:1000px' class='badge badge-primary'>"+item.newType.typeName+"</span>");

           var newsdash=$("<div class='hr-line-dashed'></div>");

            $("#newswrapper").append(newheader);
            $("#newswrapper").append(img);
            $("#newswrapper").append(result);
            $("#newswrapper").append(time);
            $("#newswrapper").append(newstype);
        })
        $("#all_no").text("为您找到相关结果约 "+data.extend.page.total+"个 ： ");
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
    //
    function getnewDetails(id) {
        alert(id);
       window.location.href="${APP_PATH}/news/getNewDetails?id="+id+"";

    }

</script>
