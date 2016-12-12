<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<link rel="stylesheet" type="text/css" href="/graduation-system2.1/css/main.css">
<link rel="stylesheet" type="text/css" href="/graduation-system2.1/css/style.css">

  </head>
  
  <body>
    <div class="body">
    <jsp:include page="top.jsp"/>
	<div class="main">
    	<div class="main-top">当前位置--通知公告：</div>
        <div class="main-show">
        sto lectus. Donec non tincidunt tellus, mollis venenatis lorem. Mauris sed commodo libero. Mauris interdum mollis enim, quis posuere erat rutrum sit amet. Curabitur at fermentum diam, nec bibendum risus. Mauris condimentum nibh ut gravida ornare. Morbi ornare, elit vitae vestibulum vehicula, neque nunc elementum tortor, vel pulvinar felis enim a neque. Donec malesuada congue orci in ornare. at volutpat augue commodo. Duis aliquet rhoncus magna eu porttitor. Nulla sit amet justo lectus. Donec non tincidunt tellus, mollis venenatis lorem. Mauris sed commodo libero. Mauris interdum mollis enim, quis posuere erat rutrum sit amet. Curabitur at fermentum diam, nec bibendum risus. Mauris condimentum nibh ut gravida ornare. Morbi ornare, elit vitae vestibulum vehicula, neque nunc elementum tortor, vel pulvinar felis enim a neque. Donec malesuada congue orci in ornare.
        </div>
    </div>
    
</div>
  </body>
</html>
