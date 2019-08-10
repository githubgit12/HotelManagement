
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set  value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>欢迎登录酒店管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap.css" type="text/css"></link>
  <link rel="stylesheet" href="${ctx}/bootstrap/css/bootstrap-responsive.css"></link>
  <script type="text/javascript" src="${ctx}/bootstrap/js/jquery-1.7.2.js"></script>
  <script type="text/javascript" src="${ctx}/bootstrap/js/bootstrap.js"></script>
  </head>
<style>
  .change{
  width:100%; 
  height:100%; 
  FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#FFF,endColorStr=#D1BBFF); /*IE*/ 
  background:-moz-linear-gradient(top,#FFF,#D1BBFF);/*火狐*/ 
  background:-webkit-gradient(linear, 0% 39.1%, 0% 100%,from(#FFF), to(#D1BBFF));/*谷歌*/ 
  }
  #message{ 
  margin-top:40px;
  color: red;
  margin-left: 100px;
}
</style>
  <script src="js/jquery.js" type="text/javascript"></script>
<script>
  $().ready(function(){
	  function showMessage(mes){
		   $("#message").html(mes);
		   setTimeout(function() {
			   $("#message").html("");
		}, 5000);
	   }

	   $("form").submit(function(){
		   var str = $("#name").val();
		   if(str.length==""){
			  showMessage("用户名不能为空");
			   return false;
		   }
		  
		    var pwd = $("#word").val();
		    if(pwd.length==""){
		    	showMessage("密码不能为空");
		    	return false;
		    }
		    if(pwd!=$("#reword").val()){
		    	showMessage("两次输入的密码不一致");
               return false;
		    }
	   })
  })

</script>
  <body>
  
  <div class="container change">
  
  <div class="modal" id="login">
      <div class="modal-header">
        <h4>用户注册</h4>
      </div>
      <div class="modal-body">
          <form id="form1" class="form-horizontal" action="${ctx}/Login/toregister.do" method="post">
            <div class="control-group">
              <label class="control-label">用户名</label>
              <div class="controls">
                <input id="name" name="userName" type="text" placeholder="请输入用户名">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">密码</label>
              <div class="controls">
                <input id="word" name="password" type="password" placeholder="请输入密码">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">确认密码</label>
              <div class="controls">
                <input id="reword"  type="password" placeholder="请确认密码">
              </div>
            </div>
          </form>
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="$('#form1').submit()" class="btn btn-primary">注册</button>
       
      	 <div id="message">${mes}</div>
      </div>
  </div>
  
</div>
    
      </body>
</html>
