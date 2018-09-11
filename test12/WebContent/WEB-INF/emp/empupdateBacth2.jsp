<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="entity.Employee"%>
<%@page import="java.util.List"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改</title>
</head>
<style type="text/css">
#main {
	width: 900px;
	margin: 20px auto;	
}
.emp{
    width: 400px;
    float: left;
    margin-left: 50px;
}
#saveBtn{
   clear: both;
   text-align: center;

}
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
  $().ready(function() {
	 
	  $("#saveBtn").click(function() {
		  var emp = "";
		  $(".emp").each(function(index,element){
			  
			var id = $(this).find("[name=id]").val();
			var name = $(this).find("[name=name]").val();
			var sex = $(this).find("[name=sex]:checked").val();
			var age = $(this).find("[name=age]").val();
			
			emp+=id+","+name+","+sex+","+age+";"   
		  })
		    emp = emp.substring(0,emp.length-1);
		    location.href = "emp?type=updateBatch2&emps="+emp;
		    
	  })
	  
	  
})
    
   
</script>
<body>

    <%  
    List<Employee> list = (List<Employee>) request.getAttribute("updateBatch");        
    %>
  <div id="main">
  <%  for(int i=0;i<list.size();i++){ %>
		<form action="emp" class="form-horizontal emp" role="form" method="post">
			<input type="hidden" name="type" value="updateBatch" />
			<input type="hidden" name="id" value="<%=list.get(i).getId() %>"/>
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						value="<%=list.get(i).getName()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<input type="radio" name="sex" <%if(list.get(i).getSex().equals("男")){%>checked <%} %>value="男">男 <input
						type="radio" name="sex" value="女" <%if(list.get(i).getSex().equals("女")){%>checked <%} %>>女

				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="age"
						value="<%=list.get(i).getAge()%>">
				</div>
			</div>

			
		</form>
		<%} %>
	   <div>
	   <button id="saveBtn" type="submit" class="btn btn-primary">保存</button>
		
		</div>	
	</div>
	
</body>
</html>