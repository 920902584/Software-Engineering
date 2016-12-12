<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import ="java.text.SimpleDateFormat" %>
<%@page import="com.system.daoImpl.AnnouncementDAOImpl"%>
<%@page import="com.system.bean.Announcement"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/tR/html4/loose.dtd">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>  
    
    <title>Students'MainPage</title>
    
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
	<div class="top">
   		<div class="user">
   			欢迎您，<font color="red">${sessionScope.secretary.name }</font>|<a href="/graduation-system2.1/jsp/secretary/login.jsp">退出</a>
			</div>
    	<div class="top-title">毕业设计管理系统</div>
        <div class="menu">
			<ul>
<li><a class="hide" href="/graduation-system2.1/jsp/secretary/Main.jsp">返回首页</a></li>
				<li><a class="hide" href="index.html">材料管理</a>
					<ul>
						<li><a href="spies.html" title="a coded list of spies">任务书</a></li>
						<li><a href="vertical.html"
							title="a horizontal vertical menu">论文</a></li>
						<li><a href="expand.html" title="an enlarging unordered list">中期检查</a></li>
						<li><a href="enlarge.html"
							title="an unordered list with link images">文献综述</a></li>
						<li><a href="cross.html" title="non-rectangular links">开题报告</a></li>
						<li><a href="jigsaw.html" title="jigsaw links">外文翻译</a></li>
					</ul></li>
				<li><a class="hide" href="../layouts/index.html">成绩查询</a>
					<ul>
						<li><a href="../layouts/bodyfix.html"
							title="Cross browser fixed layout">答辩成绩</a></li>
						<li><a href="../layouts/body2.html"
							title="Cross browser fixed layout">论文成绩</a></li>
						<li><a href="../layouts/body4.html"
							title="Cross browser fixed layout">评阅成绩</a></li>
					</ul></li>
				<li><a class="hide" href="/graduation-system2.1/jsp/secretary/Announce.jsp">公告</a></li>
				<li><a class="hide">答辩管理</a>
					<ul>
						<li><a href="../mozilla/dropdown.html"
							title="A drop down menu">开题答辩管理</a></li>
						<li><a href="../mozilla/cascade.html"
							title="A cascading menu">毕业答辩管理</a></li>
					</ul></li>
				<li><a class="hide">用户管理</a>
					<ul>
						<li><a href="/graduation-system2.1/jsp/secretary/stuListView.jsp">学生</a></li>
						<li><a href="/graduation-system2.1/jsp/secretary/teaListView.jsp">老师</a></li>
						<li><a href="/graduation-system2.1/jsp/secretary/secListView.jsp">管理员</a></li>
					</ul></li>
                <li><a class="hide" >师生互选管理</a>
					<ul>
                  	    <li><a href="/graduation-system2.1/jsp/secretary/date.jsp">功能开启时间</a></li>
						<li><a href="/graduation-system2.1/jsp/secretary/studentsAndteahcers.jsp">互选情况管理</a></li>
						<li><a href="/graduation-system2.1/jsp/secretary/projectManage.jsp">论文题目管理</a></li>
					</ul></li>
					</ul>
			</div>
		</div>
    </div>
    <div class="main">
    	<div class="main-top">当前位置--错误：</div>
    	<div class="main-show">
    		<%
    			String stuId = (String)request.getAttribute("stuId");
    		 %>
    		<div data-role="dialog" id="dialog-1"
    			data-close-btn="none">
    			<div data-role="header">
    				<h1>提示</h1>
    			</div>
    			<div data-role="content">
    				<h6>学号为<%=stuId %>的学生不存在，请检查学号是否输入正确.</h6>
    				<a href="/graduation-system2.1/jsp/secretary/stuListView.jsp" data-role="button"
    					data-rel="back">
    					OK
    				</a>
    			</div>
    		</div>
    		<br />
    	</div>
    </div>
    
</body>
</html>
