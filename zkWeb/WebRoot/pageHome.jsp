<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>this is my jsp</title>
	<style type="text/css">
		*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.lei,.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;line-height: 60px;margin-left: 10px;text-align: center;}
		.first{background: black;}
		.cur{width: 90px;height: 70px;float: left;}
		.login{margin-left: 520px;border-right:1px solid gray}
		.bigbar{position: relative;}
		.bigbar a:hover{color: white;background: black;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87}
		.bigbar a:visited {background: black;}
		.lei{display: none;z-index: 2;background:rgba(59,58,65,0.5);color:white}
		.lei div{display: none;}
		.lei div:hover{text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87;background:rgb(59,58,65) }
		.search{float: left;width:350px;height:30px;margin-top:15px;border-radius:20px;background: #B0E0E6;
				border:none;line-height: 30px;color:gray;margin-left:50px}
		.searchin{background:#B0E0E6;border:0;height:29px;position: absolute;top:16px;width:260px;color:gray;font-weight: 800}
		.searimg{float:right;width:34px;margin-right:3px;height:30px;border-radius:30px;cursor:pointer}
		.all{cursor:pointer}
		.logo{padding-top:13px;margin-left:10px;width:70px;height:35px;float: left;}
		
		#box{position: absolute;top: 70px;width:100%;height: 400px;overflow:hidden;z-index: -1}
		#box .count{position:absolute;right:45%;bottom:5px;}
		#box .list li{position:absolute;top:0;left:0;width:100%;height:400px;}
		#box .count li{float:left;width:15px;height:15px;cursor:pointer;margin-right:20px;overflow:hidden;background:gray;border-radius:20px;}
		#box .count li.current{font-weight:700;background:white}
		
		.pic img:hover{box-shadow:-2px 0px 9px #f00,0px -2px 9px #000,0px 2px 9px #9e038a,2px 0px 9px #0f0;width:270px;height:350px;}
		.pics img:hover{box-shadow:-2px 0px 9px #f00,0px -2px 9px #000,0px 2px 9px #9e038a,2px 0px 9px #0f0;width:104px;height:140px;}
		
		.choose{display:block;float:left;width:40px;height:40px;border-radius:30px;background:#32CD32;line-height: 40px }
		.ui ul{margin-left:120px;}
		.ui ul li{float:left;text-align: center;margin-top:20px;margin-right:30px}
		
		.more{display: none;height:600px;z-index: 2;}
		.wil{display: none;height:400px;z-index: 2;}
		
		#div_01{
				width: 28%;
				height: 35px;
				border-radius: 20px;
				background-color: white;
				position:absolute;
				left: 560px;
				top: 13px;
			}
				/* 搜索栏分类功能 */
				#div_02{
					position: absolute;
					top: 6px;
					left: 10px;
					text-align: center;
					width: 50px;
					height: 20px;			
				}
				
				/* 搜索栏输入功能*/
				#div_03{
					position: absolute;
					left: 70px;
					top: 10px;
				}
				#input_01{
					width: 175%;
					height: 20px;
					border: 0;
					outline: none;
				}
				
				/*搜索按钮*/
				#div_4{
					position: absolute;
					left: 290px;
					top: 3px;
					text-align: center;
					outline: none;
				}
				#ss_01{
					background-color: white;
					border: 0;
					border-radius: 15px;
					width: 52px;
						outline: none;
				}
				
				/*搜索分类层*/
				
				#div_02_1{
					width: 50px;
					position: relative;
					left: 12px;
					top:35px;
					padding-top: 3px;
					text-align: center;
					font-size:14px;
				}
				#div_5{
					position: absolute;
					left: 63px;
					top: 8px;
				}
				
				.pan{
					text-decoration: none;
					color:dimgray;
					font-size:14px;	
				}
				#bg_01{
					width: 50px;
					border-collapse: collapse;
					background-color: white;
				}
	</style>
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	
	<script type="text/javascript">
	function more(obj){
		$("."+obj).slideDown("slow");
	}
	function up(obj){
		$("."+obj).slideUp("slow");
	}
	function sou(){
		location.href="searchmovie.jsp";
	}
		$(function(){
			var diy=document.getElementsByClassName("diy");
			var arry=[];
			arry[0]=["战狼2","123分钟&nbsp动作/战争","吴京领衔演绎坦克版速度与激情"];
			arry[1]=["侠盗联盟","108分钟&nbsp动作/冒险","最潮盗宝天团极限奇袭"];
			arry[2]=["权力的游戏","180分钟&nbsp权利/战争","列王纷争,看鹿死谁手"];
			$(".genrel").mouseover(function(){
				$(".lei").slideDown("slow");
				for(var i=0;i<diy.length;i++){
					$(diy[i]).fadeIn(i+2000);
				}
			});
			$("#box").mouseover(function(){
				$(".lei").slideUp("slow");
				$(".diy").hide();
			}); 	
			for(var i=0;i<diy.length;i++){
				diy[i].onclick=function(){
					location.href="MovieManager?method=findByGener&gener="+this.innerHTML;
				}	
			}
			
			//搜索
			$("#div_02").mouseover(function(){
							$("#div_02_1").slideDown(800);
						});	
							$(".up").mouseover(function(){
								$("#div_02_1").slideUp(800);
						});
							
					//分类层鼠标事件
						$("#td_01").mouseover(function(){
							$("#td_01").css("background-color","#53daf9");
						});
						$("#td_01").mouseout(function(){
							$("#td_01").css("background-color","white");
						});
						$("#td_02").mouseover(function(){
							$("#td_02").css("background-color","#53daf9");
						});
						$("#td_02").mouseout(function(){
							$("#td_02").css("background-color","white");
						});
						$("#td_03").mouseover(function(){
							$("#td_03").css("background-color","#53daf9");
						});
						$("#td_03").mouseout(function(){
							$("#td_03").css("background-color","white");
						});
						$("#td_04").mouseover(function(){
							$("#td_04").css("background-color","#53daf9");
						});
						$("#td_04").mouseout(function(){
							$("#td_04").css("background-color","white");
						});
						
						//点击搜索分层时间
						$(".pan").click(function(){
							$("#div_02_1").slideUp(800);
						});
						
						//搜索框焦点事件
						$("#input_01").focus(function(){
							$("#ss_01").css("background-color","aqua");
						});
						$("#input_01").blur(function(){
							$("#ss_01").css("background-color","white");
						});

						//搜索键鼠标事件
						$("#ss_01").mouseover(function(){
							$("#ss_01").css("background-color","aqua");
						});
						
						$("#ss_01").mouseout(function(){
							$("#ss_01").css("background-color","white");
						});
			
		 	var oBox = document.getElementById("box");
			var aUl = document.getElementsByTagName("ul");
			var aImg = aUl[0].getElementsByTagName("li");
			var aNum = aUl[1].getElementsByTagName("li");
			var timer = play = null;
			var i = index = 0;
	//切换按钮
			for (i = 0; i < aNum.length; i++){
				aNum[i].index = i;
				aNum[i].onmouseover = function (){
					show(this.index);
				}
			}
			
			//鼠标划过关闭定时器
			oBox.onmouseover = function (){
				clearInterval(play);
			};
			
			//鼠标离开启动自动播放
			oBox.onmouseout = function (){
				autoPlay()
			};	
			
			//自动播放函数
			function autoPlay (){		
				play = setInterval(function () {
					index++;
					index >= aImg.length && (index = 0);
				//	alert(index);
					//alert(index);
					show(index);
				},4000);	
			}
			autoPlay();//应用
			
			
			//图片切换, 淡入淡出效果
			function show (a){			
				 index = a;
				 var alpha = 0;
				for (i = 0; i < aNum.length; i++)aNum[i].className = "";
				aNum[index].className = "current";
					document.getElementById("mname").innerHTML="《"+arry[index][0]+"》"
					document.getElementById("mtime").innerHTML=arry[index][1];
					document.getElementById("mshow").innerHTML=arry[index][2]; 
				clearInterval(timer);
				
				for (i = 0; i < aImg.length; i++){
					aImg[i].style.opacity = 0;
					//aImg[i].style.filter = "alpha(opacity=0)";	
				}
				
				timer = setInterval(function () {
					alpha += 2;
					//alpha > 100 && (alpha =100);
					aImg[index].style.opacity = alpha / 100;
					//aImg[index].style.filter = "alpha(opacity = " + alpha + ")";
					alpha == 100 && clearInterval(timer)
				},40);
			} 
		})
	</script>
