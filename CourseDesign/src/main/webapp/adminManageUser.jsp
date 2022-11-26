<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.User" import="servlet.dao.UserDao"
    import="servlet.dao.UserDaoImpl"
    import="model.Entity"
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
                			<form class="form-horizontal" action="SelectServlet?tip=2&page=user" method="post">
                    			<input type="hidden" name="tip" value="1">	
        						<div class="col-lg-7 form-group">
                        			<label class="col-lg-4 control-label" for="query_bname">用户名称</label>
                        			<div class="col-lg-8">
                            			<input class="form-control" id="userName" name="name" type="text" value="">
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
			                    <th>姓名</th>
			                    <th>电话号码</th>
			                    <th>优先级</th>
			                    <th>真实姓名</th>
			                    <th>拥有牌照数</th>
			                    <th>操作</th>
			                </tr>
			            </thead>
			
			            <%
			            ArrayList<User> users = new ArrayList<User>(); 
			            users = (ArrayList<User>)request.getAttribute("data");
			            UserDao dao = new UserDaoImpl();
			            
			            if (users == null)
			         		users = dao.get_ListInfoUser();

			            for (User bean : users){ 
			            	

   						    Entity[] entities1 = bean.getEntities();
   						    
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
						<tbody>
				            <td> <%= bean.getName() %> </td>
				            <td> <%= bean.getPhone() %> </td>
				            <td> <%= bean.getPriority() %> </td>
				            <td> <%= bean.getRealName() %> </td>
				            <td> <%= bean.getNum() %> </td>
			                <td><button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateModal"
			                onclick="update('<%= bean.getName() %>','<%= bean.getPhone() %>','<%= bean.getAddress() %>','<%= bean.getPassword() %>','<%= bean.getPriority() %>','<%= bean.getRealName() %>','<%= bean.getIdentifyNum() %>','<%= bean.getMessage() %>')"
			                >详细信息</button>
			                <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#showEntityModal"
			                onclick="showEntity('<%= entities[0].getEid() %>','<%= entities[0].getName() %>','<%= entities[1].getEid() %>','<%= entities[1].getName() %>','<%= entities[2].getEid() %>','<%= entities[2].getName() %>','<%= entities[3].getEid() %>','<%= entities[3].getName() %>')"
			                 >查看牌照</button></td>                                                      
			            </tbody>
			            <%} %> 
			        </table>
			        <script type="text/javascript">
			        function update(a,b,c,d,e,f,g,h) {
						document.getElementById("updatename").value = a;
						document.getElementById("updatephone").value = b;
						document.getElementById("updateaddress").value = c;
						document.getElementById("updatepassword").value = d;
						document.getElementById("updatepriority").value= e;
						document.getElementById("updaterealname").value= f;
						document.getElementById("updateidnum").value= g;
						document.getElementById("updatemessage").value= h;
					}
			        function showEntity(a,b,c,d,e,f,g,h) {
			        	document.getElementById("ent_01").value = a;
						document.getElementById("ent_02").value = b;
						document.getElementById("ent_11").value = c;
						document.getElementById("ent_12").value = d;
						document.getElementById("ent_21").value = e;
						document.getElementById("ent_22").value = f;
						document.getElementById("ent_31").value = g;
						document.getElementById("ent_32").value = h;
			        }
			        </script>
			        
			       
			    </div>
			</div>
        </div>
        
        
        
    </div>
</div>


<!-- 修改模糊框 -->
<form class="form-horizontal" method="post" action="UpdateUserServlet?tip=2">   
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
				    			<input type="text" class="form-control" id="updatename" name="name"  placeholder="" required >
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
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">密码</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatepassword" name="password"  placeholder="" >
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    
				     <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">优先级</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatepriority" name="priority"  placeholder="" >
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updaterealname" name="realName"  placeholder="" >
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">身份证号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateidnum" name="idNum"  placeholder="" >
				    		<label class="control-label" for="updatePress" style="display: none;"></label>
				    		</div>
				    </div>
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">消息</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatemessage" name="message"  placeholder="" >
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




                            
   						    
<!-- 牌照信息模糊框 -->
<form class="form-horizontal" method="post" action="">   <!--保证样式水平不混乱-->   
	<div class="modal fade" id="showEntityModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					牌照信息
				    </h4>
			    </div>
			    <div class="modal-body">
				    
				    <div class="row">
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;牌照一<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											<label>牌照号：</label>
        										<input id="ent_01" style="border:none;" readonly>
        										<br>
        										<label>牌照名：</label>
        										<input id="ent_02" style="border:none;"  readonly>
    										</div>
										</div>
									</p>
   						    	</div>
   						    	
   						    	<div class="col-md-6">
   						    	
   						    		<p>&nbsp;&nbsp;牌照二<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											<label>牌照号：</label>
        										<input id="ent_11" style="border:none;" readonly>
        										<br>
        										<label>牌照名：</label>
        										<input id="ent_12" style="border:none;"  readonly>
    										</div>
										</div>
									</p>
   						    	</div>
   						    </div>
   						    
   						    <div class="row">
   						    	<div class="col-md-6">
   						    		<p>&nbsp;&nbsp;牌照三<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											<label>牌照号：</label>
        										<input id="ent_21" style="border:none;" readonly>
        										<br>
        										<label>牌照名：</label>
        										<input id="ent_22" style="border:none;"  readonly>
    										</div>
										</div>
									</p>
   						    	</div>
   						    	
   						    	<div class="col-md-6">
   						    		<p>&nbsp;&nbsp;牌照四<br>
   						    			<div class="panel panel-default">
    										<div class="panel-body">	
    											<label>牌照号：</label>
        										<input id="ent_31" style="border:none;" readonly>
        										<br>
        										<label>牌照名：</label>
        										<input id="ent_32" style="border:none;"  readonly>
    										</div>
										</div>
									</p>
   						    	</div>
   						    </div>
				    
				    
			    </div>
			    <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">
				    	关闭
				    </button>
				    
			    </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- 牌照信息模糊框 -->


</body>
</html>