<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.system.bean.Teacher"%>
<%@ page import="com.system.daoImpl.TeacherDAOImpl"%>
<%@ page import="com.system.bean.Selection"%>
<%@ page import="com.system.daoImpl.SelectionDAOImpl"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/tR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'student_decide.jsp' starting page</title>

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
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/table.css">
<script src="/graduation-system2.1/js/table.js"></script>
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/window.css">
<script src="/graduation-system2.1/js/window.js"></script>
</head>

 <body>
<div class="body">
	<div class="top">
   		<div class="user">欢迎您，<font color="red">${sessionScope.student.name }</font>|<a href="/graduation-system2.1/jsp/login.jsp">退出</a>
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
					</ul>
			</div>
		</div>
    </div>
	<div class="main">
		<div class="main-top">当前位置--导师选定：</div>
		<div class="main-show">
			<!-- 代码 开始 -->
			<DIV id=divFoltupDiv>
				<P>
					<IMG alt=Loading src=""> 发送数据
				</P>
				<P id=sendokBiginf></P>
				<P id=sendokinf></P>
			</DIV>
			<TABLE id=tbBackground cellSpacing=0 cellPadding=0 width=760
				align=center border=0>
				<TBODY>
					<TR>
						<TD></TD>
					</TR>
					<TR>
						<TD>
							<TABLE id=tbData cellSpacing=1 cellPadding=0 width=750
								align=center border=0>
								<THEAD>
									<TR>
										<TD>状态</TD>
										<TD>导师</TD>
										<TD>性别</TD>
										<TD>邮箱</TD>
										<TD>教研室</TD>
										<TD>导师可带学生数</TD>
										<TD>已确认学生数</TD>
										<TD>当前已申请人数</TD>
									</TR>
								</THEAD>
								
								<%
								
								SelectionDAOImpl stuSelectionDao = new SelectionDAOImpl();
								Selection studentselection = stuSelectionDao.findStudentselectionById(studentId);
							
								TeacherDAOImpl teacherDao = new TeacherDAOImpl();
								Teacher teacher = teacherDao.findTeacherById(studentselection.getTeacherId());
								if(teacher!=null)
								{
									String noStatus = "未确认";
									String yesStatus = "已确认";
								%>

								<TBODY>
									<TR>
										<TD>
										<%if (studentselection.getStatus()==1)
										{
										%>
												<font color="green"><%=yesStatus %>
										<%} %>
										<%if (studentselection.getStatus()==0)
										{
										%>
												<font color="red"><%=noStatus %>
										<%} %>
										</TD>
										<TD><%=teacher.getName() %></TD>
										<TD><%=teacher.getSex() %></TD>
										<TD><%=teacher.getMailbox() %></TD>
										<TD><%=teacher.getDirection() %></TD>
										<TD><%=teacher.getNumberOfStu2014() %></TD>
										<TD><%=teacher.getConfirmedOfStu2014() %></TD>
										<TD><%=teacher.getAppliedOfStu2014() %></TD>
									</TR>
								</TBODY>
								<%
								}
								%>


								<TBODY>
									<TR>
										<TD><INPUT name=A1></TD>
										<TD><INPUT name=A2></TD>
										<TD><INPUT name=A3></TD>
										<TD><INPUT name=A4></TD>
										<TD><INPUT name=A5></TD>
										<TD><INPUT name=A6></TD>
										<TD><INPUT name=A7></TD>
										<TD><INPUT name=A8></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>

					<TR>
						<TD>
							<TABLE id=tbBomOpt cellSpacing=0 cellPadding=0 width=700
								align=center border=0>
								<TBODY>
									<TR>
										<TD width=537>
											<a href="/graduation-system2.1/StudentselectionCancel?studentId=<%=studentId %>" style="float:right">取消选择</a>
										</TD>
										<TD width=38></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
	</div>

	</div>
</body>
</html>
