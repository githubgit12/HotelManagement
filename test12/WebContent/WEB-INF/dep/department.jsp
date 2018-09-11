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
#searchBtn{
   margin-left: 120px;

}
#Rright {
	width: 500px;
	height: 600px;
}

</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		var selectId = -1;
		var depName = "";
		
		
		$("tr").click(function(){
			$(this).toggleClass("select");
			selectId = $(this).data("id");
			depName = ($(this).children().eq(1).text());
		})
		
		$("#add").click(function() {
			//设置type携带的参数，从servlet访问，实现转发
			location.href = "dep?type=showAdd";
		})
		$("#update").click(function() {
		  if(selectId>-1){
			location.href = "dep?type=showUpdate&id="+selectId;
		  }else{
			  alert("未选中一行");
		  } 
		  })
		$("#delete").click(function(){
		  	if(selectId>-1){
			var url = "dep?type=delete&id=" + selectId; 
			location.href = url;
		  	}else{
				  alert("未选中一行");
			  }
		})
		
		 $("#managerPro").click(function(){
			 
			 if(selectId>-1){
					var url = "mpro?depId=" + selectId; 
			    	location.href = url;
				  	}else{
						  alert("未选中一行");
					  }
	 })
	   $("#managerPro2").click(function(){
			 
			 if(selectId>-1){
					var url = "mpro?type=m2&depId=" + selectId; 
					location.href = url;
				  	}else{
						  alert("未选中一行");
					  }
	         })
  		 $("#managerPro3").click(function(){
			 
			 if(selectId>-1){
					var url = "mpro?type=m3&depId=" + selectId; 
					location.href = url;
				  	}else{
						  alert("未选中一行");
					  }
	         })
	     $("#managerPro4").click(function(){
			 
			 if(selectId>-1){
					var url = "mpro?type=m4&depId=" + selectId; 
					location.href = url;
				  	}else{
						  alert("未选中一行");
					  }
	         })
	     $("#managerPro5").click(function(){
			 
			 if(selectId>-1){
					var url = "mpro?type=m5&depId=" + selectId; 
					location.href = url;
				  	}else{
						  alert("未选中一行");
					  }
	         })
	     $("#managerPro6").click(function(){
			 
			 if(selectId>-1){
				 
				 $(this).attr("data-toggle","modal");
					$(this).attr("data-target","#myModal");
					$("#Rright").attr("src","mpro?type=m6&depId="+selectId);
				 
				 //$("#modalbody").html("");
					//var url = "mpro?type=m6&depId=" + selectId; 
				//	$("#modalbody").load(url);
				//	$("#myModal").modal("show");
				  	}else{
						  alert("未选中一行");
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
   
   <h2>部门信息表</h2>
 <form action="dep" class="form-horizontal" role="form" method="post">
			<div class="form-group" id="searchBtn">
				<div class="col-sm-6" >
					<input type="text" class="form-control" name="name"
						placeholder="请输入部门名称" value="${c.name }">
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
			<th>部门名</th>
			<th>部门人数</th>
		</tr>
		</thead>
		<tbody id="tbody">
		
         <c:forEach items="${key}" var="dep">
		<tr  data-id="${dep.id }">
			<td>${dep.id }</td>
			<td>${dep.name }</td>
			<td><a href="emp?depart=${dep.name}">${dep.empCount }</a></td>
		 
			
		</tr>
		</c:forEach>
       </tbody>
	</table>
	
	<ul class="pagination">
    <li id="pre"><a href="dep?ye=${p.ye-1}&name=${c.name}">上一页</a></li>
   
    <c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
    <li  <c:if test="${p.ye==status.index}" > class="active"</c:if>><a href="dep?ye=${status.index}&name=${name}" >${status.index}</a></li>
    </c:forEach>
    <li id="next"><a href="dep?ye=${p.ye+1}&name=${c.name}">下一页</a></li>
  
</ul>
    <div id="button">
	<button id="add" type="button" class="btn btn-primary">添加</button>
	<button id="update" type="button" class="btn btn-primary">修改</button>
	<button id="delete" type="button" class="btn btn-primary">删除</button>
	<button id="managerPro" type="button" class="btn btn-primary">管理项目</button>
	<button id="managerPro2" type="button" class="btn btn-primary">管理2</button>
	<button id="managerPro3" type="button" class="btn btn-primary">管理3</button>
	<button id="managerPro4" type="button" class="btn btn-primary">管理4</button>
	<button id="managerPro5" type="button" class="btn btn-primary">管理5</button>
	
<!-- 按钮触发模态框 -->
    <button id="managerPro6" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">模态框</button>
    </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<div class="modal-body">
						<iframe id="Rright" name="Rright" scrolling="no" frameborder="0"
							> </iframe>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
    
    
    
    
    
   <!--   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" id="modelmain">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
            </div>
            <div class="modal-body" id="modalbody">
            
            </div>
           
        </div>
    </div>
</div><!-- /.modal-content -->
<!-- /.modal -->

</body>
</html>