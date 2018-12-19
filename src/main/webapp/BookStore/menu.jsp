<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="header">
			<span>欢迎您: admin</span>
			<span id="show_time"></span>
		</div>
		<div class="wrap">
			<div class="title">
				<div class="l">
					<span id="spgl">
						商品管理
					</span>
				</div>
				<div class="r">
					<span>商品添加</span>
				</div>
			</div>
			<div class="menu">
				<ul>
					<li><a href="BooKServlet?method=bookList">
						商品列表
					</a></li>
					<li><a href="BookStore/addBook.jsp">
						商品添加
					</a></li>
					<li><a href="BooKServlet?method=getAllOrder">
						订单查询
					</a></li>
					<li><a href="BookStore/addBook.jsp">
						返回主页
					</a></li>
				</ul>
			</div>