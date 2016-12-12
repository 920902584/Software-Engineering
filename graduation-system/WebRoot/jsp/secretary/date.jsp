<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.system.bean.selectTime"%>
<%@ page import="com.system.daoImpl.selectTimeDAOImpl"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/tR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'date.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/main.css">
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/style.css">
</head>

<body>
<div class="body">
	<div class="top">
   		<div class="user">欢迎您，<font color="red">${sessionScope.secretary.name }</font>|<a href="/graduation-system2.1/jsp/secretary/login.jsp">退出</a>
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
    	<div class="main-top">当前位置--师生互选时间设置：</div>
        <div class="main-show">
       <div align="center">
       <br/>
       
       <script>
		function myFunction()
		{
			var startTime=document.getElementById("startTime").value;
			var endTime=document.getElementById("endTime").value;
			if((startTime>endTime)||(startTime==null)||(endTime==null))
			{
				alert("时间设置错误");
			}
			else{
				document.getElementById("submit").type="submit";
			}
		}
		</script>
       
       
        <form action="/graduation-system2.1/timeManage" method="post">
        	师生互选开始时间:<input type="datetime-local" name="startTime" id="startTime"/>
            <br />
            <br/>
        	师生互选结束时间:<input type="datetime-local" name="endTime" id="endTime"/>
            <br/>
            <br/>
            <button  type="button" value="设定" id="submit" onclick="myFunction()" >设定</button>
            <br/>
            
        </form>
        <br/>
        <hr style="height:10px;border:none;border-top:10px groove skyblue;" />
        <%
        		selectTimeDAOImpl stdi =new selectTimeDAOImpl();
        		selectTime time = stdi.getSelectTime();
        %>
        <h1>已设定时间</h1>
        师生互选开始时间:<%=time.getStartTime() %>
            <br />
            <br/>
        	师生互选结束时间:<%=time.getEndTime() %>
            <br/>
            <br/>
        	</div>
        </div>
    </div>
    
</div>
</body>
</html>
