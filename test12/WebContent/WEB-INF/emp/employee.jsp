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
 width: 700px;
 margin: 20px auto;
}
#table .select{
   background:#337ab7;

}
#main h2{
 margin-left: 250px;
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
  margin-left: 80px;

}
#table img{
 width: 30px;
 height: 30px;
} 
#bigPic{
display: none;
position: absolute;
width: 100px; 
}
#bigPic img{
width: 100px;
height: 100px;

}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		var selectId = -1;
		
		$("#add").click(function() {
			//设置type携带的参数，从servlet访问，实现转发
			location.href = "emp?type=showAdd";
		})
		$("#add2").click(function() {
			//设置type携带的参数，从servlet访问，实现转发
			location.href = "emp?type=showAdd2";
		})
		$("#update").click(function() {
		  if(selectId>-1){
			location.href = "emp?type=showUpdate&id="+selectId;
		  }else{
			  alert("未选中一行");
		  }
		  
		  })
		  	$("#delete").click(function(){
		  
		  	doBacth("delete");
		})
	       function doBacth(type){
			var length = $("#table .select").length;
		 	var ids = new Array(); 
		  	if(length>0){
		  	$("#table .select").each(function(index,element) {
		  	    
		  		  ids.push($(this).data("id"));
			})
		  		
			var url = "emp?type="+type+"&ids=" + ids; 
			location.href = url;
		  	}else{
				  alert("未选中数据");
			  }
		}	
  		
		 $("#deleteBatch").click(function(){
			 doBacth("deleteBatch");
		})
		   $("#showUpdateBatch1").click(function(){
			   doBacth("showUpdateBatch1");
		   })
		   $("#showUpdateBatch2").click(function(){
			   doBacth("showUpdateBatch2");
		   })
		$("tr").click(function(){
			$(this).toggleClass("select");
			
			if($(this).hasClass("select")){
				selectId = $(this).data("id");
				}	
		})
		
		$("tr").dblclick(function(){
			
			$(this).unbind("dblclick");
			$(this).unbind("click");
		    $(this).addClass("updateEmp");
		    var name = $(this).children().eq(1).text();
			$(this).children().eq(1).html("<input type='text' value='"+name+"' name='name'/>");
	         
			var sex = $(this).children().eq(2).text();
			var select="";
	        if(sex=="男"){
	        	select="<select name='sex'><option selected value='男'>男</option><option value='女'>女</option></select>"
	        }else{
	        	select="<select name='sex'><option value='男'>男</option><option selected value='女'>女</option></select>"
	        }     
			$(this).children().eq(2).html(select);
			var age = $(this).children().eq(3).text();
			$(this).children().eq(3).html("<input type='text' value='"+age+"' name='age'/>");
			var depart1 = $(this).children().eq(4).text();
			var select1="";	   	select1="<select name='depID'><c:forEach items='${dep}' var='dep'><option value='${dep.id}'<c:if test='${dep.name=="+depart1+"}'>selected</c:if>>${dep.name }</option></c:forEach></select>"
			$(this).children().eq(4).html(select1);
		})
		
		
		 $("#showUpdateBatch3").click(function() {
		  // var html ="";
		  var array = new Array();
		   $(".updateEmp").each(function(index,element){
			 
			 var id =  $(this).data("id");
			 var name =  $(this).find("[name=name]").val();
			 var sex =  $(this).find("[name=sex]").val();
			 var age = $(this).find("[name=age]").val();
			 var depID = $(this).find("[name=depID]").val();
			// html+=id+","+name+","+sex+","+age+";";
		//定义一个对象	   
			var emp={
				id:id,
				name:name,
				sex:sex,
				age:age,
				d_id:depID
			}
		      array.push(emp);
		
			   })
		 
			 //html = html.substring(0,html.length-1); 
			 var str = JSON.stringify(array);
			 str = str.replace(/{/g,"%7b");// 开始的大括号大括号的转义字符，
			 str = str.replace(/}/g,"%7d");//结束的大括号
		     location.href = "emp?type=updateBatch3&emps="+str;     
		           
		    
		 })
	  
	
	 if(${p.ye}<=1){
		 $("#pre").addClass("disabled");
		 $("#pre").find("a").attr("onclick","return false");
	 }
	 if(${p.ye}>=${p.maxYe}){
		 $("#next").addClass("disabled");
		 $("#next").find("a").attr("onclick","return false");
	 }
	 
	/* $(function(){
	        $(".container a").hover(function(){
	            $(this).append("<p id='pic'><img src='"+this.href+"' id='pic1'></p>");
	            $(".container a").mousemove(function(e){
	                $("#pic").css({
	                    "top":(e.pageY+10)+"px",
	                    "left":(e.pageX+20)+"px"
	                }).fadeIn("fast");
	                // $("#pic").fadeIn("fast");
	            });
	        },function(){
	            $("#pic").remove();
	        });
	    });*/
	 
	    $("#table img").hover(function(event){
	    	
	    	var photo = $(this).attr("src");
	    	$("#bigPic img").attr("src",photo);
	    	$("#bigPic").show();
	    	$("#bigPic").css({left:event.pageX+10,top:event.pageY+10})
	    	
	    },function(){
	    	$("#bigPic").hide();
	    })
	
	})
