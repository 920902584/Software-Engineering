<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="com.system.daoImpl.TeacherDAOImpl"%>
<%@page import="com.system.daoImpl.ProjectDAOImpl"%>
<%@page import="com.system.daoImpl.StudentDAOImpl"%>
<%@page import="com.system.daoImpl.SelectionDAOImpl"%>
<%@page import="com.system.bean.Selection"%>
<%@page import="com.system.bean.Project"%>
<%@page import="com.system.bean.Teacher"%>
<%@page import="com.system.bean.Student"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/tR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'proChoose.jsp' starting page</title>

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
			<div class="user">
   			<c:choose>
   				<!--<c:when test="${empty sessionScope.student }">没有进行身份识别，请先进行身份识别</c:when>  -->
   				<c:otherwise>欢迎您，<font color="red">${sessionScope.student.name }</font>|<a href="/graduation-system2.1/jsp/login.jsp">退出</a></c:otherwise>
   			</c:choose>
  			<%
					String studentId =session.getAttribute("username").toString();
					%>
			</div>
    	<div class="top-title">毕业设计管理系统</div>
        <div class="menu">
			<ul>
<li><a class="hide" href="/graduation-system2.1/jsp/student/Main.jsp">返回首页</a></li>
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
				<li><a class="hide" href="/graduation-system2.1/jsp/student/Stu_Info.jsp">个人信息</a></li>
				<li><a class="hide">毕业论文管理</a>
					<ul>
						<li><a href="/graduation-system2.1/GetStudentselection?studentId=<%=studentId %>"
							title="A drop down menu">选择导师</a></li>
						<li><a href="/graduation-system2.1/jsp/student/proChoose.jsp"
							title="A cascading menu">确定论文题目</a></li>
						<li><a href="../mozilla/cascade.html"
							title="A cascading menu">我的答辩安排</a></li>
						<li><a href="../mozilla/cascade.html"
							title="A cascading menu">上交毕业论文</a></li>
					</ul></li>
				<!-- clear the floats if required -->
				<div class="clear"></div>
			</div>
		</div>
    </div>
	<div class="main">
		<div class="main-top">当前位置--论文选定：</div>
		<div class="main-show">
			<br />
			<table width="80%" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<th style="border:1px solid #A9BAFC" width="10%">论文编号</th>
					<th style="border:1px solid #A9BAFC" width="54%">论文题目</th>
					<th style="border:1px solid #A9BAFC" width="13%">创建时间</th>
					<th style="border:1px solid #A9BAFC" width="10%">状态</th>
					<th style="border:1px solid #A9BAFC" width="8%">操作</th>
				</tr>
				<%
					ProjectDAOImpl proDAO = new ProjectDAOImpl();
					Project proChoose = proDAO.getStuProject(studentId);
					if(proChoose!=null)
					{
				%>
				<tr>
					<td style="border:1px solid #A9BAFC"><%=proChoose.getProjectId() %></td>
					<td style="border:1px solid #A9BAFC"><%=proChoose.getProName() %></td>
					<td style="border:1px solid #A9BAFC"><%=proChoose.getCreateTime() %></td>
					<td style="border:1px solid #A9BAFC"></td>
					<td style="border:1px solid #A9BAFC"><a
							href="/graduation-system2.1/ProChooseCancle?projectId=<%=proChoose.getProjectId() %>&studentId=<%=studentId %>"
							style="float:middle">取消选择</a></td>
				</tr>
				<%
					}
					else
					{
				%>
					<tr>
					<td style="border:1px solid #A9BAFC"><input type="text" readonly="readonly"/></td>
					<td style="border:1px solid #A9BAFC"></td>
					<td style="border:1px solid #A9BAFC"></td>
					<td style="border:1px solid #A9BAFC"></td>
					<td style="border:1px solid #A9BAFC"></td>
				</tr>
				<%
					}
				%>
			</table>
			<br />
		</div>
		<div class="main-show">
			<br />
			<table width="80%" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<th style="border:1px solid #A9BAFC" width="5%"></th>
					<th style="border:1px solid #A9BAFC" width="10%">论文编号</th>
					<th style="border:1px solid #A9BAFC" width="54%">论文题目</th>
					<th style="border:1px solid #A9BAFC" width="13%">创建时间</th>
					<th style="border:1px solid #A9BAFC" width="10%">学生</th>
					<th style="border:1px solid #A9BAFC" width="8%">操作</th>
				</tr>
				<%
					Selection sele = new SelectionDAOImpl().findStudentselectionById(studentId);
				if(sele!=null)
				{
					String teacherId = sele.getTeacherId();
					Teacher tea = new TeacherDAOImpl().findTeacherById(teacherId);
					List<Project> projects = new ProjectDAOImpl().selectProject(teacherId);
					for(int i=0;i<tea.getNumberOfStu2014();i++)
					{
						int total = i+1;
						if(projects!=null&&projects.size()>0&&projects.size()>=total)
						{
							Project pro = projects.get(i);
							Student stu = new StudentDAOImpl().findStudentById(pro.getStudentId());
					%>
				<tr>
					<td style="border:1px solid #A9BAFC"><%=total %></td>
					<td style="border:1px solid #A9BAFC"><%=pro.getProjectId() %></td>
					<td style="border:1px solid #A9BAFC"><%=pro.getProName() %></td>
					<td style="border:1px solid #A9BAFC"><%=pro.getCreateTime() %></td>
					<td style="border:1px solid #A9BAFC"><%=pro.getStudentId()%></td>
					<td style="border:1px solid #A9BAFC">
						<%
									if(pro.getStudentId()==null)
									{
								%> <font color="green"> <a
							href="/graduation-system2.1/ProChoose?projectId=<%=pro.getProjectId() %>&studentId=<%=studentId %>"
							style="float:middle">选择</a> <%
									}
                                %> <%
									if(pro.getStudentId()!=null)
									{
								%> <font color="red"><a style="float:middle">已选择</a> <%
									}
                                %>
					</td>
				</tr>
				<%
							} 
					}
				}
							%>
			</table>
			<br />
		</div>
	</div>

</body>
</html>
