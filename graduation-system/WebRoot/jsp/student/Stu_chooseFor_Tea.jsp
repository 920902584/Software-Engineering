<%@ page language="java" import="java.util.*" 
	contentType="text/html; charset=utf-8"%>
<%@ page import="com.system.dao.TeacherDAO"%>
<%@ page import="com.system.daoImpl.TeacherDAOImpl"%>
<%@ page import="com.system.daoImpl.SelectionDAOImpl"%>
<%@ page import="com.system.bean.Teacher"%>
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


<title>My JSP 'Stu_chooseFor_Tea.jsp' starting page</title>

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

<script type="text/javascript">

function f(){
	var con;
	con=confirm("你喜欢玫瑰花么?"); //在页面上弹出对话框
	if(con==true)alert("非常喜欢!");
	else alert("不喜欢!");

}
function checkUser(){
	var con;
	con=confirm("你确定选择该老师吗?"); //在页面上弹出对话框
	if(con==true)document.getElementById("formid").submit();
	}

</script>
</head>

<body>
<div class="body">
	<div class="top">
   		<div class="user">
   		欢迎您，<font color="red">${sessionScope.student.name }</font>|<a href="/graduation-system2.1/jsp/login.jsp">退出</a>
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
		<div class="main-top">当前位置--导师选择：</div>
		<div class="main-show">
			<!-- 代码 开始 -->
			<DIV id=divFoltupDiv>
				<P>
					<IMG alt=Loading src=""> 发送数据
				</P>
				<P id=sendokBiginf></P>
				<P id=sendokinf></P>
			</DIV>
			
		<!--  <form id="formid" action="/graduation-system2.1/StudentselectionInsert" method="post">-->
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
										<TD></TD>
										<TD>导师</TD>
										<TD>性别</TD>
										<TD>邮箱</TD>
										<TD>教研室</TD>
										<TD>导师可带学生数</TD>
										<TD>已确认学生数</TD>
										<TD>当前已申请人数</TD>
										<TD>是否选择</TD>
									</TR>
								</THEAD>
								<%
									TeacherDAOImpl teacherDao = new TeacherDAOImpl();
									SelectionDAOImpl studentselectionDAO = new SelectionDAOImpl();
									List<Teacher> teachers = teacherDao.findAllTeacher();
									
									//String studentId =session.getAttribute("username").toString();
									//String studentId = request.getParameter("username"); // 接收学生ID参数
								
									int teaTotal=1;
									if(teachers!=null&&teachers.size()>0)
									{
								   			for(int i=0;i<teachers.size();i++)
								 		  	{
								   				Teacher teacher = teachers.get(i);
								   				if(teacher.getConfirmedOfStu2014() >=teacher.getNumberOfStu2014())
								   					continue;
								%>
								<!-- 教师信息循环开始 -->
								<TBODY>
									<TR>
										<TD><%= teaTotal%></TD>
										<TD>
											<%=teacher.getName() %>
										</TD>
										<TD><%=teacher.getSex() %></TD>
										<TD><%=teacher.getMailbox() %></TD>
										<TD><%=teacher.getDirection() %></TD>
										<TD><%=teacher.getNumberOfStu2014() %></TD>
										<TD><%=teacher.getConfirmedOfStu2014() %></TD>
										<TD><%=teacher.getAppliedOfStu2014() %></TD>
										<TD>
										<!--<input type="text" name="teaTotal" value=<%=teaTotal%>  style="visibility:hidden;width:0px;" />
										<input type="text" name="studentId" value="${sessionScope.student.studentId}"  style="visibility:hidden;width:0px;" />
										<input type="text" name="teacherId<%=teaTotal%>" value=<%=teacher.getTeacherId()%> style="visibility:hidden;width:0px;" />
										<!--<input type="submit" value="选择"tabindex="4">-->
										
										<!--<input type="button" value="选择" onclick = "checkUser();" />-->
										
										<!--<a href="/jsp/student/student_decide.html?action=/graduation-system2.1/StudentselectionInsert&studentId=${sessionScope.student.studentId}&teacherId=<%=teacher.getTeacherId()%>">选择</a>-->
										<a href="/graduation-system2.1/StudentselectionInsert?teacherId=<%=teacher.getTeacherId()%>&studentId=${sessionScope.student.studentId}">选择</a>
										
										</TD>
									</TR>
								</TBODY>
								<!-- 循环结束 -->
								<%
										teaTotal++;
										} 
									}
										%>	
								
								<!-- 
								<TBODY>
									<TR>
										<TD><INPUT class=checkbox type=checkbox value=checkbox
											name=checkbox></TD>
										<TD>王然</TD>
										<TD>10503201XXX</TD>
										<TD>20%</TD>
										<TD>校优秀干部</TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="show('fd');return false;">
													[浏览] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
											</div></TD>
										<TD><div id="bodyL">
												<a href="#" class="od" onclick="closeed('fd');return false;">
													[关层] </a>
											</div>
											<div id="fd"
												style="display:none;filter:alpha(opacity=100);opacity:1;">
												<div class="content">学生详细消息</div>
											</div></TD>
									</TR>
								</TBODY>
								 -->

								<TBODY>
									<TR>
										<TD><INPUT name=A0></TD>
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

					<!-- 
					<TR>
						<TD>
							<TABLE id=tbBomOpt cellSpacing=0 cellPadding=0 width=700
								align=center border=0>
								<TBODY>
									<TR>
										<TD width=537><A id=Bt_sendData style="float:right">提交</A></TD>
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
	</div>
<!-- </form>
	</div> -->
</body>
</html>

