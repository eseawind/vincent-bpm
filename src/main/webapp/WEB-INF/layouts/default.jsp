<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxUri" value="${pageContext.request.requestURI}"/>
<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 2.3.1
Version: 1.3
Author: KeenThemes
Website: http://www.keenthemes.com/preview/?theme=metronic
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469
-->
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>FHD 工作流平台</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
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
    <link href="${ctx}/static/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/daterangepicker.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="${ctx}/static/css/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <sitemesh:head/>
    <!-- END PAGE LEVEL STYLES -->
    <link rel="shortcut icon" href="${ctx}/static/image/favicon.ico"/>
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
    <script src="${ctx}/static/js/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- BEGIN LOGO -->
            <a class="brand" href="index.html">
                <img src="${ctx}/static/image/logo.png" alt="logo"/>
            </a>
            <!-- END LOGO -->
            <!-- BEGIN RESPONSIVE MENU TOGGLER -->
            <a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
                <img src="${ctx}/static/image/menu-toggler.png" alt=""/>
            </a>
            <!-- END RESPONSIVE MENU TOGGLER -->
            <!-- BEGIN TOP NAVIGATION MENU -->
            <ul class="nav pull-right">
                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="${ctx}/static/image/avatar1_small.jpg"/>
                        <span class="username"><shiro:principal property="name"/></span>
                        <i class="icon-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="extra_lock.html"><i class="icon-lock"></i> 锁定</a></li>
                        <li><a href="${ctx}/logout"><i class="icon-key"></i> 退出</a></li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
            <!-- END TOP NAVIGATION MENU -->
        </div>
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar nav-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <ul class="page-sidebar-menu">
            <li>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler hidden-phone"></div>
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
            </li>
            <br />
            <li class="start <c:if test="${ctxUri eq '/'}" >active</c:if>">
                <a href="/">
                    <i class="icon-home"></i>
                    <span class="title">Dashboard</span>
                    <c:if test="${ctxUri eq '/'}"><span class="selected"></span></c:if>
                </a>
            </li>
            <li class="<c:if test="${ctxUri eq '/task/list'}" >active open</c:if>">
                <a href="javascript:;">
                    <i class="icon-cogs"></i>
                    <span class="title">个人办公</span>
                    <c:if test="${ctxUri eq '/task/list' }"><span class="selected"></span></c:if>
                    <span class="arrow <c:if test="${ctxUri eq '/task/list'}" >open</c:if>"></span>
                </a>
                <ul class="sub-menu">
                    <li <c:if test="${ctxUri eq '/task/list'}">class="active"</c:if>>
                        <a href="${ctx}/task/list">
                            待办事宜</a>
                    </li>
                    <li>
                        <a href="#">
                            已办事宜</a>
                    </li>
                    <li>
                        <a href="#">
                            流程代理授权</a>
                    </li>
                    <li>
                        <a href="#">
                            我的流程日志</a>
                    </li>
                </ul>
            </li>
            <li class="<c:if test="${ctxUri eq '/workflow/model/list' or ctxUri eq '/process/processDefinition/list'}" >active open</c:if>">
                <a href="javascript:;">
                    <i class="icon-bookmark-empty"></i>
                    <span class="title">流程管理</span>
                    <c:if test="${ctxUri eq '/workflow/model/list' or ctxUri eq '/process/processDefinition/list'}"><span
                            class="selected"></span></c:if>
                    <span class="arrow <c:if test="${ctxUri eq '/workflow/model/list' or ctxUri eq '/process/processDefinition/list'}" >open</c:if>"></span>
                </a>
                <ul class="sub-menu">
                    <li <c:if test="${ctxUri eq '/workflow/model/list'}">class="active"</c:if>>
                        <a href="${ctx}/workflow/model/list">
                            流程发布管理</a>
                    </li>
                    <li <c:if test="${ctxUri eq '/process/processDefinition/list'}">class="active"</c:if>>
                        <a href="${ctx}/process/processDefinition/list">
                            流程定义管理</a>
                    </li>
                    <li>
                        <a href="#">
                            流程实例管理</a>
                    </li>
                    <li>
                        <a href="#">
                            流程历史管理</a>
                    </li>
                    <li>
                        <a href="#">
                            流程操作日志</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN PAGE -->
    <div class="page-content">
        <!-- BEGIN PAGE CONTAINER-->
        <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->
            <%--
            <div class="row-fluid">
                <div class="span12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">
                        <sitemesh:title/>
                    </h3>
                    <!-- END PAGE TITLE & BREADCRUMB-->
                </div>
            </div>
            --%>
            <!-- END PAGE HEADER-->
            <br/>
            <sitemesh:body/>
        </div>
        <!-- END PAGE CONTAINER-->
    </div>
    <!-- END PAGE -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2014 &copy; Firsthuida. Work Flow Platform.
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="icon-angle-up"></i>
			</span>
    </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/js/app.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>