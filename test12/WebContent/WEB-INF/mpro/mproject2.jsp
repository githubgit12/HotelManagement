<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>项目表</title>
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
		var id;
		
		
		$(document).on("click","#add",function() {
			  id = $("#select").val();
			  var i=0;
			//设置type携带的参数，从servlet访问，实现转发
			//location.href = "mpro?type=addProName&pId="+id+"&dId=${dep.id}";
		      $.ajax({
		    	  url:"mpro",
		    	  type:"post",
		    	  data:{type:"addProName2",pId:id,dId:${dep.id}},
		    	  dataType:"text",
		    	  success:function(data){
		    		  if(data="true"){
		    			  var proName="";
		    			  $("#select").children().each(function(index,element){
		    				  if($(this).val()==id){
		    					  proName=$(this).text();
		    					  i=index;
		    				  }
		    				  
		    			  })
		    			  
		    			  var tr = "<tr data-id="+id+"><td>"+id+"</td><td>"+proName+"</td></tr>"
		    			  $("#tbody").append(tr);
		    			  
		    			  $("#select").children().eq(i).remove();
		    			  
		    			  if($("#select").children().length==0){
		    					 $("#add").unbind("click");
		    					 $("#add").addClass("disabled");
		    				 }
		    		  }
		    	  }
		    	  
		      })
		
		})  
     	$("#delete").click(function(){
     		if(selectId>-1){
		  	var i=0;
			//var url = "mpro?type=deletePro&pId=" + selectId+"&dId=${dep.id}"; 
			$.ajax({
				url:"mpro",
				type:"post",
				data:{type:"deletePro2",pId:selectId,dId:${dep.id}},
				dataType:"text",
				success:function(data){
					var proName="";
					$("tr").each(function(index,element){
						if($(this).data("id")==selectId){
					    proName=$(this).children().eq(1).text();
					    i=index;
						}			
					})
					var option="<option value='"+selectId+"'>"+proName+"</option>";
					$("#select").append(option);
					$("tr").eq(i).remove();
					 if($("#select").children().length!=0){
						 $("#add").bind("click");
    					 $("#add").removeClass("disabled");
    				 }
				}
				
				
			})
			
		  	}else{
				  alert("未选中一行");
			  }
		})
  		
		$(document).on("click","tr",function(){
			$(this).toggleClass("select");
			selectId = $(this).data("id");
			/*$("tr").each(function(){
				if($(this).hasClass("select")){
				  selectId = $(this).children().eq(0).text();
				}
			})*/
			
		})
	
	})
</script>
<body>


   <div id="main">
   
   <h2>${dep.name}</h2>

	<table class="table table-bordered table-striped" id="table">
		<!--不设置都为get，只有form表单才有post方法-->
		<thead><tr>
			<th>id</th>
			<th>项目名</th>
		</tr>
		</thead>
		<tbody id="tbody">
		
         <c:forEach items="${proList}" var="pro">
		<tr  data-id="${pro.id }">
			<td>${pro.id }</td>
			<td>${pro.name }</td>
		
		
			
		</tr>
		</c:forEach>
       </tbody>
	</table>

     
    <div id="button">
    <div class="col-sm-6">
                     <select name="select" id="select" class="form-control">
                      <c:forEach items="${depNo}" var="dep">
					  <option value="${dep.id }">${dep.name}</option>
					  </c:forEach>
					</select>
				</div>
	<button id="add" type="button" class="btn btn-primary">添加</button>

	<button id="delete" type="button" class="btn btn-primary">删除</button>
	</div>
	</div>
   

</body>
</html>