<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
	<style type="text/css">
		*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.lei,.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;line-height: 60px;margin-left: 10px;text-align: center;}
		.first{background: black;}
		.login{margin-left: 60px;border-right:1px solid gray}
		.bigbar{position: relative;}
		.bigbar a:hover{color: white;background: black;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87}
		.bigbar a:visited {background: black;}
		.lei{display: none;z-index: 99999;background:rgba(59,58,65,0.5);color:white}
		.lei div{display: none;}
		.lei div:hover{text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87;background:rgb(59,58,65) }
		.search{float: left;width:350px;height:30px;margin-top:15px;border-radius:20px;background: #B0E0E6;
				border:none;line-height: 30px;color:gray;margin-left:50px}
		.searchin{background:#B0E0E6;border:0;height:29px;position: absolute;top:16px;width:260px;color:gray;font-weight: 800}
		.searimg{float:right;width:34px;margin-right:3px;height:30px;border-radius:30px;cursor:pointer}
		.logo{padding-top:13px;margin-left:10px;width:70px;height:35px;float: left;}
		
		#foot_ul{
				width: 100%;
				height: 45px;
				margin: auto;
				background: rgba(158, 158, 158, 0.1);
				border-radius: 5px;
				margin-top: 30px;
			}
		.ul_li{
			float: left;
			padding-left: 150px;
			padding-top: 10px;
			color: rgba(158, 158, 158, 1);
		}
		p{
		color:white;
		font-weight: 800;
		margin-top:30px;
		margin-left:160px;
		}
		#til{
		color:white;
		width:100px;
		height:50px;
		backgroundred:gray;
		font-weight: 800;
		margin-left:120px;
		}
	</style>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	
  </head>
  <body>
  	 <div class="bigbar">
	<a href="" class="page first"> 首页</a>
	<a href="" class="page genrel">筛选</a>
	<a href="" class="page">我的订单</a>
	<img class="logo" src="img/logos.png">
	<div class="search">&nbsp;&nbsp;
	<span class="all">全部   |</span>
	<input class="searchin" id="sea" type="text" name="search">
	<img class="searimg"src="img/ic_map_search_n.png"/>
	</div>
	<a href="" class="page login">登录</a>
	<a href="" class="page regist">注册</a>
</div>
<div class="lei" id="adiv"><!--下拉问题-->
	<div class="page diy">惊悚</div><div class="page diy">战争</div><div class="page diy">动作</div>
	<div class="page diy">爱情</div><div class="page diy">青春</div><div class="page diy">古装</div>
	<div class="page diy">冒险</div><div class="page diy">喜剧</div><div class="page diy">玄幻</div>
	<div class="page diy">都市</div><div class="page diy">犯罪</div>
</div>
	<div id="foot_ul">
			<ul  class="foot_li">
				<li class="ul_li" >1.选择电影场次<span></span></li>
				<li class="ul_li">2.选座并填手机号</li>
				<li class="ul_li" style="color:#de3e9c">3.提交并支付订单</li>
				<li class="ul_li">4.影院终端取票</li>
			</ul>
	</div>
	<c:if test="${empty loginName }">
	<script type="text/javascript">
		alert("您尚未登录");
	</script>
	</c:if>
	<div style="width:950px;height:440px;margin:50px auto;border-radius:25px;padding-top:30px;background: white;
	box-shadow:0 0 0.3em #f87,-0 -0  0.3em #f87;">
	<div style="float: left;margin-top:18%;margin-left:16px;width:10px;height:10px;border-radius:15px;background: black"></div>
		<div style="float: right;margin-top:18%;margin-right:20px;width:44px;height:44px;border-radius:25px;box-shadow:0 0 0.4em #f87,-0 -0  0.2em black;"></div>
		<div style="width:820px;height:400px;background:url('img/23.jpg');margin-left:50px;border-radius:5px">
			<br>
			<div id="selectDel" style="margin-top:10px;margin-left:620px;cursor:pointer">退票</div>
			<br>
			<script type="text/javascript">
			document.getElementById("selectDel").onclick=function(){
				var pp=document.getElementsByTagName("p")
				var trs=document.getElementsByTagName("table")[0];
				var four=document.getElementById("four")
				if(this.innerHTML=='返回'){
					this.innerHTML='退票';
					for(var i=0;i<pp.length;i++){
						pp[i].style.display="block";
					}
					four.style.display="block";
					trs.style.display="none";
				}else{
					this.innerHTML='返回';
					for(var i=0;i<pp.length;i++){
						pp[i].style.display="none";
					}
					four.style.display="none";
					trs.style.display="block";
				}
			} 
			function show(oid,zuo,price){
				var arg="您确认退单吗";
				if(confirm(arg)==true){
					$.ajax({
						url:"MovieManager?method=deleteOrder",
						type:"post",
						data:"oid="+oid+"&zuo="+zuo+"&price="+price
					})
					document.getElementById(""+oid).style.display="none";
					alert("退单成功，费用已退回！");
				}
			}
			</script>
			
			<span id="til">您的订单已支付</span><br>
			<p>尊敬的 ${loginName }</p>
			<p>您购买了${fn:length(order)}张票,共计${sumprice }元</p>
			<p>取票码${order[0].uid }</p>
			
			<table border="1" width="349px"  cellpadding="0" cellspacing="0" style="display:none;margin-left:120px">
				<tr>
					<td align="center">影院</td>
					<td align="center">大厅</td>
					<td align="center">场次</td>
					<td align="center">&nbsp;座位&nbsp;</td>
					<td align="center">&nbsp;操作&nbsp;</td>
				</tr>
				<c:forEach items="${order }" var="order">
					<tr id="${order.oid }">
						<td>&nbsp;${order.cname }&nbsp;</td>
						<td>&nbsp;${order.hname }&nbsp;</td>
						<td>&nbsp;${order.sess }&nbsp;</td>
						<td>&nbsp;${order.zuo }&nbsp;</td>
						<td>&nbsp;<a href="javascript:show(${order.oid },${order.zuo },${order.price })">退订</a>&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
			<div id="four">
			<c:if test="${fn:length(order)>2}">
				<marquee direction="up" behavior="scroll" scrollamount="5"
				scrolldelay="0" loop="-1" width="" height="200px" onmouseover="this.stop()"
				onmouseout="this.start()">
				<c:forEach items="${order }" var="order">
					<p>${order.cname }影院,${order.hname },${order.zuo }号位置，${order.sess }点开始</p>
				</c:forEach>
				<p>请在电影放映之前到该影院自动取票机取票后进入大厅观影</p>
				<span style="float:right;margin-right:80px;color:white;font-weight: 800;
				margin-top:30px;text-shadow:0 0 0.4em #f87,-0 -0  0.2em black;">谢谢惠顾，咖啡电影网祝您观影愉快
				</span>
			</marquee>
			</c:if>
			<c:if test="${fn:length(order)<=2}">
				<c:forEach items="${order }" var="order">
					<p>${order.cname }影院,${order.hname },${order.zuo }号位置，${order.sess }点开始</p>
				</c:forEach>
				<p>请在电影放映之前到该影院自动取票机取票后进入大厅观影</p>
				<span style="float:right;margin-right:80px;color:white;font-weight: 800;
				margin-top:10px;text-shadow:0 0 0.4em #f87,-0 -0  0.2em black;">谢谢惠顾，咖啡电影网祝您观影愉快
				</span>
			</c:if>
			</div>
		</div>
	</div>
  </body>
</html>
