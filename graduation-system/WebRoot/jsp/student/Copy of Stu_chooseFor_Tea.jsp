<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
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
	href="/graduation_system/css/main.css">
<link rel="stylesheet" type="text/css"
	href="/graduation_system/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/graduation_system/css/table.css">
<script src="/graduation_system/js/table.js"></script>
<link rel="stylesheet" type="text/css"
	href="/graduation_system/css/window.css">
<script src="/graduation_system/js/window.js"></script>

</head>

<body>
	<div class="body">
		<div class="top">
			<div class="user">
			
			欢迎您，<font color="red">${requestScope.username}</font>|<a href="/graduation_system/jsp/login.jsp">退出</a>
			</div>
			<div class="top-title">毕业设计管理系统</div>

			<div class="menu">
				<ul>
					<li><a class="hide" href="/graduation_system/jsp/student/Main.jsp">返回首页</a></li>
					<li><a class="hide" href="../menu/index.html">课题选题</a></li>
					<li><a class="hide">材料管理</a>
						<ul>
							<li><a href="spies.html" title="a coded list of spies">任务书</a></li>
							<li><a href="vertical.html"
								title="a horizontal vertical menu">论文</a></li>
							<li><a href="expand.html"
								title="an enlarging unordered list">中期检查</a></li>
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
							<li><a href="expand.html"
								title="an enlarging unordered list">信息修改</a></li>
							<li><a href="enlarge.html"
								title="an unordered list with link images">信息删除</a></li>
						</ul></li>
					<li><a class="hide">毕业论文管理</a>
						<ul>
							<li><a
								href="/graduation_system/jsp/student/Stu_chooseFor_Tea.jsp"
								title="A drop down menu">选择导师</a></li>
							<li><a href="../mozilla/cascade.html"
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
										<TD height=25><A id=Bt_selectAll>全选</A></TD>
										<TD></TD>
										<TD>导师</TD>
										<TD>性别</TD>
										<TD>系别</TD>
										<TD>教研室</TD>
										<TD>导师可带学生数</TD>
										<TD>已确认学生数</TD>
										<TD>当前已申请人数</TD>
									</TR>
								</THEAD>

								<TBODY>
									<TR>
										<TD><INPUT class=checkbox type=checkbox value=checkbox
											name=checkbox></TD>
										<TD>1</TD>
										<TD>孔**</TD>
										<TD></TD>
										<TD>计算机系</TD>
										<TD>计算智能</TD>
										<TD>5</TD>
										<TD>5</TD>
										<TD>0</TD>
									</TR>
								</TBODY>

								<TBODY>
									<TR>
										<TD><INPUT class=checkbox type=checkbox value=checkbox
											name=checkbox></TD>
										<TD>2</TD>
										<TD>陈**</TD>
										<TD></TD>
										<TD>计算机系</TD>
										<TD>计算智能</TD>
										<TD>6</TD>
										<TD>5</TD>
										<TD>0</TD>
									</TR>
								</TBODY>

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

								<TBODY>
									<TR>
										<TD><INPUT class=checkbox type=checkbox value=checkbox
											name=checkbox></TD>
										<TD><INPUT name=A1></TD>
										<TD><INPUT name=A2></TD>
										<TD><INPUT name=A3></TD>
										<TD><INPUT name=A4></TD>
										<TD><INPUT name=A5></TD>
										<TD><INPUT name=A6></TD>
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
										<TD width=537><A id=Bt_sendData style="float:right">提交</A></TD>
										<TD width=38></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</div>
		<div align="center">
			<c:choose>
			<c:when test="${page.hasPrePage }">
					<a href="GetMessageList?currentPage=1">首页</a>|
					<a href="GetMessageList?currentPage=${page.currentPage-1 }">上一页</a>
			</c:when>
			<c:otherwise>首页|上一页</c:otherwise>
			</c:choose>
			<c:choose>
					<c:when test="${page.hasNextPage }">
						<a href="GetMessageList?currentPage=${Page.currentPage+1 }">下一页</a>|
						<a href="GetMessageList?currentPage=${Page.totalPage }">尾页</a>
					</c:when>
			<c:otherwise>下一页|尾页</c:otherwise>
			</c:choose>
			当前为第${page.currentPage }页，共${page.totalPage }页
		</div>
	</div>

	</div>
</body>
</html>

