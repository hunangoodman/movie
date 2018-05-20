<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>regist.jsp</title>
  <style type="text/css">
/*最底层div*/
*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.lei,.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;line-height: 60px;margin-left: 10px;text-align: center;}
		.regist{background: black;}
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
		
 
</style>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
				$(function(){
					var via=document.getElementById("username");
					var pas=document.getElementById("mi");
					var regist=document.getElementById("regist");
					var reset=document.getElementById("reset");
					via.onblur=function(){
						if(via.value==""||via.value.match(/^[ ]+$/)){
							via.style.fontWeight=700;
							via.style.color="red";
							via.value="您未输入用户名×";
						}else{
							$.ajax({
								url:"UserServlet",
								type:"post",
								data:"method=checkName&username="+via.value,
								success:function(msg){
									if(msg=="0")via.value="用户名已存在";
								}
							});
						}
					}
					via.onfocus=function(){
						if(this.value=="您未输入用户名×"||this.value=="用户名已存在")this.value="";
					}
					pas.onblur=function(){
						if(this.value==""||this.value.match(/^[ ]+$/)){
							this.value="";
							this.placeholder="您未输入密码×";
						}
						if(this.value.length<6||this.value.length>15){
							this.value="";
							this.placeholder="不能超过15位并且不能小于6位×";
						}
					}
					
					$("#kaptchaimg").click(
							function(){
								$(this).attr('src','kaptcha.jpg?'+Math.floor(Math.random()*100));
					});
					$("#kaptcha").blur(function(){
						if($(this).val()==""||$(this).val().match(/^[ ]+$/)){
							$(this).val("请输入验证码");
							return;
						}else{
							$.ajax({
								url:"UserServlet",
								type:"post",
								data:"method=getKaptcha&kaptcha="+$(this).val(),
								success:function(msg){
									if(msg=="0")$("#kaptcha").val("输入不正确");
								}
							});
						}
					});
					
					$("#kaptcha").focus(function(){
						$(this).val("");
					})
					regist.onclick=function(){
						location.href="User/login.jsp";
					}
					reset.onclick=function(){
						via.value="";
						pas.value="";
					}
					$("#submits").click(function(){
						if(pas.value.match(/^[ ]+$/)||(pas.value.length<6||pas.value.length>15)){
							return;
						}else if(via.value=="您未输入用户名×"||via.value=='用户名已存在'){
							return;
						}else if($("#kaptcha").val()=="请输入验证码"||$("#kaptcha").val()=="输入不正确"){
							return
						}else{
							$("#form").submit();
						}
							
					});
				});
		</script>	
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
	<a href="User/login.jsp" class="page login">登录</a>
	<a class="page regist">注册</a>
</div>
<div class="lei" id="adiv"><!--下拉问题-->
	<div class="page diy">惊悚</div><div class="page diy">战争</div><div class="page diy">动作</div>
	<div class="page diy">爱情</div><div class="page diy">青春</div><div class="page diy">古装</div>
	<div class="page diy">冒险</div><div class="page diy">喜剧</div><div class="page diy">玄幻</div>
	<div class="page diy">都市</div><div class="page diy">犯罪</div>
</div>

<div style="background: url('img/timg.jpg') no-repeat;width:100%;height:100%;background-size:100%;position: absolute;">
	<div style="width:370px;height:480px;background: rgba(250,250,250,0.2);margin:59px 680px;">
		<div style="position: absolute;top:100px;right:326px;font-size:25px;color:#00BFFF;"><strong>欢        迎        新        用        户</strong></div>
		<br>
		<div style="margin-left:96px;margin-top:60px;font-size:18px;color:red;">请设置用户名和密码</div>
		<form action="UserServlet" method="post" id="form">
		<input type="hidden" name="method" value="regist">		
			<input id="username" name="username" type="text" style="margin-left:60px;border:none;margin-top:35px;width:240px;height:50px;font-size:13px" placeholder="请输入用户名">
			<input id="mi" name="pas" type="password" style="margin-left:60px;border:none;
			margin-top:22px;width:240px;height:50px;font-size:13px" placeholder="请输入密码">
			
			<div style="margin-top:22px;margin-left:60px;height:50px;width:240px">
			<img src="kaptcha.jpg" id="kaptchaimg" style="width:120px;height:50px;display: block;float:left">
			<input id="kaptcha" name="kaptcha" type="text" style="margin-left:3px;
			float:left;display:block;border:none;width:116px;height:50px;font-size:13px" placeholder="请输入验证码">
			</div>
			<!-- 验证码 -->
		</form>
		
		<div id="submits" style="margin-left:60px;border:none;margin-top:25px;width:240px;height:50px;
			font-size:20px;color:white;background:#00BFFF;text-align: center;line-height: 45px";>	
			<span style="float:left;margin-left:55px">注</span>
			<span style="float:right;margin-right:45px">册</span>
		</div>
		
		<div style="margin-top:15px;color:white">
			<span id="regist" style="float:left;margin-left:59px;cursor: pointer;">登录</span>
			<span id="reset" style="float:right;margin-right:72px;cursor: pointer;">重置</span>
		</div>
	</div>
	<div style="margin-top: 120px;width:90%;height:70px;line-height:80px;color:gray;text-align: center">
		<hr style="margin-left:50px">
		&copy版权所有，翻版必究，咖啡电影网由Coffee团队制作<img alt="" src="img/logos.png" width="75" height="45" > 最终解释权归Coffee团队所有&nbsp&nbsp|&nbsp&nbsp<a href="">联系我们</a>
		</div>
</div>
  </body>
</html>
