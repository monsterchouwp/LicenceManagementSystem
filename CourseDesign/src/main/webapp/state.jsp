<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Record" import="servlet.dao.RecordDao"
    import="servlet.dao.RecordDaoImpl"
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
			    <div class="col-lg-12">
			        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
			            <thead>
			                <tr>
			                    <th>序号</th>
			                    <th>牌照名称</th>
			                    <th>用户名</th>
			                    <th>电话号码</th>
			                    <th>申请时间</th>
			                    <th>操作</th>
			                </tr>
			            </thead>
			
			            <%
			            ArrayList<Record> records = new ArrayList<Record>(); 
			            
			            RecordDao dao = new RecordDaoImpl();
			            String username = (String)session.getAttribute("userName");
			         	records = dao.get_ListInfoByUser(username);

			            for (Record bean : records){ 
			            %>       
						<tbody>
				           	<td> <%= bean.getEid() %> </td>
				            <td> <%= bean.getE_name() %> </td>
				            <td> <%= bean.getU_name() %> </td>
				            <td> <%= bean.getPhone() %> </td>
				            <td> <%= bean.getBegintime() %> </td>
			                <td><button type="button" class="btn btn-info btn-xs" data-toggle="modal" onclick="withdraw(<%= bean.getEid() %>)">撤销申请</button></td>                                                      
			            </tbody>
			            <%} %> 
			        </table>
			        <script type="text/javascript">
			            function withdraw(eid) {
			            	con=confirm("是否撤销申请?"); 
			            	if(con==true){
			            		location.href = "ApplyServlet?tip=2&eid="+eid;
			            		
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