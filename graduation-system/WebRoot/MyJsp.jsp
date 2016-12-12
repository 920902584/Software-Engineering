<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

	<%@page import="com.system.daoImpl.StudentDAOImpl"%>
	<%@page import="com.system.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
					String studentId =session.getAttribute("username").toString();
					%>
    	<form action="DoUpdateInfo" method="post">
    	<%
						Student stu = new StudentDAOImpl().findStudentById(studentId);
				%>
					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>学号:</span> <input id="studentId" type="text" name="studentId"
								placeholder="学号" readonly="readonly" value="<%=stu.getStudentId() %>" />
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>姓名:</span> <input id="name" type="text" 
								placeholder="姓名" readonly="readonly" value="<%=stu.getName()%>"/>
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>年级:</span> <input id="grade" type="text" 
								placeholder="年级" readonly="readonly" value="<%=stu.getGrade()%>"/>
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><span>性别:</span>
							<input id="sex" type="text"  placeholder="性别"
							readonly="readonly" value="<%=stu.getSex()%>"></td>
						<br />
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>专业:</span> <input id="profession" type="text" 
								placeholder="专业" readonly="readonly" value="<%=stu.getProfession()%>"/>
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>专业方向:</span> <input id="majorField" type="text"
								 placeholder="专业方向" readonly="readonly" value="<%=stu.getMajorField()%>"/>
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>联系电话:</span> <input id="telephone" type="text" name="telephone"
								placeholder="联系电话" value="<%=stu.getTelephone()%>"/>
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>邮箱:</span> <input id="mailbox" type="text" name="mailbox"
								placeholder="邮箱" value="<%=stu.getMailbox()%>"/>
						</label></td>
					</tr>

					<tr>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>原密码:</span> <input id="password" type="text" 
								placeholder="原密码" readonly="readonly" value="<%=stu.getPassword()%>"/>
						</label></td>
						<td align="center" style="border:1px solid #A9BAFC"><label>
								<span>新密码:</span> <input id="password" type="text" name="password"
								placeholder="你要设置新密码吗？" />
						</label></td>
					</tr>
					
    	<div style="height:30px; line-height:30px;text-align:center;"><input type="submit" size="50" value="提交" width="100" style="width:100px"/>
    	</form>
  </body>
</html>
