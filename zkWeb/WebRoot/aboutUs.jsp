<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
	<style type="text/css">
		*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;line-height: 60px;margin-left: 10px;text-align: center;}
		.login{margin-left: 480px;border-right:1px solid gray}
		.bigbar{position: relative;}
		.bigbar a:hover{color: white;background: black;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87}
		.bigbar a:visited {background: black;}
		.about{background: black;}
	</style>
</head>
<body>
<div class="bigbar">
		<a href="" class="page first"> 首页</a>
		<a href="" class="page">社区</a>
		<a href="" class="page">我的订单</a>
		<a href="" class="page about">About us</a>
		<a class="page"><img src="img/logos.png" width="75" height="45" style="padding-top:10px"></a>
		<a href="" class="page login">登录</a>
		<a href="" class="page regist">注册</a>
	</div>
<div style="background: rgba(0,0,0,0.4);width:100%;height:600px;position:absolute;color:#fff;z-index:9999;left:0;top:65px;">

</div>
<div style="color:white;font-weight:500;font-size:25px;width:100%;height:600px;background: url('img/city.jpg');background-size: 100%;left:0;top:65px;position:absolute;z-index:9">
	<br>
	<div style="margin-left:150px;margin-top:50px;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87">
		<p style="margin-left:40px">曾经，我们都对外面的世界充满了好奇</p><br>
		<p style="margin-left:120px">而今天,  我们打开了这扇好奇的窗</p><br>
		<p style="margin-left:30px">关于Cofee团队，共由6名志同道合的成员组成</p><br>
		<p style="margin-left:160px">如果您发现我们的网站的瑕疵，请尽快<b style="color:purple;cursor:pointer">联系我们</b></p><br>
		<p style="margin-left:190px">如果您也热衷于技术，并愿意<b style="color:purple;cursor:pointer">加入我们</b></p><br>
		<p style="margin-left:210px">我们将很快会联系你,很欢迎新成员的加入</p>
	</div>
</div>
	<div style="margin-top: 720px;margin-left:60px;width:90%;height:70px;line-height:70px;color:gray;text-align: center">
		<hr>
		&copy版权所有，翻版必究，咖啡网由Coffee团队制作<img alt="" src="img/logos.png" width="75" height="45" > 最终解释权归Coffee团队所有&nbsp&nbsp|&nbsp&nbsp<a href="">联系我们</a>
		</div>
</body>
</html>
