<%@page pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <title>新闻详情页</title>
    <link rel="stylesheet" href="${APP_PATH}/style/css/editormd.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>
    <script src="${APP_PATH}/js/editormd.min.js"></script>
    <script src="${APP_PATH}/style/js/lib/marked.min.js"></script>
    <script src="${APP_PATH}/style/js/lib/prettify.min.js"></script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <jsp:include page="../common/menu.jsp"></jsp:include>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div>
            <%--
            <c:forEach items="${requestScope.imgs}" var="image">
                <img src="/fileupload/${image}">
            </c:forEach>
               --%>
            <div class="col-md-12">
                <div class="ibox float-e-margins">
                    <div class="ibox">
                        ${mynew.newstitle}
                        ${mynew.newsdate}
                            <div id="test-markdown-view">
                                <!-- Server-side output Markdown text -->
                                <textarea style="display:none;">${mynew.newscontent}</textarea>
                            </div>

                    </div>
                    <div class="ibox-title">
                        <h5>用户评论</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div>
                            <div class="feed-activity-list">

                                <c:if test="${requestScope.comments.size()!=0}">
                                    <c:forEach items="${requestScope.comments}" var="comment">
                                        <div class="feed-element">
                                            <a href="profile.html#" class="pull-left">
                                                <img alt="image" class="img-circle" src="${APP_PATH}/style/img/a4.jpg">
                                            </a>
                                            <div class="media-body ">
                                                <small class="pull-right text-navy"><fmt:formatDate
                                                        value="${comment.time}" type="date"
                                                        pattern="yyyy年MM月dd日 hh:mm:ss"></fmt:formatDate></small>
                                                <strong>${comment.user.username}</strong> 评价:
                                                <strong>${comment.content}</strong>.
                                                <br>
                                                <small class="text-muted"><fmt:formatDate value="${comment.time}"
                                                                                          type="date"
                                                                                          pattern="yyyy年MM月dd日 hh:mm:ss"></fmt:formatDate></small>
                                                <div class="actions">
                                                    <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞
                                                    </a>
                                                    <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${requestScope.comments.size()==0}">
                                    暂无评论信息
                                    <hr>
                                    <a href="javascript:;">评论该新闻</a>
                                </c:if>

                            </div>


                        </div>

                    </div>
                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>

<script type="text/javascript">
    $(function() {
        var testView = editormd.markdownToHTML("test-markdown-view", {
            // markdown : "[TOC]\n### Hello world!\n## Heading 2", // Also, you can dynamic set Markdown text
            // htmlDecode : true,  // Enable / disable HTML tag encode.
            // htmlDecode : "style,script,iframe",  // Note: If enabled, you should filter some dangerous HTML tags for website security.
        });
    });
</script>
