<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String img = "img/advjhtp"+request.getParameter("id")+".jpg";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<title></title>
	</head>
	<body>
	<c:if test="${bbook!=null}">
		<script>alert('加入购物车成功');</script>
		<%
			request.getSession().removeAttribute("bbook");
		%>
	</c:if>
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
				<div class="title"><img src="img/icon1.gif"><a href="shop.jsp">返回</a></div>
				<div class="info">
					<span class="book-title">${book.name}</span>
					<div>
						
						<img width="179px" height="238px" src="img/${book.tp}">
					</div>
					<div class="book-info">
						<ul>
							<li>图书编号：</li>
							<li>价格：</li>
							<li>版本号：</li>
							<li>版权：</li>
						</ul>
						<a href="<%=basePath%>BooKServlet?method=add&id=${book.id}">放入购物车</a>
					</div>
					<div class="book-info">
						<ul>
							<li>${book.id}</li>
							<li>${book.dj}</li>
							<li>1.0</li>
							<li>读书社</li>
						</ul>
						<a href="<%=basePath%>BooKServlet?method=findche">查看购物车</a>
					</div>

				</div>
			</div>
		</div>
		
		<footer>
			<img src="img/bk.gif" >
		</footer>
	</body>
</html>
