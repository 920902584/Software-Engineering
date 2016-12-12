<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import ="java.text.SimpleDateFormat" %>
<%@page import="com.system.daoImpl.StudentDAOImpl"%>
<%@page import="com.system.dao.StudentDAO"%>
<%@page import="com.system.bean.Student"%>
<%@page import="com.system.factory.StudentDAOFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/tR/html4/loose.dtd">
<html>
  <head>  
    
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
    	<div class="main-top">当前位置--学生信息管理：</div>
        <div class="main-show">
        	<br/>
        	<form action="/graduation-system2.1/findStudentById" methor="post">
            <label for="find" style="margin-left:50px">学号查询 </label><input type="text" id="stufind" name="stufind" placeholder="请输入学号"/>   
            <input type="submit" value="查询"/>
        	</form>
        	<br/><br/>
        	<table border="0" align="center" cellpadding="0" cellspacing="0"> <!--  style="border-collapse:separate; border-spacing:0px 10px;"> -->
            	<tr>
            		<td style="border:2px solid #A9BAFC" width="150px" align="center"></td>
            		<td style="border:2px solid #A9BAFC" width="150px" align="center">学号</td>
                	<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center">年级</td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center">专业</td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center">方向</td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center">联系电话</td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center">修改信息</td></tr>
                    
                    <%
                    	StudentDAOImpl stuDao = new StudentDAOImpl();
                    	List<Student> students = stuDao.findAllStudent();
                    	int total = 1;
                    	if(students!=null&&students.size()>0)
                    	{
                    		for(int i=0;i<students.size();i++)
                    		{
                    			Student stu = students.get(i);
                    %>
                <tr>
                	<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=total %></td>
                	<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
                	<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getGrade() %></td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getProfession() %></td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getMajorField() %></td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getTelephone() %></td>
                    <td style="border:2px solid #A9BAFC" width="150px" align="center"><a href="/graduation-system2.1/jsp/secretary/stuInfo.jsp?studentId=<%=stu.getStudentId() %>">编辑</a></td>
                 </tr>
                 <%
                 				total++;
                    		}
                    	}
                 %>
            </table>
        </div>
    </div>
</body>
</html>

