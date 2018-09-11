<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工信息表</title>
</head>
<link href="bootstrap/css/bootstrap.css" rel="styleSheet"/>
<style>
#main{
 width: 550px;
 margin: 20px auto;
}
#table .select{
   background:#337ab7;

}
#main h2{
 margin-left: 170px;
 color: #337ab7;

}
#table .change{
    background: #999;
}
#table td{ 
      width: 140px;
}
#table input{ 
      width: 90px;
}
#table select{ 
      width: 90px;
      height: 25px;
}
#main ul{
  margin-left: 120px;

}
#search{
   margin-left: 20px;
  }
#button{
    margin-left: 150px; 
  }
#searchBtn{
   margin-left: 120px;

}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		var selectId = -1;
		
		$("#add").click(function() {
			//设置type携带的参数，从servlet访问，实现转发
			location.href = "pro?type=showAdd";
		})
		$("#update").click(function() {
		  if(selectId>-1){
			location.href = "pro?type=showUpdate&id="+selectId;
		  }else{
			  alert("未选中一行");
		  } 
		  })
		  	$("#delete").click(function(){
		  	if(selectId>-1){
			var url = "pro?type=delete&id=" + selectId; 
			location.href = url;
		  	}else{
				  alert("未选中一行");
			  }
		})
  		
		$("tr").click(function(){
			$(this).toggleClass("select");
			if($(this).hasClass("select")){
			selectId = $(this).data("id");
			}
		})
	 if(${p.ye}<=1){
		 $("#pre").addClass("disabled");
		 $("#pre").find("a").attr("onclick","return false");
	 }
	 if(${p.ye}>=${p.maxYe}){
		 $("#next").addClass("disabled");
		 $("#next").find("a").attr("onclick","return false");
	 }
	
	})
</script>
<body>


   <div id="main">
   
   <h2>项目信息表</h2>
 <form action="pro" class="form-horizontal" role="form" method="post">
			<div class="form-group" id="searchBtn">
				<div class="col-sm-6" >
					<input type="text" class="form-control" name="name"
						placeholder="请输入部项目名称" value="${c.name }">
				</div>
			
				<div class="col-sm-3">
					<button type="submit" class="btn btn-primary">搜索</button>
				</div>
			</div>
		</form>

	<table class="table table-bordered table-striped" id="table">
		<!--不设置都为get，只有form表单才有post方法-->
		<thead><tr>
			<th>id</th>
			<th>项目名</th>
		</tr>
		</thead>
		<tbody id="tbody">
		
         <c:forEach items="${key}" var="pro">
		<tr  data-id="${pro.id }">
			<td>${pro.id }</td>
			<td>${pro.name }</td>
		
		
			
		</tr>
		</c:forEach>
       </tbody>
	</table>
	
	<ul class="pagination">
    <li id="pre"><a href="pro?ye=${p.ye-1}&name=${c.name}">上一页</a></li>
   
    <c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
    <li  <c:if test="${p.ye==status.index}" > class="active"</c:if>><a href="pro?ye=${status.index}&name=${name}" >${status.index}</a></li>
    </c:forEach>
    <li id="next"><a href="pro?ye=${p.ye+1}&name=${c.name}">下一页</a></li>
  
</ul>
    <div id="button">
	<button id="add" type="button" class="btn btn-primary">添加</button>
	<button id="update" type="button" class="btn btn-primary">修改</button>
	<button id="delete" type="button" class="btn btn-primary">删除</button>
	</div>
	</div>
   

</body>
</html>