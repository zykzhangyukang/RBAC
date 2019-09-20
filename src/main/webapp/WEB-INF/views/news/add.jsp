<%@page pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加新闻</title>
    <link rel="stylesheet" href="${APP_PATH}/style/css/editormd.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>
    <script src="${APP_PATH}/js/editormd.min.js"></script>

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
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>添加新闻 <small>包括自定义样式的复选和单选按钮</small></h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form id="news_add_form" action="${APP_PATH}/news/doAddNew"  class="form-horizontal" method="post" enctype="multipart/form-data" >
                        <div class="form-group">
                            <label class="col-sm-2 control-label">标题</label>
                            <div class="col-sm-10">
                                <input name="newstitle" type="text" id="newstitle" class="form-control">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">描述信息</label>
                            <div class="col-sm-10">
                                <input name="newsdesc" type="text" id="newsdesc" class="form-control"> <span class="help-block m-b-none">添加新闻描述信息,吸引读者的阅读兴趣</span>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                            <div class="col-sm-12">
                                <div id="edit-newscontent">
                                <textarea  style="display:none;" name="newscontent" id="newscontent"></textarea>
                                    <script>
                                        $(function() {
                                            var editor = editormd("edit-newscontent", {
                                                width  : "100%",
                                                height : "600px",
                                                path   : "${APP_PATH}/style/js/lib/"
                                            });
                                        });
                                    </script>
                                </div>

                            </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻类型</label>
                            <div class="col-sm-2">

                                <select name="typeId" id="typeId" class="form-control">
                                    <option>请选择</option>
                                    <c:forEach items="${requestScope.types}" var="type">
                                        <option value="${type.id}">${type.typeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">图片</label>
                            <input name="imgs" class="col-sm-2" type="file"/>
                            <input name="imgs" class="col-sm-2" type="file"/>
                            <input name="imgs" class="col-sm-2" type="file"/>
                            <input name="imgs" class="col-sm-2" type="file"/>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button  class="btn btn-primary" type="submit">发布新闻</button>
                                <button class="btn btn-danger" type="submit">取消发布</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>


