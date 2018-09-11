<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>

<style>
#main{
height: 500px;
}
#left{ 
  width: 300px;
  float: left;
  height: 500px;
  padding-left: 100px;
  
}
#right{
 
   float:left;
   width: 800px;
   height: 500px;
}
#top,#bottom{ 
 height: 80px;
 background: #337ab7;
 clear: both;
  }
.yi{
   width: 160px;
   height: 40px;
   background:  #337ab7;
   line-height: 40px;
   border-radius: 3px;
   margin-top: 10px;
   color: #fff;
   text-align: center;
   cursor: pointer;
 
}
a{
  color: #fff;
  text-decoration: none;
}
.er{
  list-style: none;
  width: 120px;
  background: #ccc;
  display: none;
 
}
.er li{
 margin-top: 5px;
 margin-left: 20px;

}
.er a{
  color: #000;
}
#fangwen{
width:150px;
margin-left: 1180px;
margin-top: -20px;


}
</style>
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
   $().ready(function(){
	   $(".yi").click(function(){
		
		   $(this).next().slideToggle();
	   })
	   
	   
   })
  var websocket = null;
    //判断当前浏览器是否支持WebSocket
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://192.168.0.122:8080/test12/websocket");
	} else {
		alert('没有建立websocket连接')
	}
	//连接发生错误的回调方法
	websocket.onerror = function() {
		setMessage("错误");
	};

	//连接成功建立的回调方法
	websocket.onopen = function(event) {
		setMessage("建立连接");
	}

	//接收到消息的回调方法
	websocket.onmessage = function(event) {
		setMessage($("#fangwen h4").html("在线人数:"+event.data));
	}

	//连接关闭的回调方法
	websocket.onclose = function() {
		setMessage("close");
	}

	//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口。
	window.onbeforeunload = function() {
		websocket.close();
	}
	//将消息显示在网页上
	function setMessage(text) {
		
	}

	//关闭连接
	function closeWebSocket() {
		websocket.close();
	}
</script>
</head>
<body>
      <div id="container">
      <div id="top">
      <c:if test="${empty user1 }">
       <h2><a href="user">登录</a> 
           <a href="user?type=showRegister">注册</a>
       </h2>
      </c:if>
       <c:if test="${!empty user1 }">
       <h2>欢迎：${user1.username },登录</h2>
        <h3><a href="user">退出登录</a></h3>
      </c:if>
      <div id="fangwen">
       <h4>本网站有<%=application.getAttribute("num") %>人访问</h4>
       </div>
      </div>
      <div id="main">
      <div id="left">
         <div class="yi">
                              员工管理  
         </div>
         <ul class="er">
            <li> <a href="emp" target="right">员工管理</a>  </li>
            <li> <a href="emp?type=showAdd" target="right">员工添加</a>  </li>
            </ul>
               
         <div class="yi">部门管理</div>
           <ul class="er">
            <li> <a href="dep" target="right">部门管理</a>  </li>
            <li> <a href="dep?type=showAdd" target="right">部门添加</a>  </li>
            </ul>
         <div class="yi">项目管理</div>
           <ul class="er">
            <li> <a href="pro" target="right">项目管理</a>  </li>
            <li> <a href="pro?type=showAdd" target="right">项目添加</a>  </li>
            </ul>
         <div class="yi">绩效管理</div>
           <ul class="er">
            <li> <a href="sc" target="right">绩效查看</a>  </li>
            <li> <a href="sc?type=manager" target="right">绩效管理</a>  </li>
            </ul>
      
      </div>
      <iframe src="emp" id="right" scrolling="no" frameborder="0" name="right"></iframe>
      </div>
      <div id="bottom"></div>
      </div>
</body>
</html>