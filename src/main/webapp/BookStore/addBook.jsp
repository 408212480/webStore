<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addBook.jsp</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script>
		setInterval("fun(show_time)",1);
		function fun(timeID){
		var date = new Date(); //创建对象  
		var y = date.getFullYear();//获取年份  
		var m =date.getMonth()+1;//获取月份  返回0-11  
		var d = date.getDate(); // 获取日  
		var w = date.getDay();//获取星期几  返回0-6   (0=星期天) 
		var ww = ' 星期'+'日一二三四五六'.charAt(new Date().getDay()) ;//星期几
		var h = date.getHours();//时
		var minute = date.getMinutes() //分
		var s = date.getSeconds(); //秒
		var sss = date.getMilliseconds() ; //毫秒
		if(m<10){m = "0"+m;}
		if(d<10){d = "0"+d;}
		if(h<10){h = "0"+h;}
		if(minute<10){minute = "0"+minute;}
		if(s<10){s = "0"+s;}
		document.getElementById(timeID.id).innerHTML ="当前时间："+y+"-"+m+"-"+d+" "+ww+" "+h+":"+minute+":"+s;
	}
	</script>
	<style>
	body{
				width: 750px;
				padding: 0;
				margin: 0;
				background-color: #eeeeee;
				font-size: 12px;
				color: #AAAAAA;
			}
			ul,li,a{
				text-decoration: none;
				list-style-type: none;	
				padding: 0;
				margin: 0;
				color: #AAAAAA;
			}
			.header{
				width: 100%;
				height: 30px;
				line-height: 30px;
				background-color: #aaaaaa;
				color: #CCCCCC;
				font-size: 12px;
			}
			.header span{
				margin-left: 20px;
			}
			.wrap{
				display: flex;
				flex-wrap: wrap;
			}
			.menu{
				width: 25%;
				line-height: 30px;
				margin-left: 20px;
			}
			.add{
				width: 70%;
			}
			.menu li{
				width: 80%;
				border-bottom: 1px dashed #bbbbbb;
				
			}
			.title{
				display: flex; 
				height: 50px;
				width: 750px;
			}
			.title .l{
				width: 25%;
				margin-bottom: 5px;
				line-height: 40px;
				padding-left: 20px;
			}
			.title .r{
				width: 75%;
				border-bottom: 2px solid #BBBBBB;
				margin-bottom: 5px;
				line-height: 40px;
			}
			
			.add-form{
				display: flex;
				justify-content: center;
			}
			table{
			font-size: 12px;
			}
			.update{
				width: 175px;
				height: 22px;
				border: 1px solid blue;
				background-color: #ffffff;
			}
			</style>
  </head>

  <body>
		<c:import url="menu.jsp"></c:import>
		
		<c:if test="${ins!=null}">
		<script>alert('添加图书成功');</script>
		<%
			request.removeAttribute("ins");
		%>
		</c:if>
			<div class="add">
			<div class="add-form">
			<form action="BooKServlet?method=insert" method="post" enctype="multipart/form-data">
			<table border="0" cellspacing="" cellpadding="">
			<tr>
				<td>书名:</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>分类:</td>
				<td>
					<select name="fl">
						<option value="文学">文学</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>描述:</td>
				<td><input type="text" name="ms"/></td>
			</tr>
			<tr>
				<td>作者:</td>
				<td><input type="text" name="zz"/></td>
			</tr>
			<tr>
				<td>出版商:</td>
				<td><input type="text" name="cbs"/></td>
			</tr>
			<tr>
				<td>编码:</td>
				<td><input type="text" name="bm"/></td>
			</tr>
			<tr>
				<td>单价:</td>
				<td><input type="text" name="dj"/></td>
			</tr>
			<tr>
				<td>存货量:</td>
				<td><input type="text" name="kcl"/></td>
			</tr>
			<tr>
				<td>图片:</td>
				<td style="border: 1px solid royalblue;background-color: #ffffff;">
					<input type="file" name="file" style="height: 20px;border-width: 1px">
				</td>
			</tr>
			<tr>
				<td>建议:</td>
				<td>
					<select name="">
						<option value="推荐">推荐</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="确定"/></td>
			</tr>
		</table>
		</form>
				</div>
			</div>
		</div>
	</body>
</html>
