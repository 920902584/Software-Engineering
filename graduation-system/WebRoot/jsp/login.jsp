<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My Login Page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="renderer" content="ie-comp">


	<link rel="stylesheet" type="text/css" href="/graduation-system2.1/css/reset.css">
	<link rel="stylesheet" type="text/css" href="/graduation-system2.1/css/structure.css">

	
  </head>
  <body>
   <div align="center" style="margin-top:60px">
		<h1 style="font-size:45px">毕业论文管理系统</h1>
    </div>
  	<form class="box login" action="/graduation-system2.1/StatusRecognise" method="post">
  		<fieldset class="boxBody">
  			<label>用户名</label>
  			<input type="text" name="username" value="00001" tabindex="1"
  				placeholder="Username" required>
  			<label>
  				<a href="#" class="rLink" tabindex="5">
  					Forget your password?
  				</a>
  				密码
  			</label>
  			<input type="password" name="password" value="00001" tabindex="2"
  				placeholder="Password" required>
  		</fieldset>
  		<footer>
  			
  		<div class="ui-block-a" width="232px">
  			<!--  <label><input type="checkbox" tabindex="3">Keep me logged in</label>-->
  			
  				<input name="job"value="1" type="radio" checked="checked" />学生
  				
  				<input name="job"value="2" type="radio" />教师
  		</div>
  		<div class="ui-block-b" width="100px"><input type="submit" class="btnLogin" value="Login"tabindex="4"></div>
  		</div>
  				
  		</footer>
  	</form>
  
  </body>
</html>
