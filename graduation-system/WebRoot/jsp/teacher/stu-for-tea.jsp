<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
	<%@page import="com.system.daoImpl.SelectionDAOImpl"%>
	<%@page import="com.system.daoImpl.StudentDAOImpl"%>
	<%@ page import="com.system.bean.Selection"%>
	<%@page import="com.system.bean.Student"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'stu-for-tea.jsp' starting page</title>

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
   		<div class="user">
   			
   				<!--<c:when test="${empty sessionScope.student }">没有进行身份识别，请先进行身份识别</c:when>  -->
   				欢迎您，<font color="red">${sessionScope.teacher.name }</font>|<a href="/graduation-system2.1/jsp/login.jsp">退出</a>
   			
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
					</ul>
				<!-- clear the floats if required -->
			</div>
		</div>
    </div>
	<div class="main">
		<div class="main-top">当前位置--选择学生：</div>
		<div class="main-show">
			<!-- 代码 开始 -->
			<TABLE id=tbBackground cellSpacing=0 cellPadding=0 width=760
				align=center border=0>
				<TBODY>
					<TR>
						<TD><span style="font-size: 20pt; color: #ff3333">学生选择</TD>
					</TR>
					<TR>
						<TD>
							<TABLE id=tbData cellSpacing=1 cellPadding=0 width=750
								align=center border=0>
								<THEAD>
									<TR>
										<TD></TD>
										<TD>姓名</TD>
										<TD>学号</TD>
										<TD>排名</TD>
										<TD>具体信息</TD>
										<TD>关闭</TD>
										<TD>确认</TD>
									</TR>
								</THEAD>
								
								
								<%
										String teacherId = session.getAttribute("username").toString();
										SelectionDAOImpl teaSelection =new SelectionDAOImpl();
										List<Selection>stuSele = teaSelection.findAllStudentselection(teacherId);
										
										int stuseleTotal=1;
										if(stuSele!=null&&stuSele.size()>0)
										{
											for(int i=0;i<stuSele.size();i++)
											{
												StudentDAOImpl student = new StudentDAOImpl();
												String stuId = stuSele.get(i).getStudentId();
												Student stu = student.findStudentById(stuId);
												String stuName = stu.getName();
								%>
								<TBODY>
									<TR>
										<TD><%=stuseleTotal %></TD>
										<TD><%=stuName%></TD>
										<TD><%=stuId%></TD>
										<TD>20%</TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="show('fd');return false;">
													[浏览] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
												<div class="content"><%=stu.getIntroduce() %></div>
											</div></TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="closeed('fd');return false;">
													[关层] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
												<div class="content"><%=stu.getIntroduce() %></div>
											</div></TD>
											<TD><!-- studentId=<%=stuId%>&teacherId=${sessionScope.teacher.teacherId} -->
											<a href="/graduation-system2.1/TeacherselectionInsert?studentId=<%=stuId%>&teacherId=${sessionScope.teacher.teacherId}">确认选择</a>
											
									</TR>
								</TBODY>
								
								<%
											stuseleTotal++;
											}
										}
								%>

								<TBODY>
									<TR>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
											<TD></TD>
											
									</TR>
								</TBODY>

								<TBODY>
									<TR>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>

					<!-- 
					<TR>
						<TD>
							<TABLE id=tbBomOpt cellSpacing=0 cellPadding=0 width=700
								align=center border=0>
								<TBODY>
									<TR>
										<TD width=537><A id=Bt_allclear>清空所有</A></TD>
										<TD width=537><A id=Bt_sendData>提交</A></TD>
										<TD width=38></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					 -->
				</TBODY>
			</TABLE>
		</div>
		
		
		<div class="main-show">
			<!-- 代码 开始 -->
			<TABLE id=tbBackground cellSpacing=0 cellPadding=0 width=760
				align=center border=0>
				<TBODY>
					<TR>
						<TD><span style="font-size: 20pt; color: #ff3333">已确定学生</TD>
					</TR>
					<TR>
						<TD>
							<TABLE id=tbData cellSpacing=1 cellPadding=0 width=750
								align=center border=0>
								<THEAD>
									<TR>
										<TD></TD>
										<TD>姓名</TD>
										<TD>学号</TD>
										<TD>排名</TD>
										<TD>具体信息</TD>
										<TD>关闭</TD>
										<TD>确认</TD>
									</TR>
								</THEAD>
								
								
								<%
										SelectionDAOImpl teaDecide =new SelectionDAOImpl();
										List<Selection>teaSele = teaDecide.findAllTeacherselection(teacherId);
										
										if(teaSele!=null&&teaSele.size()>0)
										{
											int teaSeleTotal = 1;
											for(int j=0;j<teaSele.size();j++)
											{
												StudentDAOImpl student = new StudentDAOImpl();
												Student stu = student.findStudentById(teaSele.get(j).getStudentId());
												String stuName = stu.getName();
												String stuId = stu.getStudentId();
								%>
								<TBODY>
									<TR>
										<TD><%=teaSeleTotal %></TD>
										<TD><%=stuName%></TD>
										<TD><%=stuId%></TD>
										<TD>20%</TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="show('fd');return false;">
													[浏览] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
												<div class="content"><%=stu.getIntroduce() %></div>
											</div></TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="closeed('fd');return false;">
													[关层] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
											</div></TD>
											<TD><a href="/graduation-system2.1/TeacherselectionCancel?studentId=<%=stuId%>">取消确认</a>
									</TR>
								</TBODY>
								
								<%
								teaSeleTotal++;
											}
										}
								%>

								
								<TBODY>
									<TR>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
										<TD></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>

				</TBODY>
			</TABLE>
		</div>
	</div>

</body>
</html>
