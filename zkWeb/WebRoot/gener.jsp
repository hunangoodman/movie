<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'gener.jsp' starting page</title>
	<style type="text/css">
		*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;cursor:pointer;line-height: 60px;margin-left: 10px;text-align: center;}
		.genrel{background: black;}
		.login{margin-left: 400px;border-right:1px solid gray}
		.bigbar{position: relative;}
		.bigbar a:hover{color: white;background: black;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87}
		.bigbar a:visited {background: black;}
		.lei{text-shadow:0 0 0.22em #f87,-0 -0  0.2em black;font-size:22px;margin-top:130px}
		.lei div{line-height: 70px}
		.lei div:hover{border-bottom: 3px solid #00BFFF;}
	.pics img:hover{box-shadow:-2px 0px 9px #f00,0px -2px 9px #000,0px 2px 9px #9e038a,2px 0px 9px #0f0;width:104px;height:140px;}
	</style>
	<script type="text/javascript">
	window.onload=function(){
		var diy=document.getElementsByClassName("diy");
		for(var i=0;i<diy.length;i++){
			diy[i].onclick=function(){
				location.href="MovieManager?method=findByGener&gener="+this.innerHTML;
			}	
		}
	}
	
	</script>
  </head>
  
  <body>
  <div class="bigbar">
		<a href="" class="page first"> 首页</a>
		<a class="page genrel">筛选</a>
		<a href="" class="page">我的订单</a>
		<a href="" class="page">About us</a>
		<a class="page"><img src="img/logos.png" width="75" height="45" style="padding-top:10px"></a>
		<a href="" class="page login">登录</a>
		<a href="" class="page regist">注册</a>
	</div>
	
	<div style="background: rgba(0,0,0,0.5);width:100%;height:120px;position:absolute;color:#fff;z-index:99;left:0;top:90px;">

	</div>
	<c:forEach items="${will }" var="item">
	<div style="width:100%;height:120px;position:absolute;top:90px;text-align:center;
	font-size:50px;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87;
	background: url('${item.key}') no-repeat;background-size: 100%;z-index:9;line-height: 120px">
			${gener }  系    列
	</div>
	</c:forEach>
	<div class="lei"><!--下拉问题-->
		<div class="page diy">惊悚</div><div class="page diy">战争</div><div class="page diy">动作</div>
	<div class="page diy">爱情</div><div class="page diy">青春</div><div class="page diy">古装</div>
	<div class="page diy">冒险</div><div class="page diy">喜剧</div><div class="page diy">玄幻</div>
	<div class="page diy">都市</div><div class="page diy">犯罪</div>
	</div>
  	<div class="up" style="width:100%;height:100%;top: 300px;position:absolute;z-index: -1">
  			<c:forEach items="${will }" var="item">
			<c:forEach items="${item.value }" var="will">
				<div class="pics" style="width: 220px;height: 170px;float:left; margin-left: 30px;margin-top: 10px">
					<div ><a href=""><img alt="" src="${will.moviepic }" width="110";height="120" style="transition:width 1s, height 1s;"></a></div>
					<div style="margin-left:120px;margin-top:-160px">${will.moviename }</div>
					<div style="margin-left:120px;margin-top:15px">${will.timelen }分钟-${will.genre }</div>
					<div style=";width:90px;height:30px;float:right; border-radius:25px;margin-right:15px;margin-top:18px;background: #00BFFF;
					line-height:30px;text-align:center;color:white">我想看</div>
				</div> 
			</c:forEach>
			</c:forEach>
	</div>
	<div style="margin-top: 770px;margin-left:60px;width:90%;height:70px;line-height:70px;color:gray;text-align: center">
		<hr>
		&copy版权所有，翻版必究，咖啡时光网由Coffee团队制作<img alt="" src="img/logos.png" width="75" height="45" > 最终解释权归Coffee团队所有&nbsp&nbsp|&nbsp&nbsp<a href="">联系我们</a>
		</div>
  </body>
</html>
