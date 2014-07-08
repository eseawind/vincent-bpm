<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="zh"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>FHD 工作流平台 | 登录</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/style-metro.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="${ctx}/static/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="${ctx}/static/css/login.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="${ctx}/static/image/favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
    <img src="${ctx}/static/image/logo-big.png" alt="" />
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="form-vertical login-form" action="${ctx}/login" method="post">
        <h3 class="form-title">登录到您的账号</h3>
        <%
            String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
            if(error != null){
        %>
        <div class="alert alert-error controls input-large">
            <button class="close" data-dismiss="alert">×</button>
            <%
                if(error.contains("DisabledAccountException")){
                    out.print("用户已被屏蔽,请登录其他用户.");
                }
                else{
                    out.print("登录失败，请重试.");
                }
            %>
        </div>
        <%
            }
        %>
        <div class="alert alert-error hide">
            <button class="close" data-dismiss="alert"></button>
            <span>Enter any username and password.</span>
        </div>
        <div class="control-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">账号:</label>
            <div class="controls">
                <div class="input-icon left">
                    <i class="icon-user"></i>
                    <input class="m-wrap placeholder-no-fix" type="text" value="${username}" placeholder="账号" name="username"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label visible-ie8 visible-ie9">密码:</label>
            <div class="controls">
                <div class="input-icon left">

                    <i class="icon-lock"></i>
                    <input class="m-wrap placeholder-no-fix" type="password" placeholder="密码" name="password"/>
                </div>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="rememberMe" value="1"/> 记住我
            </label>
            <button type="submit" class="btn green pull-right">
                登录 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END LOGIN FORM -->
   
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2014 &copy; Firsthuida. Work Flow Platform.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<script src="${ctx}/static/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctx}/static/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/bootstrap.min.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="${ctx}/static/js/excanvas.min.js"></script>
<script src="${ctx}/static/js/respond.min.js"></script>
<![endif]-->
<script src="${ctx}/static/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="${ctx}/static/js/jquery.uniform.min.js" type="text/javascript" ></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${ctx}/static/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/js/app.js" type="text/javascript"></script>
<script src="${ctx}/static/js/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        App.init();
        Login.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