</script>
<body>


   <div id="main">
   
   <h2>员工信息表</h2>
 <form action="emp" class="form-horizontal" role="form" method="post">
			<div class="form-group">
				<div class="col-sm-3">
					<input type="text" class="form-control" name="name"
						placeholder="请输入姓名" value="${c.name }">
				</div>
				<div class="col-sm-3">
                     <select name="sex" class="form-control">
                      <option value="">请选择性别</option>
					  <option value="男" <c:if test="${c.sex=='男'}">selected</c:if>>男</option>
					  <option value="女" <c:if test="${c.sex=='女'}">selected</c:if>>女</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name="age"
						placeholder="请输入年龄" value="${c.age!=-1?c.age:''}" >					
				</div>
				
				<div class="col-sm-3">
                     <select name="depart" class="form-control">
                      <option value="">请选择部门</option>
                      <c:forEach items="${dep}" var="dep">
					  <option value="${dep.name}" <c:if test="${c.dep.name==dep.name}">selected</c:if>>${dep.name}</option>
					  </c:forEach>
					</select>
				</div>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-primary">搜索</button>
				</div>
			</div>
		</form>

	<table class="table table-bordered table-striped" id="table">
		<!--不设置都为get，只有form表单才有post方法-->
		<thead><tr>
			<th>id</th>
			<th>姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>部门</th>
			<th>头像</th>
		</tr>
		</thead>
		<tbody id="tbody">
		
         <c:forEach items="${key}" var="emp">
		<tr  data-id="${emp.id }">
			<td>${emp.id }</td>
			<td>${emp.name }</td>
			<td>${emp.sex }</td>
			<td>${emp.age }</td>
			<td>${emp.dep.name }</td>
			<td><c:if test="${not empty emp.pic }"><img src="pic/${emp.pic }"/></c:if></td>
		</tr>
		</c:forEach>
       </tbody>
	</table>
	
	<ul class="pagination">
	<li><a href="emp?ye=1&name=${c.name}&sex=${c.sex}&age=${c.age!=-1?c.age:''}&depart=${c.dep.name}">首页</a></li>
    <li id="pre"><a href="emp?ye=${p.ye-1}&name=${c.name}&sex=${c.sex}&age=${c.age!=-1?c.age:''}&depart=${c.dep.name}">上一页</a></li>
   
    <c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
    <li  <c:if test="${p.ye==status.index}" > class="active"</c:if>><a href="emp?ye=${status.index}&name=${name}&sex=${sex}&age=${c.age!=-1?c.age:''}&depart=${c.dep.name}" >${status.index}</a></li>
    </c:forEach>
    <li id="next"><a href="emp?ye=${p.ye+1}&name=${c.name}&sex=${c.sex}&age=${c.age!=-1?c.age:''}&depart=${c.dep.name}">下一页</a></li>
    <li id="next"><a href="emp?ye=${p.maxYe}&name=${c.name}&sex=${c.sex}&age=${c.age!=-1?c.age:''}&depart=${c.dep.name}">尾页</a></li>
</ul>
    <div  id="button">
	<button id="add" type="button" class="btn btn-primary">添加</button>
	<button id="add2" type="button" class="btn btn-primary">添加2</button>
	<button id="update" type="button" class="btn btn-primary">修改</button>
	<button id="delete" type="button" class="btn btn-primary">删除</button>
	<button id="showUpdateBatch1" type="button" class="btn btn-primary">批量修改1</button>
    <button id="showUpdateBatch2" type="button" class="btn btn-primary">批量修改2</button>
    <button id="showUpdateBatch3" type="button" class="btn btn-primary">批量修改3</button>
	<button id="deleteBatch" type="button" class="btn btn-primary">批量删除</button>
	</div>
	
	</div>
   
    <div id="bigPic"> 
      <img  src="">
    
    </div>
</body>
</html>