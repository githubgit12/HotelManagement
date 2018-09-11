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
  height: 200px;
  border: 1px solid #337ab7;
  border-radius: 3px;
  
}



#h2{
 margin-left: 170px;
 color: #337ab7;

}
#button{
    width:180px;
    margin:  0 auto; 
  
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
		
		 
		
		 $(".pro").click(function(){
			 
			 $(this).toggleClass("select");
		 })
		 $("#add").click(function(){
	
	     if($("#nopro").find(".select").length>0){
	    	 
	    	 var proId = $("#nopro").find(".select").data("id");
	    	 
	    	 $.ajax({
	    		 
	    		url:"mpro",
	    		type:"post",
	    		data:{type:"addProName3",dId:${dep.id},pId:proId},
	    		dataType:"text",
	    	    success:function(data){
	    			if(data="true"){
	    		   var pro =  $("#nopro").find(".select");
	    		   pro.removeClass("select");
	    		   
	    		   $("#pro").append(pro);
	
	    			}		
	    		}		    		 
	    		 
	    	 })
	    	 
	     }else {
			alert("请选择项目");
		}
		 })
		  $("#addBatch").click(function(){
	      var proIds = "";
	     if($("#nopro").find(".select").length>0){
	    	   $(".select").each(function(){
	    		  proIds+=$(this).data("id")+","; 
	    	   })
	    	      proIds = proIds.substring(0,proIds.length-1);
	    	 
	    	 $.ajax({
	    		 
	    		url:"mpro",
	    		type:"post",
	    		data:{type:"addProName4",dId:${dep.id},pId:proIds},
	    		dataType:"text",
	    	    success:function(data){
	    			if(data="true"){
	    		   var pro =  $("#nopro").find(".select");
	    		   pro.removeClass("select");
	    		   
	    		   $("#pro").append(pro);
	
	    			}		
	    		}		    		 
	    		 
	    	 })
	    	 
	     }else {
			alert("请选择项目");
		}
		 })
		 
		  $("#delete").click(function(){
		 
	     if($("#pro").find(".select").length>0){
	    	 var proId = $("#pro").find(".select").data("id");
	    	 $.ajax({
	    		 
	    		url:"mpro",
	    		type:"post",
	    		data:{type:"deletePro3",dId:${dep.id},pId:proId},
	    		dataType:"text",
	    	    success:function(data){
	    		   if(data="true"){
	    		   var pro =  $("#pro").find(".select");
	    		   pro.removeClass("select");
	    		   
	    		   $("#nopro").append(pro);
	
	    			 }		
	    		}		    		 
	    		 
	    	 })
	    	 
	     }else {
			alert("请选择项目");
		}
		 })
		 
		   $("#deleteBatch").click(function(){
		    var proIds="";
	     if($("#pro").find(".select").length>0){
	    	  $(".select").each(function(){
	    		  proIds+=$(this).data("id")+",";
	    	  })
	    	    proIds = proIds.substring(0,proIds.length-1);
	    	 $.ajax({
	    		 
	    		url:"mpro",
	    		type:"post",
	    		data:{type:"deletePro4",dId:${dep.id},pId:proIds},
	    		dataType:"text",
	    	    success:function(data){
	    		   if(data="true"){
	    		   var pro =  $("#pro").find(".select");
	    		   pro.removeClass("select");
	    		   
	    		   $("#nopro").append(pro);
	
	    			 }		
	    		}		    		 
	    		 
	    	 })
	    	 
	     }else {
			alert("请选择项目");
		}
		 })
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
    <button id="addBatch" type="button" class="btn btn-primary">↑↑</button>
	<button id="delete" type="button" class="btn btn-primary">↓</button>
	<button id="deleteBatch" type="button" class="btn btn-primary">↓↓</button>
	</div>

   <div id="nopro">
       <c:forEach items="${depNo}" var="nopro">
       
        <div class="pro"  data-id="${nopro.id }">${nopro.name}</div>     
       </c:forEach>
   
   </div>
   </div>

</body>
</html>