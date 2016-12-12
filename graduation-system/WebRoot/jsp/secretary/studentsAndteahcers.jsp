<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import ="java.text.SimpleDateFormat" %>
<%@page import="com.system.daoImpl.AnnouncementDAOImpl"%>
<%@page import="com.system.bean.Announcement"%>
<%@page import="com.system.bean.Student"%>
<%@page import="com.system.bean.Teacher"%>
<%@page import="com.system.bean.Selection"%>
<%@page import="com.system.daoImpl.SelectionDAOImpl"%>
<%@page import="com.system.daoImpl.StudentDAOImpl"%>
<%@page import="com.system.daoImpl.TeacherDAOImpl"%>
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

<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/main.css">
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/tab.css">
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/twoTab.css">
<link rel="stylesheet" type="text/css"
	href="/graduation-system2.1/css/twoTab1.css">

<script type="text/javascript">
	var myclick = function(v) {
		var llis = document.getElementsByTagName("li");
		for ( var i = 0; i < llis.length; i++) {
			var lli = llis[i];
			if (lli == document.getElementById("tab" + v)) {
				lli.style.backgroundColor = "orange";
			} else {
				lli.style.backgroundColor = "#FFF";
			}
		}

		var divs = document.getElementsByClassName("tab_css");
		for ( var i = 0; i < divs.length; i++) {

			var divv = divs[i];

			if (divv == document.getElementById("tab" + v + "_content")) {
				divv.style.display = "block";
			} else {
				divv.style.display = "none";
			}
		}

	}
</script>
</head>

