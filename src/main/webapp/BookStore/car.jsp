<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<div class="title"><img src="img/icon1.gif" ><span>购物车内商品：</span></div>
				<div class="car-table">
					<table border="1px" cellspacing="" cellpadding="">
						<tr style="text-align: center;">
							<th style="width: 70%;">书籍名称</th>
							<th>数量</th>
							<th>价格</th>
							<th>小计</th>
						</tr>
						<c:forEach var="che" items="${maps}">
							<tr>
								<td style="text-align: left;">${che.value.name}</td>
								<td>${che.value.count}</td>
								<td>${che.value.price}</td>
								<td>${che.value.sum}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="4">
								<span style="font-weight: bold;">总计：</span>
								<span>${sum}</span>
							</td>
						</tr>
					</table>
					<div style="margin-top: 30px;"><a href="shop.jsp">继续购物</a></div>
					<div style="margin-top: 30px;">
						<input type="button" id="check-out" name="check-out" value="结帐" onclick="window.location.href='order.jsp'" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>