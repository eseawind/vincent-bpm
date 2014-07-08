<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<body class="page-header-fixed">
<ul class="breadcrumb">
    <li>
        <i class="icon-home"></i>
        <a href="index.html">首页</a>
    </li>
    <li class="pull-right no-text-shadow">
        <div id="dashboard-report-range" class="dashboard-date-range tooltips no-tooltip-on-touch-device responsive" data-tablet="" data-desktop="tooltips" data-placement="top" data-original-title="Change dashboard date range">
            <i class="icon-calendar"></i>
            <span></span>
            <i class="icon-angle-down"></i>
        </div>
    </li>
</ul>
<div class="row-fluid">
    <div class="span3 responsive" data-tablet="span6" data-desktop="span3">
        <div class="dashboard-stat blue">
            <div class="visual">
                <i class="icon-tasks"></i>
            </div>
            <div class="details">
                <div class="number" id="tasksSum">
                    <script>
                        $.ajax({
                            url: '${ctx}/dashboard/tasksSum',
                            dataType: 'json',
                            success: function(data) {
                                var i=0;
                                function timeout() {
                                    if(i<=data) {
                                        setTimeout(function() {
                                            $("#tasksSum").html(i++);
                                            timeout();
                                        },50);
                                    }
                                }
                                timeout();
                            }
                        });
                    </script>
                </div>
                <div class="desc">
                    待办事宜
                </div>
            </div>
            <a class="more" href="${ctx}/task/list">
                查看 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="span3 responsive" data-tablet="span6" data-desktop="span3">
        <div class="dashboard-stat green">
            <div class="visual">
                <i class="icon-briefcase"></i>
            </div>
            <div class="details">
                <div class="number" id="overTasksSum">
                    <script>
                        function overTasksTimeout() {
                            var i = 0;
                            function timeout() {
                                if (i <= 569) {
                                    setTimeout(function () {
                                        $("#overTasksSum").html(i++);
                                        timeout();
                                    }, 3);
                                }
                            }
                            timeout();
                        }
                        overTasksTimeout();
                    </script>
                </div>
                <div class="desc">我的结办</div>
            </div>
            <a class="more" href="#">
                查看 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="span3 responsive" data-tablet="span6  fix-offset" data-desktop="span3">
        <div class="dashboard-stat purple">
            <div class="visual">
                <i class="icon-tag"></i>
            </div>
            <div class="details">
                <div class="number">+89%</div>
                <div class="desc">已办事宜</div>
            </div>
            <a class="more" href="#">
                查看 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <div class="span3 responsive" data-tablet="span6" data-desktop="span3">
        <div class="dashboard-stat yellow">
            <div class="visual">
                <i class="icon-envelope"></i>
            </div>
            <div class="details">
                <div class="number">12,5M$</div>
                <div class="desc">我的请求</div>
            </div>
            <a class="more" href="#">
                查看 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
</div>
</body>
</html>
