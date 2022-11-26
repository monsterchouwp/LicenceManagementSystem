<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Entity" import="servlet.dao.EntityDao"
    import="servlet.dao.EntityDaoImpl"
    import="model.User"
    import="servlet.dao.UserDao"
    import="servlet.dao.UserDaoImpl"
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
       				<div class="panel panel-default bootstrap-admin-no-table-panel">
          				<div class="panel-heading">
                			<div class="text-muted bootstrap-admin-box-title">查询</div>
            			</div>
            			<div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                			<form class="form-horizontal" action="SelectServlet?tip=1&page=select" method="post">
                    			<input type="hidden" name="tip" value="1">	
        						<div class="col-lg-7 form-group">
                        			<label class="col-lg-4 control-label" for="query_bname">牌照名称</label>
                        			<div class="col-lg-8">
                            			<input class="form-control" id="bookName" name="name" type="text" value="">
                            			<label class="control-label" for="query_bname" style="display: none;"></label>
                        			</div>
                    			</div>
                    			<div class="col-lg-3 form-group">
                        			<button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
                    			</div>
                    			<div class="col-lg-3 form-group">
                        			<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" onclick="applyRandomEntity()">随机申请一个牌照</button>
                    			</div>
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
			                    <th>序号</th>
			                    <th>牌照名称</th>
			                    <th>数量</th>
			                    <th>操作</th>
			                </tr>
			            </thead>
			
			            <%
			            ArrayList<Entity> entity = null; 
			            entity = (ArrayList<Entity>)request.getAttribute("data");
			            if(entity==null) {
			            	EntityDao dao = new EntityDaoImpl(); 
			         	    entity = (ArrayList<Entity>)dao.get_ListInfo(); 
			            }
			            for (Entity bean : entity){ 
			            %>       
						<tbody>
				           	<td> <%= bean.getEid() %> </td>
				            <td> <%= bean.getName() %> </td>
				            <td> <%= bean.getNum() %> </td>
			                <td> <button type="button" class="btn btn-info btn-xs" data-toggle="modal" onclick="applyEntity( <%= bean.getEid() %> )" >申请</button>   	</td>                                                      
			            </tbody>
			           <% }%> 
			        </table>
			        <script type="text/javascript">
			            function applyEntity(eid) {
			                con=confirm("是否申请?");
			                if (con == true) {//tip=1表示申请，eid表示号码
				                location.href = "ApplyServlet?tip=1&eid="+eid;
			                } 
			            }
			            function applyRandomEntity() {
			            	con=confirm("是否申请一个随机牌照?");
			                if (con == true) {//tip=1表示申请，eid表示号码
			                	<%
			                			UserDao ud = new UserDaoImpl();
			                			String name = (String)session.getAttribute("userName");
			                			User user = ud.getUserWholeInfo(name, "");
			                			
			                			EntityDao dao = new EntityDaoImpl();
			                			entity = (ArrayList<Entity>)dao.get_ListInfo();
			                			for (int i = 0; i < entity.size() ;++i) {
			                				if (entity.get(i).getNum() != 0) {
			                					%>  eid=
			                					<%= entity.get(i).getEid()%>
			                					<%break;
			                				}
			                				if (i == entity.size() - 1 && entity.get(i).getNum() == 0) {
			                					%>  eid=
					                			<%=-1%>
					                			<%break;
			                				}
			                			}
			                			if (user.getIdentifyNum().equals("null") || user.getIdentifyNum() == null) {
			                				%>  eid=
						                			<%=-100%>
						                			<%
			                			}
			                	%>
			                	if (eid == -100) 
				                	alert('不允许未实名用户申请牌照！');
			                	else if(eid == -1)
			                		alert('无牌照可用！');
			                	else
			                		location.href = "ApplyServlet?tip=1&eid="+eid;
			                } 
			            }
			        </script>
			            
			       
			    </div>
			</div>
        </div>
        
        
        
    </div>
</div>
					<%
						if(request.getAttribute("apply")!=null){		
							String str=(String)request.getAttribute("apply");
						 	out.print(str);
					    	request.setAttribute("apply", null);
						}
					%>


</body>
</html>