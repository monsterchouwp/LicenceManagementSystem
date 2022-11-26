<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>牌照管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    
</head>
<body class="bootstrap-admin-with-small-navbar">
<nav class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="collapse navbar-collapse main-navbar-collapse">
                    <a class="navbar-brand" href="userMainPage.jsp"><strong>欢迎使用牌照管理系统</strong></a>
                    <p class="navbar-brand navbar-right" style="margin:0; font-size:10px;">欢迎你，普通用户</p>
                </div>
            </div>
        </div>
    </div>
</nav>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->
        <div class="col-md-2 bootstrap-admin-col-left">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                <li>
                    <a href="select.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 牌照查询</a>
                </li>
	            <li>
	                <a href="state.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 申请信息</a>
	            </li>
	            <li>
	                <a href="profile.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 我的信息</a>
	            </li>
	            <li>
	                <a href="ExitServlet"><i class="glyphicon glyphicon-chevron-right"></i> 退出系统</a>
	            </li>
            </ul>
        </div>
        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">牌照查询</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>根据牌照编号、牌照名称查询牌照信息</li>
                                <li>可查询牌照的序号、名称、数量等</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
 
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">申请信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>可查询牌照申请的基本信息、申请日期、牌照名称等</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
         
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">我的信息</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <ul>
                                <li>查询牌照信息，以及基本个人信息</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



</body>
</html>