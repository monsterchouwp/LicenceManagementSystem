<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Record" import="servlet.dao.RecordDao"
    import="servlet.dao.RecordDaoImpl"
    import="java.util.*"
    import="servlet.dao.EntityDaoImpl"
    import="servlet.dao.EntityDao"
    import="model.Entity"
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
    <style type="text/css">  
 		.table {table-layout:fixed}  
  		.table td {overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
	</style>
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
                			<form class="form-horizontal" action="SelectServlet?tip=2&page=select" method="post">
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
                        			<button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加牌照</button>
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
			                    <th>备注</th>
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
				            <td> <%= bean.getMessage() %> </td>
			                <td> <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#updateModal" 
   						    		id="btn_update1"
   						    		onclick="modify('<%= bean.getEid() %>','<%= bean.getName() %>','<%= bean.getNum() %>','<%= bean.getMessage() %>')">修改信息
									</button>
			                	<button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#messageModal"  onclick="remark('<%= bean.getEid() %>','<%= bean.getName() %>','<%= bean.getNum() %>','<%= bean.getMessage() %>')" >备注</button>   	
			                </td>                                                      
			            </tbody>
			           <% }%> 
			        </table>
			        <script type="text/javascript">
			            function modify(eid, name, num, message) {
			            	document.getElementById("oldeid").value = eid;
			            	document.getElementById("updateeid").value = eid;
							document.getElementById("updatename").value = name;
							document.getElementById("updatenum").value = num;
							document.getElementById("updateamessage").value = message;
			            }
			            function remark(eid, name, num, message) {
			            	document.getElementById("oldeid1").value = eid;
			            	document.getElementById("updateeid1").value = eid;
							document.getElementById("updatename1").value = name;
							document.getElementById("updatenum1").value = num;
							document.getElementById("updateamessage1").value = message;
			            }
			            
			        </script>
			        
			       
			    </div>
			</div>
			
			
			
			
			
        </div>
        
        
        
    </div>
</div>


<!-- 修改模糊框 -->
<form class="form-horizontal" method="post" action="UpdateEntityServlet?tip=1">    
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					修改牌照信息
				    </h4>
			    </div>
			    <div class="modal-body">
			    
			    	<div class="form-group">
				    	<label for="firstname" class="col-sm-3 control-label">旧序号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="oldeid" name="o_eid"  placeholder="" required readonly>
				    		
				    		</div>
				    </div>
			    
			    
				    <div class="form-group">
				    	<label for="firstname" class="col-sm-3 control-label">序号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateeid" name="eid"  placeholder="" required >
				    		
				    		</div>
				    </div>
                
                
                
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">牌照号</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatename" name="name"  placeholder="" required>
				    		
				    		</div>
			        </div>
				    
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">数量</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updatenum" name="num"  placeholder="" required>
				    		
				    		</div>
				    </div>
				    
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">备注信息</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateamessage" name="message"  placeholder="" >
				    		
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


<!-- message模糊框 -->
<form class="form-horizontal" method="post" action="UpdateEntityServlet?tip=2">    
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="updateModalLabel">
					修改牌照信息
				    </h4>
			    </div>
			    <div class="modal-body">
			    	<input type="hidden" id="oldeid1" name="o_eid1">	
			    	<input type="hidden" id="updateeid1" name="eid1">	
			    	<input type="hidden" id="updatename1" name="name1">	
			    	<input type="hidden" id="updatenum1" name="num1">	
				    <div class="form-group">	
				    	<label for="firstname" class="col-sm-3 control-label">备注信息</label>
				    		<div class="col-sm-7">
				    			<input type="text" class="form-control" id="updateamessage1" name="message1"  placeholder="" >
				    		
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
<!-- message模糊框 -->

					<%
						if(request.getAttribute("msg")!=null){		
							String str=(String)request.getAttribute("msg");
						 	out.print(str);
					    	request.setAttribute("msg", null);
						}
					%>
<!-- 添加牌照模糊框 -->
<form class="form-horizontal" method="post" action="AddEntityServlet">   
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加新牌照
                    </h4>
                </div>

                <div class="modal-body">
                    
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">牌照序号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="eid" required="required" name="eid" placeholder="请输入牌照序号">
                            <label class="control-label" for="addISBN" style="display: none;"></label>	
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">牌照名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" required="required" name="name"  placeholder="请输入牌照名称">
                            <label class="control-label" for="addBookName" style="display: none;"></label>	
                        </div>
                    </div>

                    <div class="form-group">	
                        <label for="firstname" class="col-sm-3 control-label">牌照数量</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="num" required="required" name="num"  placeholder="请输入牌照数量">
                            <label class="control-label" for="addBookType" style="display: none;"></label>	
                        </div>
                    </div>

                    <div class="form-group">	
                        <label for="firstname" class="col-sm-3 control-label">牌照备注</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="message"  name="message"  placeholder="请输入备注">
                            <label class="control-label" for="addPress" style="display: none;"></label>	
                        </div>
                    </div>


                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary" >
                        添加
                    </button>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>	
<!-- 添加模糊狂 -->

</body>
</html>