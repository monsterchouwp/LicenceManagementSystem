<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.RecordID" import="servlet.dao.RecordIDDao"
    import="servlet.dao.RecordIDDaoImpl"
    import="java.util.*"%>
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
                    <a class="navbar-brand" href="adminMainPage.jsp"><strong>欢迎使用牌照管理系统</strong></a>
                    <p class="navbar-brand navbar-right" style="margin:0; font-size:10px;">欢迎你，管理员</p>
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
                    <a href="adminManageEntity.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 牌照管理</a>
                </li>
                <li>
	                <a href="adminManageUser.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 用户管理</a>
	            </li>
	            <li>
	                <a href="adminState.jsp"><i class="glyphicon glyphicon-chevron-right"></i>牌照申请处理</a>
	            </li>
	            <li>
	                <a href="adminAutonymState.jsp"><i class="glyphicon glyphicon-chevron-right"></i>实名申请处理</a>
	            </li>
	            <li>
	                <a href="adminHistory.jsp"><i class="glyphicon glyphicon-chevron-right"></i>历史记录</a>
	            </li>
	            <li>
	                <a href="ExitServlet"><i class="glyphicon glyphicon-chevron-right"></i> 退出系统</a>
	            </li>
            </ul>
        </div>
        
        
        
        <!-- content -->
        
        
        
        <div class="col-md-10">
        
        	<div class="row">
    			<div class="col-lg-12">
       				<div class="panel panel-default bootstrap-admin-no-table-panel">
          				<div class="panel-heading">
                			<div class="text-muted bootstrap-admin-box-title">查询</div>
            			</div>
            			<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                			<form class="form-horizontal" action="SelectServlet?tip=2&page=autonym" method="post">
                    			<input type="hidden" name="tip" value="1">	
        						<div class="col-lg-7 form-group">
                        			<label class="col-lg-4 control-label" for="query_bname">用户名称</label>
                        			<div class="col-lg-8">
                            			<input class="form-control" id="bookName" name="name" type="text" value="">
                            			<label class="control-label" for="query_bname" style="display: none;"></label>
                        			</div>
                    			</div>
                    			<div class="col-lg-3 form-group">
                        			<button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
                    			</div>
                    			<!-- <div class="col-lg-3 form-group">
                        			<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加牌照</button>
                    			</div> -->
                			</form>
            			</div>
        			</div>
    			</div>
			</div>
        
        
        
            <div class="row">
			    <div class="col-lg-12">
			        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
			            <thead>
			                <tr>
			                    <th>实名</th>
			                    <th>身份证号</th>
			                    <th>用户名</th>
			                    <th>电话号码</th>
			                    <th>申请时间</th>
			                    <th>操作</th>
			                </tr>
			            </thead>
			
			            <%
			            ArrayList<RecordID> records; 
			            records = (ArrayList<RecordID>)request.getAttribute("data");
			            RecordIDDao dao = new RecordIDDaoImpl();
			            if (records == null)
			         		records = dao.get_ListInfoByAdmin();
						if(records != null)
			            for (RecordID bean : records){ 
			            %>       
						<tbody>
				           	<td> <%= bean.getRealName() %> </td>
				            <td> <%= bean.getIdNum() %> </td>
				            <td> <%= bean.getName() %> </td>
				            <td> <%= bean.getPhone() %> </td>
				            <td> <%= bean.getBegintime() %> </td>
			                <td><button type="button" class="btn btn-success btn-xs" data-toggle="modal" onclick="accept('<%= bean.getName() %>','<%= bean.getIdNum() %>','<%= bean.getRealName() %>')">申请通过</button>
			                <button type="button" class="btn btn-danger btn-xs" data-toggle="modal" onclick="rejects('<%= bean.getName() %>')">拒绝申请</button></td>                                                      
			            </tbody>
			            <%} %> 
			        </table>
			        <script type="text/javascript">
			            function accept(name, idNum, realName) {
			            	con=confirm("是否接受申请?"); 
			            	if(con==true){//1表示接受申请
			            		location.href = "AdminManageAutonymState?flag=1&name="+name+"&idNum="+idNum+"&realName="+realName;
			            	}
			            }
			            function rejects(name) {
			            	con=confirm("是否拒绝申请?"); 
			            	if(con==true){//2表示拒绝申请
			            		location.href = "AdminManageAutonymState?flag=2&name="+name;
			            	}
			            }
			            
			        </script>
			        
			       
			    </div>
			</div>
        </div>
        
        
        
    </div>
</div>



</body>
</html>