</head>
<body>
<!-- 头部 -->
<div class="bigbar">
	<a href="" class="page first"> 首页</a>
	<a class="page genrel">筛选</a>
	<!-- MovieManager?method=queryOrder -->
	<a href="MovieManager?method=queryOrder" class="page">我的订单</a>
	<img class="logo" src="img/logos.png"></a>
	<span class="cur up"></span>
	<div id="div_01">
				<!--搜索分类-->
					<div id="div_02">
						<input type="button" value="全部" style="border: 0;background: white;cursor: pointer;color: gray;outline: none;"
							  id="btn" />
					</div>
						<div id="div_02_1" style="display: none;" >
							<table id="bg_01" border="0" style="text-align: center;">
								<tr>
									<td id="td_01" ><a href="javascript:add('quanbu')" id="span_02" class="pan">全部</a></td>
								</tr>
								<tr>
									<td id="td_02" ><a href="javascript:add('moviename')" id="span_03" class="pan">电影</a></td>
								</tr>
								<tr>
									<td id="td_03"><a href="javascript:add('act')" id="span_04" class="pan">主演</a></td>
								</tr>
								<tr>
									<td id="td_04"><a href="javascript:add('showtime')" id="span_05" class="pan">时间</a></td>
								</tr>
							</table>
					</div>
				
				<!--搜索输入框-->
				<div  id="div_03" class="up">
						<input type="text" name="input_01" id="input_01" />
				</div>
				
				<!--点击搜索-->
				<div id="div_4">
					<button id="ss_01" onclick="sou()"><img src="img/ic_map_search_n.png"/></button>
				</div>
				<div id="div_5" class="up"><span style="color: #DCDCDC;font-size: 16px;">|</span></div>
		</div>
		
		<!-- 测试Div -->
		
	<a href="User/login.jsp" class="page login">登录</a>
	<a href="User/regist.jsp" class="page regist">注册</a>
