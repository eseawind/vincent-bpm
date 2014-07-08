<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>流程列表</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/select2_metro.css"/>
    <link rel="stylesheet" href="${ctx}/static/css/DT_bootstrap.css"/>
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
        <a href="#">流程发布管理</a>
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
        <div class="caption"><i class="icon-table"></i>流程列表</div>
    </div>
    <div class="portlet-body">
        <div style="text-align: right">
            <button href="#createModal" role="button" data-toggle="modal" class="btn green"><i class="icon-plus"></i> 创建
            </button>
        </div>
        <br/>
        <table width="100%" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th><i class="icon-bitcoin"></i> ID</th>
                <th><i class="icon-key"></i> KEY</th>
                <th><i class="icon-tasks"></i> Name</th>
                <th><i class="icon-foursquare"></i> Version</th>
                <th><i class="icon-calendar"></i> 创建时间</th>
                <th><i class="icon-calendar"></i> 最后更新时间</th>
                <th width="255px"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="model">
                <tr>
                    <td>${model.id }</td>
                    <td>${model.key }</td>
                    <td>${model.name}</td>
                    <td>${model.version}</td>
                    <td><fmt:formatDate value="${model.createTime}"/></td>
                    <td><fmt:formatDate value="${model.lastUpdateTime}"/></td>
                        <%-- 					<td>${model.metaInfo}</td> --%>
                    <td>
                        <a class="btn mini blue" href="${ctx}/service/editor?id=${model.id}" target="_blank"><i
                                class="icon-edit"></i> 编辑</a>
                        <a class="btn mini purple" href="${ctx}/workflow/model/deploy/${model.id}"><i
                                class="icon-briefcase"></i> 部署</a>
                        <a class="btn mini black" href="${ctx}/workflow/model/export/${model.id}" target="_blank"><i
                                class="icon-download-alt"></i> 导出</a>
                        <a class="btn mini red" href="${ctx}/workflow/model/delete/${model.id}"><i
                                class="icon-trash"></i> 删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<form class="form-horizontal" id="modelForm" action="${ctx}/workflow/model/create" target="_blank" method="post">
    <div id="createModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>创建流程</h3>
        </div>
        <div class="modal-body">
            <div class="control-group">
                <label class="control-label" for="inputName">名称</label>

                <div class="controls">
                    <input type="text" id="inputName" name="name" placeholder="名称">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputKey">KEY</label>

                <div class="controls">
                    <input type="text" id="inputKey" name="key" placeholder="KEY">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputDescription">描述</label>

                <div class="controls">
                    <textarea type="text" id="inputDescription" name="description" placeholder="描述"
                              style="width:300px;height: 50px;"></textarea>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#" data-dismiss="modal" aria-hidden="true" class="btn">关闭</a>
            <input type="submit" class="btn btn-primary"/>
        </div>
    </div>
</form>
</body>
</html>