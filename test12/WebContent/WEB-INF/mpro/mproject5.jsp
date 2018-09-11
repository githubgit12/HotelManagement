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
   width: 600px;
    margin: 20px auto;
}

#pro,#nopro{
  width: 700px;
  height: 150px;
  border: 1px solid #337ab7;
  border-radius: 3px;
  
}



#h2{
 margin-left: 170px;
 color: #337ab7;

}
#button{
    width:80px;
    margin: 20px auto; 
  }
.pro{
   background: #337ab7;
   color: #fff;
   height: 40px;
   line-height: 40px;
   float: left;
   margin-left: 10px;
   border-radius: 3px;
   padding: 0 10px;
   margin-top: 15px;
   cursor: pointer;
}

.select{ 
  background: #d9534f;

}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		 
		
		
		$(".pro").draggable({
			revert:false,
			proxy:'none',
			onStartDrag:function(){
				$(this).draggable('options').cursor = 'not-allowed';
				$(this).draggable('proxy').css('z-index',10);
			},
			onStopDrag:function(){
				$(this).draggable('options').cursor='move';
			}
		});
		
		
		var pId = -1;
		$("#pro").droppable({
			onDragEnter:function(e,source){
				$(source).draggable('options').cursor='auto';
			},
			onDragLeave:function(e,source){
				$(source).draggable('options').cursor='not-allowed';
			},
			onDrop:function(e,source){
			 pId = $(source).data("id");
			 var name = $(source).find("'.pro':eq(0)").html();
			 var pro = $(source);
			 $.ajax({
	    		 
		    		url:"mpro",
		    		type:"post",
		    		data:{type:"addProName3",dId:${dep.id},pId:pId},
		    		dataType:"text",
		    	    success:function(data){
		    			if(data="true"){
		    				  pro.css("position","static");
		 	    		   
		 	    		   $("#pro").append(pro);
		
		    			}		
		    		}		    		 
		    		 
		    	 })
			}
		});
		
		var pId = -1;
		$("#nopro").droppable({
			onDragEnter:function(e,source){
				$(source).draggable('options').cursor='auto';
			},
			onDragLeave:function(e,source){
				$(source).draggable('options').cursor='not-allowed';
			},
			onDrop:function(e,source){
			 pId = $(source).data("id");
			 var name = $(source).find("'.pro':eq(0)").html();
			 var pro = $(source);
			 $.ajax({
	    		 
		    		url:"mpro",
		    		type:"post",
		    		data:{type:"deletePro3",dId:${dep.id},pId:pId},
		    		dataType:"text",
		    	    success:function(data){
		    			if(data="true"){
		    				  pro.css("position","static");   
			 	    		   $("#nopro").append(pro);
		    			}		
		    		}		    		 
		    		 
		    	 })
			}
		});
		
})
		
		
	
</script>
<body>


   
   <div id="main">
   <h2 id="depName">${dep.name}</h2>

	<div id="pro">
	   <c:forEach  items="${proList }" var="pro" >
	     <div class="pro"  data-id="${pro.id}">${pro.name }</div>
	   
	   </c:forEach>
	
	
	</div>
     
    <div id="button">
	<button id="add" type="button" class="btn btn-primary">↑</button>
	<button id="delete" type="button" class="btn btn-primary">↓</button>
	</div>

   <div id="nopro">
       <c:forEach items="${depNo}" var="nopro">
       
        <div class="pro"  data-id="${nopro.id }">${nopro.name}</div>     
       </c:forEach>
   
   </div>
   </div>

</body>
</html>