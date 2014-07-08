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
<html>
<head>
    <title>待办列表</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/select2_metro.css" />
    <link rel="stylesheet" href="${ctx}/static/css/DT_bootstrap.css" />
</head>
<body class="page-header-fixed">
    <ul class="breadcrumb">
        <li>
            <i class="icon-home"></i>
            <a href="index.html">首页</a>
            <i class="icon-angle-right"></i>
        </li>
        <li>
            <a href="#">个人办公</a>
            <i class="icon-angle-right"></i>
        </li>
        <li>
            <a href="#">待办事宜</a>
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
            <div class="caption"><i class="icon-table"></i>待办列表</div>
        </div>
        <div class="portlet-body">
            <table id="task_table" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#task_table .checkboxes" /></th>
                    <th><i class="icon-bitcoin"></i> ID</th>
                    <th><i class="icon-tasks"></i> 任务名称</th>
                    <th><i class="icon-calendar"></i> 创建时间</th>
                    <th><i class="icon-columns"></i> 流程名称</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="task">
                    <tr>
                        <td><input type="checkbox" class="checkboxes" value="${task.taskId }" /></td>
                        <td>${task.taskId }</td>
                        <td>${task.activityName }</td>
                        <td>${task.createDate}</td>
                        <td>${task.processName}</td>
                        <td>
                            <a class="btn mini blue" href="#"><i class="icon-arrow-right"></i> 执行</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript" src="${ctx}/static/js/select2.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/DT_bootstrap.js"></script>
    <script>
        $(document).ready(function() {
            $('#task_table').dataTable({
                "aoColumns": [
                    { "bSortable": false },
                    null,
                    { "bSortable": false },
                    null,
                    { "bSortable": false },
                    { "bSortable": false }
                ],
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "All"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ records per page",
                    "oPaginate": {
                        "sPrevious": "Prev",
                        "sNext": "Next"
                    }
                },
                "aoColumnDefs": [{
                    'bSortable': false,
                    'aTargets': [0]
                }
                ]
            });
            $('#task_table .group-checkable').change(function () {
                var set = $(this).attr("data-set");
                var checked = $(this).is(":checked");
                $(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                $.uniform.update(set);
            });
        });

    </script>
</body>
</html>
