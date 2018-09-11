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
 width: 800px;
 margin: 20px auto;
}
#table .select{
   background:#337ab7;

}
#main h2{
 margin-left: 300px;
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
   margin-left: 300px;
}
#save{
   height: 40px;
   width: 80px;
}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		var selectId = -1;
		
		
		
	       function doBacth(type){
			var length = $("#table .select").length;
		 	var ids = new Array(); 
		  	if(length>0){
		  	$("#table .select").each(function(index,element) {
		  	    
		  		  ids.push($(this).data("id"));
			})
		  		
			var url = "sc?type="+type+"&ids=" + ids; 
			location.href = url;
		  	}else{
				  alert("未选中数据");
			  }
		}	
  		
		
		   
		
		
		$("tr").dblclick(function(){
			var tr = $(this);
			$(this).unbind("dblclick");
			$(this).unbind("click");
		    $(this).addClass("updateSc");
		    var value = $(this).children().eq(4).text();
		    var input = "<input type='text' value='"+value+"' name='value'/>";
			$(this).children().eq(4).html(input);
			var e_id = $(this).data("id"); 
         
            $("input").blur(function(){
            	 $(".updateSc").each(function(){
        	    	 var e_id = $(this).data("id");
        	    	 var value = $(this).find("[name=value]").val();
            	 }) 
            	$.ajax({
            		url:"sc",
            		type:"post",
            		data:{type:"save1",value:value,e_id:e_id},
            		dataType:"text",
            		success:function(data){
            			var str = data.split(",");
            			if(str[0]="true"){
            				tr.children().eq(5).html(str[1]);
            			}
            		}
            		
            		
            	})
            })   
			
		
		
		})
		
		$("#save").click(function(){
			var array = new Array();
	
	     $(".updateSc").each(function(){
	    	 var e_id = $(this).data("id");
	    	 var value = $(this).find("[name=value]").val();
	               	 
             var sc={
              e_id:e_id,
              value:value
		 
             }
              array.push(sc);
          
	     })		
	     var str = JSON.stringify(array);
		 str = str.replace(/{/g,"%7b");// 开始的大括号大括号的转义字符，
		 str = str.replace(/}/g,"%7d");//结束的大括号
	     location.href = "sc?type=save&scs="+str;  
	     
			
		})
		 
	
	 if(${p.ye}<=1){
		 $("#pre").addClass("disabled");
		 $("#pre").find("a").attr("onclick","return false");
	 }
	 if(${p.ye}>=${p.maxYe}){
		 $("#next").addClass("disabled");
		 $("#next").find("a").attr("onclick","return false");
	 }
	   
	 $("#depName").change(function(){
		//级联菜单将之前存在的置空
		 $("#select").empty(); 
		 
		 var depName = $(this).val();
		 
		  $.ajax({
			  url:"sc",
			  type:"post",
			  data:{type:"searchPro",depName:depName},
			  dataType:"json",
			  success:function(data){
				for(var i=0;i<data.length;i++){
					var str = "<option value='"+data[i]+"' <c:if test="${sc.pro.name==data[i]}">selected</c:if>>"+data[i]+"</option>";
					$("#select").append(str);
				}
			  }
			  
			  
			  
		  })
		  
	 }) 
	})
</script>
<body>


   <div id="main">
   
   <h2>绩效表</h2>
 <form action="sc" class="form-horizontal" role="form" method="post">
			<div class="form-group">
				<div class="col-sm-2">
					<input type="text" class="form-control" name="empName"
						placeholder="姓名" value="${sc.emp.name }">
				</div>
					<div class="col-sm-2">
                     <select name="depName" class="form-control" id="depName">
                      <option value="">选部门</option>
                      <c:forEach items="${dep}" var="dep">
					  <option value="${dep.name}" <c:if test="${sc.emp.dep.name==dep.name}">selected</c:if>>${dep.name}</option>
					  </c:forEach>
					  </select>
				     </div>
				
				    <div class="col-sm-2">
                     <select name="proName" class="form-control" id="select">              
                      <option value="">选项目</option>
                     <!--    <c:forEach items="${pro}" var="pro">
					  <option value="${pro.name}" <c:if test="${sc.pro.name==pro.name}">selected</c:if>>${pro.name}</option>
					  </c:forEach>-->
					  </select>
				     </div>
				
				<div class="col-sm-2">
					<input type="text" class="form-control" name="value"
						placeholder="成绩" value="${sc.value!=-1?sc.value:''}" >					
				</div>
				
				<div class="col-sm-2">
                     <select name="grade" class="form-control">
                      <option value="">选等级</option>
                      <c:forEach items="${grade}" var="gra">
					  <option value="${gra.grade}" <c:if test="${sc.grade==gra.grade}">selected</c:if>>${gra.grade}</option>
					  </c:forEach>
					</select>
				</div>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">搜索</button>
				</div>
			</div>
		</form>

	<table class="table table-bordered table-striped" id="table">
		<!--不设置都为get，只有form表单才有post方法-->
		<thead><tr>
			<th>id</th>
			<th>姓名</th>
			<th>部门</th>
			<th>项目</th>
			<th>成绩</th>
			<th>等级</th>
		</tr>
		</thead>
		<tbody id="tbody">
		
         <c:forEach items="${key}" var="sc">
		<tr  data-id="${sc.emp.id }">
			<td>${sc.id }</td>
			<td>${sc.emp.name }</td>
			<td>${sc.emp.dep.name }</td>
			<td>${sc.pro.name }</td>
			<td>${sc.value }</td>
			<td>${sc.grade }</td>
			
		</tr>
		</c:forEach>
       </tbody>
	</table>
    <ul class="pagination">
	<li><a href="sc?ye=1&empName=${sc.emp.name}&depName=${sc.emp.dep.name}&proName=${sc.pro.name}&value=${sc.value!=-1?sc.value:''}&grade=${sc.grade}">首页</a></li>
    <li id="pre"><a href="sc?ye=${p.ye-1}&empName=${sc.emp.name}&depName=${sc.emp.dep.name}&proName=${sc.pro.name}&depart=${c.dep.name}&value=${sc.value!=-1?sc.value:''}&grade=${sc.grade}">上一页</a></li>
   
    <c:forEach begin="${p.beginYe}" end="${p.endYe}" varStatus="status">
    <li  <c:if test="${p.ye==status.index}" > class="active"</c:if>><a href="sc?ye=${status.index}&empName=${sc.emp.name}&depName=${sc.emp.dep.name}&proName=${sc.pro.name}&value=${sc.value!=-1?sc.value:''}&grade=${sc.grade}" >${status.index}</a></li>
    </c:forEach>
    <li id="next"><a href="sc?ye=${p.ye+1}&empName=${sc.emp.name}&depName=${sc.emp.dep.name}&proName=${sc.pro.name}&value=${sc.value!=-1?sc.value:''}&grade=${sc.grade}">下一页</a></li>
    <li id="next"><a href="sc?ye=${p.maxYe}&empName=${sc.emp.name}&depName=${sc.emp.dep.name}&proName=${sc.pro.name}&value=${sc.value!=-1?sc.value:''}&grade=${sc.grade}">尾页</a></li>
    </ul>
    <div id="button">
	
    <button id="save" type="button" class="btn btn-primary">保存</button>

	</div>
	
	</div>
   

</body>
</html>