<body>
	<div class="body">
		<div class="top">
			<div class="user">
				<!--<c:when test="${empty sessionScope.student }">没有进行身份识别，请先进行身份识别</c:when>  -->
				欢迎您，<font color="red">${sessionScope.secretary.name }</font>|<a
					href="/graduation-system2.1/jsp/secretary/login.jsp">退出</a>
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
		<div class="main-top">当前位置--互选情况管理：</div>
		<div class="main-show">
			<div id="content">
				<div id="tab_bar">
					<ul>
						<li id="tab1" onclick="myclick(1)"
							style="background-color: orange">师生互选情况</li>
						<li id="tab2" onclick="myclick(2)">学生管理</li>
						<li id="tab3" onclick="myclick(3)">教师管理</li>
					</ul>
				</div>
				<div class="tab_css" id="tab1_content" style="display: block">
					<div>
						<br />
						<table border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">学号</td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">姓名</td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">所选导师教师号</td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">导师姓名</td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">状态</td>
								<%
                	SelectionDAOImpl slDao = new SelectionDAOImpl();
                	List<Selection> selections = slDao.findAllSelection();
                	int total = 1;
                	if(selections!=null&&selections.size()>0)
                	{
                		for(int i=0;i<selections.size();i++)
                		{
                			Selection sel = selections.get(i);
                			Student stu = new StudentDAOImpl().findStudentById(sel.getStudentId());
                			Teacher tea = new TeacherDAOImpl().findTeacherById(sel.getTeacherId());
                			String noStatus = "未确认";
							String yesStatus = "已确认";
                %>
							
							<tr>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"><%=total %></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"><%=stu.getStudentId() %></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"><%=stu.getName() %></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"><%=tea.getTeacherId() %></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center"><%=tea.getName() %></td>
								<td style="border:2px solid #A9BAFC" width="150px"
									align="center">
									<%if (sel.getStatus()==1)
										{
										%> <font color="green"><%=yesStatus %> <%} %> <%if (sel.getStatus()==0)
										{
										%> <font color="red"><%=noStatus %> <%} %>
								</td>
							</tr>
							<%
                    total++;
                    	}
                	}
                    %>
						</table>
					</div>
				</div>
				<div class="tab_css" id="tab2_content">
					<div class="container">
						<div class="tab-container">
							<input type="radio" name="name" value="" id="tab-btn-1" class="tab-radio" checked="checked" /> 
							<label for="tab-btn-1" class="tab-lable">显示全部</label>
							<div class="content">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">学号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">所选导师教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">导师姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">状态</td>
									</tr>
									<%
										List<Student> students = new StudentDAOImpl().findAllStudent();
										if(students!=null&&students.size()>0){
											for(int i=0;i<students.size();i++){
												Student stu = students.get(i);
												String noStatus = "未确认";
												String yesStatus = "已确认";
												Selection sel = new SelectionDAOImpl().findStudentselectionById(stu.getStudentId());
												if(sel!=null){
													Teacher tea = new TeacherDAOImpl().findTeacherById(sel.getTeacherId());
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=sel.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">
										<%if (sel.getStatus()==1)
										{
										%> <font color="green"><%=yesStatus %> <%} %> <%if (sel.getStatus()==0)
										{
										%> <font color="red"><%=noStatus %> <%} %></td>
									</tr>
									<%		
												}
												else{
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><font color="orange">未选择 </td>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>

							<input type="radio" name="name" value="" id="tab-btn-2" class="tab-radio" /> 
							<label for="tab-btn-2" class="tab-lable">显示已确认学生</label>
							<div class="content">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">学号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">所选导师教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">导师姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">状态</td>
									</tr>

									<%
										List<Student> YesStudents = new StudentDAOImpl().findAllStudent();
										if(students!=null&&students.size()>0){
											for(int i=0;i<YesStudents.size();i++){
												Student stu = YesStudents.get(i);
												Selection sel = new SelectionDAOImpl().findStudentselectionById(stu.getStudentId());
												if(sel!=null&&sel.getStatus()==1){
													Teacher tea = new TeacherDAOImpl().findTeacherById(sel.getTeacherId());
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=sel.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><font color="green">已确认</td>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>

							<input type="radio" name="name" value="" id="tab-btn-3" class="tab-radio" /> 
							<label for="tab-btn-3" class="tab-lable">显示未确认学生</label>
							<div class="content">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">学号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">所选导师教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">导师姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">状态</td>
									</tr>

									<%
										List<Student> NoStudents = new StudentDAOImpl().findAllStudent();
										if(students!=null&&students.size()>0){
											for(int i=0;i<NoStudents.size();i++){
												Student stu = NoStudents.get(i);
												Selection sel = new SelectionDAOImpl().findStudentselectionById(stu.getStudentId());
												if(sel!=null&&sel.getStatus()==0){
													Teacher tea = new TeacherDAOImpl().findTeacherById(sel.getTeacherId());
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=sel.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><font color="red">未确认</td>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>
							
							<input type="radio" name="name" value="" id="tab-btn-4" class="tab-radio" /> 
							<label for="tab-btn-4" class="tab-lable">显示未选择学生</label>
							<div class="content">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">学号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
									</tr>

									<%
										List<Student> NeverStudents = new StudentDAOImpl().findAllStudent();
										if(students!=null&&students.size()>0){
											for(int i=0;i<NeverStudents.size();i++){
												Student stu = NeverStudents.get(i);
												Selection sel = new SelectionDAOImpl().findStudentselectionById(stu.getStudentId());
												if(sel==null){
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getName() %></td>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>
							
						</div>
					</div>
				</div>
				<div class="tab_css" id="tab3_content">
					<div class="container">
						<div class="tab-container">
							<input type="radio" name="name1" value="" id="tab-btn-11" class="tab-radio1" checked="checked" /> 
							<label for="tab-btn-11" class="tab-lable1">显示全部</label>
							<div class="content1">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">该年可选学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">已确认学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">当前申请学生数</td>
									</tr>
									<%
										List<Teacher> teachers = new TeacherDAOImpl().findAllTeacher();
										if(teachers!=null&&teachers.size()>0){
											for(int i =0;i<teachers.size();i++){
												Teacher tea = teachers.get(i);
												Selection sel = new SelectionDAOImpl().findTeacherselectionById(tea.getTeacherId());
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getNumberOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getConfirmedOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getAppliedOfStu2014() %></td>
									</tr>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">↑ 该教师已确认学生</td>
										<%
										SelectionDAOImpl teaDecide =new SelectionDAOImpl();
										List<Selection>teaSele = teaDecide.findAllTeacherselection(tea.getTeacherId());
										
										if(teaSele!=null&&teaSele.size()>0)
										{
											int teaSeleTotal = 1;
											for(int j=0;j<teaSele.size();j++)
											{
												StudentDAOImpl student = new StudentDAOImpl();
												Student stu = student.findStudentById(teaSele.get(j).getStudentId());
										%>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %> - <%=stu.getName() %></td>
										<%
											}
										}
										%>
									</tr>
									<%
											}
										}
									%>
								</table>
							</div>

							<input type="radio" name="name1" value="" id="tab-btn-21"class="tab-radio1" /> 
							<label for="tab-btn-21" class="tab-lable1">显示未满额导师</label>
							<div class="content1">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">该年可选学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">已确认学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">当前申请学生数</td>
									</tr>
									<%
										List<Teacher> YesTeachers = new TeacherDAOImpl().findAllTeacher();
										if(YesTeachers!=null&&YesTeachers.size()>0){
											for(int i =0;i<YesTeachers.size();i++){
												Teacher tea = YesTeachers.get(i);
												Selection sel = new SelectionDAOImpl().findTeacherselectionById(tea.getTeacherId());
												if(tea.getNumberOfStu2014()>tea.getConfirmedOfStu2014() ){
													
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getNumberOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getConfirmedOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getAppliedOfStu2014() %></td>
									</tr>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">↑ 该教师已确认学生</td>
										<%
										SelectionDAOImpl teaDecide =new SelectionDAOImpl();
										List<Selection>teaSele = teaDecide.findAllTeacherselection(tea.getTeacherId());
										
										if(teaSele!=null&&teaSele.size()>0)
										{
											int teaSeleTotal = 1;
											for(int j=0;j<teaSele.size();j++)
											{
												StudentDAOImpl student = new StudentDAOImpl();
												Student stu = student.findStudentById(teaSele.get(j).getStudentId());
										%>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %> - <%=stu.getName() %></td>
										<%
											}
										}
										%>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>

							<input type="radio" name="name1" value="" id="tab-btn-31" class="tab-radio1" /> 
							<label for="tab-btn-31" class="tab-lable1">显示满额导师</label>
							<div class="content1">
								<table border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">教师号</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">姓名</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">该年可选学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">已确认学生数</td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">当前申请学生数</td>
									</tr>
									<%
										List<Teacher> NoTeachers = new TeacherDAOImpl().findAllTeacher();
										if(NoTeachers!=null&&NoTeachers.size()>0){
											for(int i =0;i<NoTeachers.size();i++){
												Teacher tea = NoTeachers.get(i);
												Selection sel = new SelectionDAOImpl().findTeacherselectionById(tea.getTeacherId());
												if(tea.getNumberOfStu2014()<=tea.getConfirmedOfStu2014() ){
													
									%>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getTeacherId() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getName() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getNumberOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getConfirmedOfStu2014() %></td>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=tea.getAppliedOfStu2014() %></td>
									</tr>
									<tr>
										<td style="border:2px solid #A9BAFC" width="150px" align="center">↑ 该教师已确认学生</td>
										<%
										SelectionDAOImpl teaDecide =new SelectionDAOImpl();
										List<Selection>teaSele = teaDecide.findAllTeacherselection(tea.getTeacherId());
										
										if(teaSele!=null&&teaSele.size()>0)
										{
											int teaSeleTotal = 1;
											for(int j=0;j<teaSele.size();j++)
											{
												StudentDAOImpl student = new StudentDAOImpl();
												Student stu = student.findStudentById(teaSele.get(j).getStudentId());
										%>
										<td style="border:2px solid #A9BAFC" width="150px" align="center"><%=stu.getStudentId() %> - <%=stu.getName() %></td>
										<%
											}
										}
										%>
									</tr>
									<%
												}
											}
										}
									%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
