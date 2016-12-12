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
    
    <title>Teachers'MainPage</title>
    
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
   			<c:choose>
   				<!--<c:when test="${empty sessionScope.student }">没有进行身份识别，请先进行身份识别</c:when>  -->
   				<c:otherwise>欢迎您，<font color="red">${sessionScope.teacher.name }</font>|<a href="/graduation-system2.1/jsp/login.jsp">退出</a></c:otherwise>
   			</c:choose>
  			
			</div>
    	<div class="top-title">毕业设计管理系统</div>
        <div class="menu">
			<ul>
<li><a class="hide" href="/graduation-system2.1/jsp/teacher/Main.jsp">返回首页</a></li>
				<li><a class="hide" href="../menu/index.html">课题选题</a></li>
				<li><a class="hide">材料管理</a>
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
				<li><a class="hide">成绩查询</a>
					<ul>
						<li><a href="../layouts/bodyfix.html"
							title="Cross browser fixed layout">答辩成绩</a></li>
						<li><a href="../layouts/body2.html"
							title="Cross browser fixed layout">论文成绩</a></li>
						<li><a href="../layouts/body4.html"
							title="Cross browser fixed layout">评阅成绩</a></li>
					</ul></li>
				<li><a class="hide">公告</a>
					<ul>
						<li><a href="spies.html" title="a coded list of spies">信息添加</a></li>
						<li><a href="vertical.html"
							title="a horizontal vertical menu">信息查看</a></li>
						<li><a href="expand.html" title="an enlarging unordered list">信息修改</a></li>
						<li><a href="enlarge.html"
							title="an unordered list with link images">信息删除</a></li>
					</ul></li>
				<li><a class="hide">毕业论文管理</a>
					<ul>
						<li><a href="/graduation-system2.1/jsp/teacher/stu-for-tea.jsp"
							title="A drop down menu">选择学生</a></li>
						<li><a href="/graduation-system2.1/jsp/teacher/proManager.jsp"
							title="A cascading menu">论文题目管理</a></li>
						<li><a href="../mozilla/cascade.html"
							title="A cascading menu">答辩安排</a></li>
						<li><a href="../mozilla/cascade.html"
							title="A cascading menu">查阅毕业论文</a></li>
					</ul></li>
				<!-- clear the floats if required -->
				<div class="clear"></div>
			</div>
		</div>
    </div>
    <div class="main">
    	<div class="main-top">当前位置--通知公告：</div>
        <div class="main-show">
        <%
        		AnnouncementDAOImpl annImpl = new AnnouncementDAOImpl();
        		Announcement ann = annImpl.findAnnouncementByObject("teacher");
        		if(ann!=null)
        		{
        %>
        通知时间：<%=ann.getPublishedDate() %>
        <HR>
        公告内容：<%=ann.getContent() %>
        <%
        		}else{
        %>
        通知时间：
        <HR>
        公告内容：
        <%
        		}
        %>
        <br/>
        </div>
    </div>
    
</div>
</body>
</html>
