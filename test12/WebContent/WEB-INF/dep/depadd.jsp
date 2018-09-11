<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
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
<body>
  <div id="main">
		<form action="dep" class="form-horizontal" role="form" method="post">
			<input type="hidden" name="type" value="add" />
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">部门名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						placeholder="请输入部门名">
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