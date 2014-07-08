<%--
  Created by IntelliJ IDEA.
  User: vincent
  Date: 2014/5/29
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>运行中流程列表</title>
</head>
<body>
<ul class="breadcrumb">
    <li>
        <i class="icon-home"></i>
        <a href="index.html">首页</a>
        <i class="icon-angle-right"></i>
    </li>
    <li>
        <a href="#">流程管理</a>
        <i class="icon-angle-right"></i>
    </li>
    <li>
        <a href="#">流程定义管理</a>
    </li>
    <li class="pull-right no-text-shadow">
        <div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
            <i class="icon-calendar"></i>
            <span></span>
            <i class="icon-angle-down"></i>
        </div>
    </li>
</ul>
<c:if test="${not empty message}">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>提示：</strong> ${message}
    </div>
</c:if>
<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption"><i class="icon-table"></i>运行中流程列表</div>
    </div>
    <div class="portlet-body">
<table width="100%" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>流程名称</th>
        <th>描述</th>
        <th>版本</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${processDefinitionList}" var="processDefinition">
        <tr>
            <td>${processDefinition.id }</td>
            <td>${processDefinition.name }</td>
            <td>${processDefinition.description}</td>
            <td>${processDefinition.version}</td>
            <td>
                <a class="btn mini green" href="${ctx}/process/processDefinition/startProcess/${processDefinition.id }">启动</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
        </div>
    </div>
</body>
</html>
