<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="leftbar" class="span2">
	<h1>个人办公</h1>
	<div class="submenu">
		<a id="account-tab"href="${ctx}/task/list">待办事宜</a>
		<a id="account-tab"href="${ctx}/#">已办事宜</a>
		<a id="account-tab"href="${ctx}/#">流程代理授权</a>
		<a id="account-tab"href="${ctx}/#">我的流程日志</a>
	</div>
	<h1>流程管理</h1>
	<div class="submenu">
		<a id="account-tab"href="${ctx}/workflow/model/list">流程发布管理</a>
		<a id="account-tab"href="${ctx}/process/processDefinition/list">流程定义管理</a>
		<a id="account-tab"href="${ctx}/#">流程实例管理</a>
		<a id="account-tab"href="${ctx}/#">流程历史管理</a>
		<a id="account-tab"href="${ctx}/#">流程操作日志</a>
	</div>
</div>