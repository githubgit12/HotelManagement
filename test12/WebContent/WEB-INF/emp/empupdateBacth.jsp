<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style type="text/css">
#main {
	width: 400px;
	margin: 20px auto;
}
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		Employee emp = (Employee) request.getAttribute("updateBatch");
	    String ids=(String)request.getAttribute("ids");
	%>
	<div id="main">
		<form action="emp" class="form-horizontal" role="form" method="post">
			<input type="hidden" name="type" value="updateBatch1" /> <input
				type="hidden" name="ids" value="<%=ids%>" />

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						value="<%=emp.getName()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<input type="radio" name="sex" <%if (emp.getSex().equals("男")) {%>
						checked <%}%> value="男">男 <input type="radio" name="sex"
						<%if (emp.getSex().equals("女")) {%> checked <%}%> value="女">女

				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="age"
						value="<%=emp.getAge()%>">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>