</div>
<div class="lei" id="adiv"><!--下拉问题-->
	<div class="page diy">惊悚</div><div class="page diy">战争</div><div class="page diy">动作</div>
	<div class="page diy">爱情</div><div class="page diy">青春</div><div class="page diy">古装</div>
	<div class="page diy">冒险</div><div class="page diy">喜剧</div><div class="page diy">玄幻</div>
	<div class="page diy">都市</div><div class="page diy">犯罪</div>
</div>
<!--下拉搜索-->
<!-- 身体躯干 -->
 <div class="bod">
	<div id="intu" style="position:absolute;top: 170px;color:white;left: 60px;width: 400px;height: 200px;">
		<div style="width: 100px;height: 30px;text-align: center;line-height: 20px; background: rgb(227,92,6);box-shadow: 5px 5px 5px #888888;">正在热映</div>
		<h3 id="mname" style="font-size: 50px">权力的游戏</h3>
		<h4 id="mtime">180分钟&nbsp权利/战争</h4>
		<a style="font-size: 50px;color:rgb(227,92,6); ">“</a><a id="mshow" style="color:rgb(227,92,6);font-size: 20px;font-weight: 700">列王纷争,看鹿死谁手</a>
	</div>
	
	 <div id="box">
		 <ul class="list" style="list-style: none;">
	        <li class="current"><img src="img/wolf.jpg" width="1280" height="400"></li>
	        <li><img src="img/xia.jpg" width="1280" height="400"></li>
	        <li><img src="img/power.png" width="1280" height="400"></li>
	    </ul>
	    <ul class="count">
	        <li class=""></li>
	        <li class=""></li>
	        <li class=""></li>
	    </ul>
	</div>
	<!-- 正在热映 -->	
	<div style="position:absolute;top: 520px;left: 100px">
		<div style="width:10px;height:50px;background:rgb(227,92,6);"></div>
		<div style="margin-top: -50px;margin-left:30px;font-size:20px;">正在热映  <b style="font-size:30px">25</b>
			 部 &nbsp&nbsp&nbsp全部   |&nbsp<a href="">3D</a>&nbsp|&nbsp<a href="">爱情</a>&nbsp|&nbsp
			 <a href="">动作</a>&nbsp|&nbsp<a href="">冒险</a>&nbsp|&nbsp<a href="">喜剧</a>&nbsp|&nbsp<a href="">战争</a>&nbsp|
		</div>
		<hr style="width: 1060px;margin-top: 10px;">
	</div>
	<!-- 前十部 -->
	<div style="position:absolute;top: 590px;left: 100px">
	<div class="pic" >
		<c:forEach items="${list }" var="four" varStatus="i">
			<c:if test="${i.index==0 }">
				<div style="width: 250px;height: 500px;float:left;">
					<a href="<c:url value="/MovieManager?method=findById&item=${four.mid }"/>">
						<img alt="" src="${four.moviepic }" width="250" height="330" style="transition:width 1s, height 1s">
					</a>
					<div style="width:70px;float: left;height:70px;background: #32CD32;margin-top:0px;text-align: center;line-height: 65px;font-size:25px;font-weight: 900">
						<em>${four.grade }</em>
					</div>
					<a style="font-size:24px;display: block;">&nbsp&nbsp&nbsp&nbsp&nbsp${four.moviename }</a>
					<a style="font-size:16px">&nbsp&nbsp&nbsp&nbsp${four.timelen }分钟-	冒险/动作</a><br>
					<p style="marg in-top:18px;margin-left:5px;color:#32CD32">刘德华舒淇杨佑宁组最潮盗宝天团</p>
					<div style="font-weight: 900; margin-left:15px;margin-top:10px">
						<b style="font-size:30px;"><strong>25</strong></b>元起
						<div style="width:130px;height:40px;float:right; border-radius:25px;margin-right:5px;background: #00BFFF;line-height:30px;text-align:center;cursor: pointer;color:white">选座购票</div>
					</div>
				</div>
			</c:if>
		
			<c:if test="${i.index!=0 }">
				<div class="pics" style="width: 220px;height: 170px;float:left; margin-left: 55px;margin-bottom: 10px">
					<div>
						<a href="<c:url value="/MovieManager?method=findById&item=${four.mid }"/>">
							<img alt="" src="${four.moviepic }" width="110";height="120" style="transition:width 1s, height 1s;">
						</a>
					</div>
					<div style="margin-left:120px;margin-top:-160px">${four.moviename }</div>
					<div style="margin-left:120px;margin-top:5px">${four.timelen }分钟-${four.genre }</div>
					<div style="margin-left:120px;margin-top:8px;text-align:center;width:80px;height:30px;background:#32CD32 ">评分：${four.grade }</div>
					<div style="width:90px;height:30px;float:right; border-radius:25px;margin-right:15px;margin-top:5px;background: #00BFFF;line-height:30px;text-align:center;cursor: pointer;color:white">选座购票</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<!-- 查看更多 -->
	<div style="width:100%;margin-top:550px;">
		<a href="javascript:;" onclick="more('more')" style="display:block;font-size: 24px;margin-left:45%;color:#00BFFF;">查看更多<br>
			&nbsp&nbsp&nbsp<span style="font-size:40px"> ︾</span>
		</a>
		<!-- 下拉热映 -->
		<div class="more">
			<c:forEach items="${list }" var="four" varStatus="i">
			<c:if test="${i.index!=0 }">
				<div class="pics" style="width: 220px;height: 170px;float:left; margin-left: 30px;margin-bottom: 10px">
					<div><a href=""><img alt="" src="${four.moviepic }" width="110";height="120" style="transition:width 1s, height 1s;"></a></div>
					<div style="margin-left:120px;margin-top:-160px">${four.moviename }</div>
					<div style="margin-left:120px;margin-top:5px">${four.timelen }分钟-${four.genre }</div>
					<div style="margin-left:120px;margin-top:8px;text-align:center;width:80px;height:30px;background:#32CD32 ">评分：${four.grade }</div>
					<div style="width:90px;height:30px;float:right; border-radius:25px;margin-right:15px;margin-top:5px;background: #00BFFF;line-height:30px;text-align:center;cursor: pointer;color:white">选座购票</div>
				</div>
			</c:if>
			</c:forEach>
			<a href="javascript:;" onclick="up('more')" style="display:block;font-size: 24px;width:200px;height:100px;line-height:350px;margin-left:45%;color:#00BFFF;">
			&nbsp&nbsp&nbsp<span style="font-size:40px">缩回去 ︽</span>
		</a>
		</div>
	</div>
	<!-- 即将上映 -->
	<div style="margin-top: 10px;z-index: -1;">
			<div style="width:10px;height:50px;background:rgb(227,92,6);margin-top: 10px;"></div>
			<div style="font-size:20px;margin-left:25px;margin-top:-35px">
				即将上映&nbsp-8月16日~11月13日 
			 </div>
			<hr style="width: 1060px;margin-left:0px;margin-top:6px;">
			<c:forEach items="${will }" var="will">
				<div class="pics" style="width: 220px;height: 170px;float:left; margin-right: 60px;margin-top: 10px">
					<div ><a href=""><img alt="" src="${will.moviepic }" width="110";height="120" style="transition:width 1s, height 1s;"></a></div>
					<div style="margin-left:120px;margin-top:-140px">${will.moviename }</div>
					<div style="margin-left:120px;margin-top:15px">${will.timelen }分钟-${will.genre }</div>
					<div style="width:90px;height:30px;float:right; border-radius:25px;margin-right:15px;margin-top:18px;background: #00BFFF;
					line-height:30px;text-align:center;cursor: pointer;color:white">我想看</div>
				</div>
			</c:forEach>
	</div>
		<!-- 查看更多即将上映 -->
		<div>
			<a href="javascript:;" onclick="more('wil')" style="display:block;margin-top: 400px;margin-left: 45%;font-size: 24px;color:#00BFFF">查看更多<br>
				&nbsp&nbsp&nbsp<span style="font-size:40px"> ︾</span>
			</a> 
		</div>
		<!-- 下拉 -->
		<div class="wil">
			<c:forEach items="${will }" var="will">
				<div class="pics" style="width: 220px;height: 170px;float:left; margin-left: 30px;margin-top: 10px">
					<div ><a href=""><img alt="" src="${will.moviepic }" width="110";height="120" style="transition:width 1s, height 1s;"></a></div>
					<div style="margin-left:120px;margin-top:-160px">${will.moviename }</div>
					<div style="margin-left:120px;margin-top:15px">${will.timelen }分钟-${will.genre }</div>
					<div style="width:90px;height:30px;float:right; border-radius:25px;margin-right:15px;margin-top:18px;background: #00BFFF;
					line-height:30px;text-align:center;cursor: pointer;color:white">我想看</div>
				</div>
			</c:forEach>
			
			<a href="javascript:;" onclick="up('wil')" style="display:block;font-size: 24px;width:200px;line-height:120px;height:100px;margin-left:45%;color:#00BFFF;">
				<span>&nbsp&nbsp&nbsp<span style="font-size:40px;">缩回去 ︽</span>
			</a>
		</div>
		<!-- 购票流程 -->
		<div style="width:1000px;height:200px;background: #00BFFF;margin-top:70px;padding-top:25px;border-radius:20px">
			<div class="ui" style="width:930px;height:160px;background: #D3D3D3;border-radius:20px;margin:0px auto;padding-top: 20px"><p style="margin-left:20px">如何在线选座购票：</p>
				<ul> 
					<li><a class="choose">1</a><a style="float:left;line-height: 40px">&nbsp&nbsp&nbsp&nbsp&nbsp	------------------></a></li>
					<li><a class="choose">2</a><a style="float:left;line-height: 40px">&nbsp&nbsp&nbsp&nbsp&nbsp	------------------></a></li>
					<li><a class="choose">3</a><a style="float:left;line-height: 40px">&nbsp&nbsp&nbsp&nbsp&nbsp	------------------></a></li>
					<li><a class="choose">4</a></li>
				</ul>
				<div style="margin-top:20px;margin-left:90px;float:left">选场次&选座位</div>
				<div style="margin-top:20px;margin-left:140px;float:left">在线支付</div>
				<div style="margin-top:20px;margin-left:170px;float:left">获取取票码</div>
				<div style="margin-top:20px;margin-left:142px;float:left">影院自助取票</div>
			</div>
		</div>
		
		<!-- 底部 -->
		<div style="margin-top: 30px;width:90%;height:70px;line-height:70px;color:gray;text-align: center">
		<hr>
		&copy版权所有，翻版必究，咖啡时光网由Coffee团队制作<img alt="" src="img/logos.png" width="75" height="45" > 最终解释权归Coffee团队所有&nbsp&nbsp|&nbsp&nbsp<a href="">联系我们</a>
		</div>
</div>
</body>
</html>

