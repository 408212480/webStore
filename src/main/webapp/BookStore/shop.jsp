<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<title></title>
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
				<div class="title"><img src="img/icon1.gif" ><span>图书列表</span></div>
				<div class="product">
					
					<c:forEach var="book" items="${books}">
						<a href="<%=basePath%>BooKServlet?method=getBookInfo&id=${book.id}">
						<div class="book">
							<span>${book.name}</span>
							<img src="img/${book.tp}" >
						</div>
					</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>
