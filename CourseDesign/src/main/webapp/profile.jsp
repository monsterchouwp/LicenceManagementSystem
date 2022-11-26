<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="model.User"
    import="model.Entity"
    import="servlet.dao.UserDao"
    import="servlet.dao.UserDaoImpl"
    %>
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
        
        <div class="col-md-8">
        
        	<div class="row">
                <div class="col-md-12">
                
                	<%
                	User user; 
		            
		            UserDao dao = new UserDaoImpl();
		            String username = (String)session.getAttribute("userName");
		         	user = dao.getUserWholeInfo(username, "");
                	%>
                	
            	    <div class="panel panel-default">
  						  <div class="panel-heading">
							<h3 class="panel-title">个人简介</h3>
  						  </div>
  						  <div class="panel-body">
   						    
   						    <div class="row"><!-- 第一行 -->
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;姓名<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
        										<%= user.getName() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    	
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;手机号<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
        										<%= user.getPhone() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    </div>
   						    
   						    
   						    <div class="row"><!-- 第二行 -->
   						    	
   						    	<div class="col-md-12">
   						    		<p>&nbsp;&nbsp;家庭住址<br>
   						    			<div class="panel panel-default">
   						    				<%
   						    				if (user.getAddress() == null) {
   						    					%>
   						    					<div class="panel-body">	
        										
    											</div>
    										<%
   						    				} else {
   						    				%>
    										<div class="panel-body">	
        										<%= user.getAddress()%>
    										</div>
    										
    										<%} %>
    										
										</div>
									</p>
   						    	</div>
   						    	
   						    </div>
   						    <%
   						    Entity[] entities1 = user.getEntities();
   						    
   						    Entity[] entities = new Entity[4];
   						    int i = 0;
   						 	if (entities1 == null) {
   						 		for (;i<4;) {
   						    		entities[i] = new Entity();i++;
   						    	}
						    } else {
						    	for (Entity e : entities1) {
						    		if (e != null) {
		   						    	entities[i] = e;i++;
						    		} else {
						    			entities[i] = new Entity();i++;
						    		}
						    			
	   						    }
						    }
   						    
   						    %>
   						    <div class="row"><!-- 第三行 -->
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;牌照一<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											牌照序号：
        										<%= entities[0].getEid() %>
        										<br>
        										牌照名称：
        										<%= entities[0].getName() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    	
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;牌照二<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											牌照序号：
        										<%= entities[1].getEid() %>
        										<br>
        										牌照名称：
        										<%= entities[1].getName() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    </div>
   						    
   						    <div class="row"><!-- 第四行 -->
   						    	<div class="col-md-6">
   						    		<p>&nbsp;&nbsp;牌照三<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											牌照序号：
        										<%= entities[2].getEid() %>
        										<br>
        										牌照名称：
        										<%= entities[2].getName() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    	
   						    	<div class="col-md-6">
   						    		<p>&nbsp;&nbsp;牌照四<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											牌照序号：
        										<%= entities[3].getEid() %>
        										<br>
        										牌照名称：
        										<%= entities[3].getName() %>
    										</div>
										</div>
									</p>
   						    	</div>
   						    </div>
   							<div class="row"><!-- 第五行 -->
   						    	
   						    	<div class="col-md-12">
   						    		<p>&nbsp;&nbsp;我的消息<br>
   						    			<div class="panel panel-default">
   						    				<%
   						    				if (user.getAddress() == null) {
   						    					%>
   						    					<div class="panel-body">	
        											暂无信息
        											<br>
        											<br>
    											</div>
    										<%
   						    				} else {
   						    				%>
    										<div class="panel-body">	
        										<%= user.getMessage() %>
        										<br>
        										<br>
    										</div>
    										
    										<%} %>
    										
										</div>
   						    	</div>
   						    </div>
   						    
   						    
   						    <div class="row"> <!-- 第六行 -->
   						    	<div class="col-md-6"></div>
   						    	<div class="col-md-2">
   						    		&nbsp;&nbsp;
   						    		<button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#autonymModal" 
   						    		id="btn_update1"
   						    		onclick="showID('<%= user.getRealName() %>','<%= user.getIdentifyNum() %>')">实名申请
									</button>
									
   						    	</div>
   						    	<div class="col-md-2">
   						    		&nbsp;&nbsp;
   						    		<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#resetModal" 
   						    		id="btn_update2">修改密码
									</button>
									
   						    	</div>
   						    	<div class="col-md-2">
   						    		&nbsp;&nbsp;
   						    		<button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#updateModal" 
   						    		id="btn_update3"
   						    		onclick="showInfo('<%= user.getName() %>', '<%= user.getPhone() %>', <%-- '<%= user.getPassword() %>', --%> '<%= user.getAddress() %>')">修改信息
									</button>
									
   						    	</div>
   						    	<script type="text/javascript">
    								function showInfo(a,b,c) {
        								document.getElementById("updatename").value = a;
        								document.getElementById("updatephone").value = b;
        								/* document.getElementById("updatepassword").value = c;/*  */
        								document.getElementById("updateaddress").value = c;
    								}
    								function showID(a,b) {
        								document.getElementById("autonym").value = a;
        								document.getElementById("idNum").value = b;
    								}
    								function deletebook(aid) {
    									con=confirm("是否删除?"); 
    									if(con==true){
    										location.href = "DeleteUserServlet?aid="+aid;
    									}
    								}
								</script>
   						    	
   						    </div>
   						    
   						    
   						    

   						    
  						  </div>
					</div>
					
					
					
					
                  
                </div>
            </div>
            
        </div>
        
        <div class="col-md-2">
        	<div class="row">
                <div class="col-md-12">
            	    <div class="panel panel-primary">
  						  <div class="panel-heading">
							<h3 class="panel-title">公告</h3>
  						  </div>
  						  <div class="panel-body">
   						     牌照管理系统正式开启！<br>
                            <br><br><br><br><br><br><br><br><br>
                        
  						  </div>
					</div>
                  
                </div>
            </div>
        </div>
        
        
        
    </div>
    
    <div class="row"></div>
    <div class="row"></div>
    
