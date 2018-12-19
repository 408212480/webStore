<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Insert title here</title>
</head>
<body>
	<header>
			<div class="header-l">
				<a href="http://localhost:8080/BookStore/"><img src="img/logo.jpg"></a>
			</div>
			<div class="header-r">
				<ul>
					<li><img src="img/top1.jpg" alt=""></li>
					<li><img src="img/top2.jpg" alt=""></li>
					<li><img src="img/top3.jpg" alt=""></li>
					<li><img src="img/top4.jpg" alt=""></li>
				</ul>
			</div>
		</header>
		<div class="banner">
			<img src="img/bn01.jpg" alt="">
		</div>
		<div class="article">
			<div class="art-l">
				
			</div>
			<div class="art-r">
				<div class="title"><img src="img/icon1.gif" ><span>填写订单</span></div>
				<div class="user-info">
					<form action="<%=basePath%>BooKServlet?method=addOrder" method="post">  		
						<span style="font-weight: bold;text-align: center;">请输入您的个人信息：</span>
						<span>姓名：<input type="text" name="uname" /></span>
						<span>地址：<input type="text" name="uaddr"  /></span>
						<span>邮编：<input type="text" name="uposcode" style="width: 55px;"/></span>
						<span>
							电话：(<input type="text" name="tel1"  style="width: 35px;"/>)
							<input type="text" name="tel2"  style="width: 35px;"/>-
							<input type="text" name="tel3" style="width: 35px;"/>
						</span>
						<!-- <span style="text-align: center;"><a href="checkOut.jsp">提交</a></span> -->
						<input type="submit" value="提交">
					</form>	
				</div>
			</div>
		</div>
</body>
</html>