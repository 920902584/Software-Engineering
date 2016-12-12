<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="com.system.daoImpl.StudentDAOImpl"%>
<%@page import="com.system.bean.Student"%>
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
		<div class="main-top">当前位置--学生个人信息：</div>
		<div class="main-show">
			<table border="0" align="center" cellpadding="0">
				<form action="DoUpdateInfo" method="post">
					<%
						Student stu = new StudentDAOImpl().findStudentById(studentId);
					%>
					<div>
					<input id="infoURL" name="infoURL" type="hidden" value="/jsp/student/Stu_Info.jsp">
					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>学号:</span> <input id="studentId" type="text"
								name="studentId" placeholder="学号" readonly="readonly"
								value="<%=stu.getStudentId()%>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>姓名:</span> <input id="name" name="name" type="text" placeholder="姓名"
								readonly="readonly" value="<%=stu.getName()%>" />
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>年级:</span> <input id="grade" name="grade" type="text" placeholder="年级"
								readonly="readonly" value="<%=stu.getGrade()%>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><span>性别:</span>
							<input id="sex" name="sex" type="text" placeholder="性别" readonly="readonly"
							value="<%=stu.getSex()%>"></td>
						<br />
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>专业:</span> <input id="profession" name="profession" type="text"
								placeholder="专业" readonly="readonly"
								value="<%=stu.getProfession()%>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>专业方向:</span> <input id="majorField" name="majorField" type="text"
								placeholder="专业方向" readonly="readonly"
								value="<%=stu.getMajorField()%>" />
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>联系电话:</span> <input id="telephone" type="text"
								name="telephone" placeholder="联系电话"
								value="<%=stu.getTelephone()%>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>邮箱:</span> <input id="mailbox" type="text" name="mailbox"
								placeholder="邮箱" value="<%=stu.getMailbox()%>" />
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>原密码:</span> <input id="password" type="text"
								placeholder="原密码" readonly="readonly"
								value="<%=stu.getPassword()%>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>新密码:</span> <input id="password" type="text"
								name="password" placeholder="你要设置新密码吗？" />
						</label></td>
					</tr>
					
						<tr>
							<td colspan="2">
								<div align="center">
									自我介绍<br>
									<textarea id="introduce" name="introduce" cols="100" rows="4" ><%=stu.getIntroduce()%></textarea>
								</div>
							</td>
						</tr>
					</div>

					<div style="height:30px; line-height:30px;text-align:center;">
						<input type="submit" size="50" value="提交" width="100"
							style="width:100px" />
					</div>
				</form>
			</table>
		</div>
	</div>
	</div>
</body>
</html>