</div>


<!-- 修改模糊框 -->
<form class="form-horizontal" method="post" action="UpdateUserServlet?tip=1">   <!--保证样式水平不混乱-->   
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					修改信息
				    </h4>
			    </div>
			    <div class="modal-body">
				    <div class="form-group">
				    	<label for="firstname" class="col-sm-3 control-label">姓名</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatename" name="name"  placeholder="" required readonly>
				    		<label class="control-label" for="updateBookName" style="display: none;"></label>
				    		</div>
				    </div>
                
                
                
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">手机号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatephone" name="phone"  placeholder="" required>
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
			        </div>
				    
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">地址</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateaddress" name="address"  placeholder="" >
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    
			    </div>
			    <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">
				    	关闭
				    </button>
				    <button type="submit" class="btn btn-primary" >
				    	修改
				    </button>
			    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- 修改模糊框 -->


<!-- 改密码模糊框 -->
<form class="form-horizontal" method="post" action="UpdatePasswordServlet?tip=1">   <!--保证样式水平不混乱-->   
	<div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					修改信息
				    </h4>
			    </div>
			    <div class="modal-body">

				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">旧密码</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatepassword" name="oldPassword"  placeholder="" required>
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div> 
				    
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">新密码</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateaddress" name="newPassword"  placeholder="" required>
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    
			    </div>
			    <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">
				    	关闭
				    </button>
				    <button type="submit" class="btn btn-primary" >
				    	修改
				    </button>
			    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- 改密码模糊框 -->



<!-- 实名模糊框 -->
<form class="form-horizontal" method="post" action="UpdateAutonymServlet">   <!--保证样式水平不混乱-->   
	<div class="modal fade" id="autonymModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					实名信息
				    </h4>
			    </div>
			    <div class="modal-body">
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">姓名</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="autonym" name="autonym"  placeholder="" required>
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div> 
				    
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">身份证号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="idNum" name="idNum"  placeholder="" required>
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    
			    </div>
			    <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">
				    	关闭
				    </button>
				    <button type="submit" class="btn btn-primary" >
				    	提交申请
				    </button>
			    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- 实名模糊框 -->


<script>
   $(function () { $('#resetModal').modal('hide')});
</script>
<script>
   $(function () { $('#resetModal').on('hide.bs.modal', function () {

      
      })
   });
</script>
					<%
						if(request.getAttribute("msg")!=null){		
							String str=(String)request.getAttribute("msg");
						 	out.print(str);
					    	request.setAttribute("msg", null);
						}
					%>


</body>

</html>