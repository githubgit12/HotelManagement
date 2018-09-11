<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
#photos img{
 width: 100px;
 height:100px;
 }
</style>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
   $().ready(function(){
	   //模拟出一个表单
	   $("#upload").click(function(){
		   var formData = new FormData();
		   for(var i=0;i<$("[name=myFile]")[0].files.length;i++){
		   formData.append("myFile",$("[name=myFile]")[0].files[i]);
		   }
		   $.ajax({
			   url:"emp?type=upload",
			   type:"post", 
			   data:formData,
			   cache:false,
			   processData:false,
			   contentType:false,
			   datatype:"text",
			   success:function(data){
				  var str = "<img src='pic/"+data+"' />";
				  str+="<input type='hidden' name='photo' value='"+data+"'/>";
				  $("#photos").append(str);
				  
			   }
		   })
	   })
	   $(document).on("click","#photos img",function(){
		   $(this).next().remove();
		   $(this).remove();
	   })
	   
   })
</script>
<body>
  <div id="main">
		<form action="emp?type=add2" class="form-horizontal" role="form" method="post" >
			
			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						placeholder="请输入姓名">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">性别</label>
				<div class="col-sm-10">
					<input type="radio" name="sex" checked value="男">男 <input
						type="radio" name="sex" value="女">女

				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">年龄</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="age"
						placeholder="请输入年龄">
				</div>
			</div>
            <div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">部门</label>
				<div class="col-sm-10">
					<select name="depID" class="form-control">
					<option value="">请选择部门</option>
					<c:forEach items="${dep}" var="dep">
					 <option value="${dep.id }">${dep.name }</option>
					</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label">头像</label>
				<div class="col-sm-7">
					<input type="file"  name="myFile"
						value="选择头像"  />
				</div>
				<div class="col-sm-3">
					<input type="button" id="upload" class="btn btn-primary" value="上传"/>
				</div>
			</div>
			<div class="form-group" id="photos">
			
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