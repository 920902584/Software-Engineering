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
<style type="text/css">
.a{ width:30%; height:100%; margin-right:20%; float:right;}
.b{ width:30%; height:100%; margin-left:20%; float:left;}
</style>
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
    	<div class="main-top">当前位置--学生信息：</div>
        <div class="main-show">
        	<form action="<%=request.getContextPath()%>/DoUpdateInfo" method="post">
        	<div class="b">
        	<input id="infoURL" name="infoURL" type="hidden" value="/jsp/secretary/stuInfo.jsp">
        	<br /><br /><br />
        	<%
        		String studentId;
        		if((String)request.getAttribute("stuId")!=null){
        			studentId=(String)request.getAttribute("stuId");
        		}else{
        			studentId = request.getParameter("studentId");
        		}
        		Student stu = new StudentDAOFactory().getStudentAOInstance().findStudentById(studentId);
        	%>
        		<table>
            		<tr><td width="40%"><span>学号</span></td><td><input type="text" name="studentId" value="<%=stu.getStudentId()%>" /></td></tr>
                	<tr><td><span>&nbsp </span></td><td>&nbsp </td></tr>
               		<tr><td><span>姓名</span></td><td><input type="text" name="name" value="<%=stu.getName()%>" /></td></tr>
                	<tr><td><span>性别</span></td><td><input type="text" name="sex" value="<%=stu.getSex()%>"/></td></tr>
                	<tr><td><span>年级</span></td><td><input type="text" name="grade" value="<%=stu.getGrade()%>"/></td></tr>
                	<tr><td><span>专业</span></td><td><input type="text" name="profession" value="<%=stu.getProfession()%>"/></td></tr>
                	<tr><td><span>专业方向</span></td><td><input type="text" name="majorField" value="<%=stu.getMajorField()%>"/></td></tr>
                	<tr><td><span>联系电话</span></td><td><input type="text" name="telephone" value="<%=stu.getTelephone()%>"/></td></tr>
                	<tr><td><span>邮箱</span></td><td><input type="text" name="mailbox" value="<%=stu.getMailbox()%>"/></td></tr>
                	<tr><td><span>密码</span></td><td><input type="text" name="password" value="<%=stu.getPassword()%>"/></td></tr>
                	<tr><td><span>大一绩点</span></td><td><input type="text" name="freshmanPoint" value="<%=stu.getFreshmanPoint()%>"/></td></tr>
                	<tr><td><span>大二绩点</span></td><td><input type="text" name="sophomorePoint" value="<%=stu.getSophomorePoint()%>"/></td></tr>
            	 </table>
       		</div>
        	<div class="a">
        	<br /><br /><br />
        	<table>
       				<tr><td><span>&nbsp </span></td><td>&nbsp </td></tr>
                	<tr><td><span>&nbsp </span></td><td>&nbsp </td></tr>
						<script>
						function warm() {
								if (confirm("你确定更改该学生信息吗？")) {
									document.getElementById("change").type="submit";
								} 
							}
						</script>
						<tr><td width="35%"><span>自我介绍</span></td><td><textarea name="introduce" cols="30" rows="6" readonly="readonly"><%=stu.getIntroduce()%></textarea></td></tr>
             </table>
             	<button type="button" style="float:right; width:80px; margin-top:100px" onclick="window.location.href='/graduation-system2.1/jsp/secretary/stuListView.jsp'">返回</button>
             	<button type="button" style="float:right; width:80px; margin-top:100px; visibility:hidden"></button>
             	<button type="button" id="change" style="float:right; width:80px; margin-top:100px" onclick="warm()">更改</button>
        	</div>
        </form>
        </div>
    </div>
</body>
</html>
