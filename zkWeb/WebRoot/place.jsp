<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"> 
    <title>My JSP 'index.jsp' starting page</title>

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
				.foot_li{
					list-style: none;
				}
				#foot_zuo{
					width: 900px;
					height: 991px;
					margin-left: 150px;
					margin-top: 30px;
					background: #fafafa;
					z-index: 1;
					float: left;
				}
				.foot_zuo_num{
					height: 500px;
					width: 24px;
					background-color: gray;
					border-radius: 10px;
					position: relative;
					left: 35px;
					top: 130px;
					float: left;
				}
				.ul_li_02{
					list-style: none;
					color: white;
					padding-top: 30px;
					padding-left: 5px;
					font-size: 12px;
				}
				#top_two_nav{
					float: left;
					margin-left: 160px;
					width:500px;
					height: 100%;
				}
				
				.a_02:link{
					text-decoration: none;
					font-size: 20px;
					color: white;
				}
				.a_02:visited{
					text-decoration: none;
					font-size: 20px;
					color: white;
				}
				.a_02:hover{
					text-decoration: none;
					font-size: 20px;
					color: white;
				}
				.a_02:active{
					text-decoration: none;
					font-size: 20px;
					color: white;
				}
				#two_nav_one{
						float: left;
						line-height: 60px;
						width: 80px;
						height: 100%;
						text-align: center;
					}
				#two_nav_two{
					float: left;
						line-height: 60px;
						width: 80px;
						height: 100%;
						text-align: center;
				}	
				#two_nav_three{
						float: left;
						line-height: 60px;
						width: 80px;
						height: 100%;
						text-align: center;
				}
				#top_two_login{
					float: right;
					padding-right: 150px;
					padding-top: 20px;
				}
				
				#foot_moves{
					position: relative;
					top: 30px;
					left: 20px;
				}
				#movehouse{
					position: absolute;
					right: 400px;
					top: 170px;
				}
				#zuowei{
					position: absolute;
					right: 374px;
					top: 270px;
				}
				#move_poll{
					position: absolute;
					right:400px;
					top: 360px;
				}
				#btn_01{
					position: absolute;
					right:160px;
					top: 450px;	
					
				}
				
		</style>
		<script type="text/javascript" src="js/jquery-1.9.1.js">
		</script>
		<script type="text/javascript">
			//被选中的座位号
			var zuoNum = [];
			var num = 0;
			var i = 0;
			var sum=0;
			//拿到所有的Class名称是 zz
			var zz=document.getElementsByClassName("zz");
			
			function getbg(o){
				o.style.backgroundColor="rgb(22, 20, 20)";
			}
			function getmove(o){
				o.style.backgroundColor="rgb(59, 58, 65)";
			}
			//卖票按钮事件
				//遍历所有的座位是否有被选的座位
				function asd(){
				var flog=false;
					for(var s in zz){
						if(zz[s].src=='http://localhost:8080/zkWeb/img/zuo3.png'){
							flog=true;
						}
					}
					return flog;
				}
				//数组中要移除指定的座位
				function removeByvalue(arr,val){
					for(var i=0;i<arr.length;i++){
						if(arr[i]==val)
						{
							arr.splice(i,1);
							break;
						}
					}
				}
			//座位被选中	
			 function xuanzuo(o,v,uname){ 
				 if(uname==''){
					 alert("亲，您未登录，不可以选座哦，快去登陆吧");
					 return;
				 }
			 	var tick=document.getElementById("tiket");
			 		//如果这个src的目录里面包含了这个图片 没被选中
					if(document.getElementById(o).src.indexOf("zuo1")>0&&num<5){
							document.getElementById(o).src='img/zuo3.png';	
							num++;
							zuoNum.push(o);//在数组中添加一个座位
							$("#movecount").append("<p class='"+o+"'>已选座位："+o+"</p>");	
					}
			 		//如果被选中了
					else if(document.getElementById(o).src.indexOf("zuo3")>0){//如果d没有包含这个图片
							document.getElementById(o).src='img/zuo1.png';
							num--;
							removeByvalue(zuoNum,o);//在数组中移除一个座位
							$("."+o+"").remove();
					}	
					document.getElementById("sp_01").innerText=+num;
				 	sum = (num*v);
					document.getElementById("sp_02").innerText=+(num*v);
					if(num>=5){
	 					alert("亲！每人只能选购五张票哦！☺");
	 				}
		
					//如果有被选的座位那么就唤醒 按钮图标
					if(asd()){
						tick.disabled="";
						tick.style.backgroundColor="#00BFFF";
					}else{	//否则禁用按钮
							tick.disabled="disabled";
							tick.style.backgroundColor='gray';
					}
			}
			
				//确定选座 提交订单
				function getmonet(cid,hid,mid,sess,money){//${hall.cid}','${hall.hid}','${hall.mid}','${hall.sess}','${hall.price}
						$("#payfu").slideDown("slow");
						$("#py2").animate({fontSize:'30px'},"slow");
						$("#py1").animate({fontSize:'20px'},"slow");
						$("#pay").text(sum+"元");
						$("#pay").animate({fontSize:'35px'},"slow");
						$("#offer").click(function(){
							//location="MovieManager?method=createOrder&cid="+cid+"&hid="+hid+"&mid="+mid+"&sess="+sess+"&zuo="+zuoNum.toString();
							location="MovieManager?method=createOrder&cid="+cid+"&hid="+hid+"&mid="+mid+"&sess="+sess+"&zuo="+zuoNum.toString()+"&sumprice="+sum;
						})
						//location="MovieManager?method=createOder&cid="+cid+"&hid="+hid+"&mid="+mid+"&sess="+sess+"&zuo="+zuoNum.toString();
				}
			//超链接失效
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
	<a href="User/regist.jsp" class="page regist">注册</a>
</div>
<div class="lei" id="adiv"><!--下拉问题-->
	<div class="page diy">惊悚</div><div class="page diy">战争</div><div class="page diy">动作</div>
	<div class="page diy">爱情</div><div class="page diy">青春</div><div class="page diy">古装</div>
	<div class="page diy">冒险</div><div class="page diy">喜剧</div><div class="page diy">玄幻</div>
	<div class="page diy">都市</div><div class="page diy">犯罪</div>
</div>	
					<div id="foot">
							<div id="foot_ul">
									<ul  class="foot_li">
										<li id="li_01" class="ul_li" >1.选择电影场次<span></span></li>
										<li id="li_02" class="ul_li" style="color:#de3e9c">2.选座并填手机号</li>
										<li id="li_03" class="ul_li">3.提交并支付订单</li>
										<li id="li_04" class="ul_li">4.影院终端取票</li>
									</ul>
							</div>
							<div id="foot_zuo">
								<div class="foot_zuo_num">
									<ul>
										<li class="ul_li_02">1</li>
										<li class="ul_li_02">2</li>
										<li class="ul_li_02">3</li>
										<li class="ul_li_02">4</li>
										<li class="ul_li_02">5</li>
										<li class="ul_li_02">6</li>
										<li class="ul_li_02">7</li>
										<li class="ul_li_02">8</li>
										<li class="ul_li_02">9</li>
									</ul>
								</div>
										<div  style="position:absolute;top:200px;left:280px">
												<img src="img/kuang.png" width="700px">
										</div>
										<div style="position:relative; top:150px;left:130px" id="mg">
													<c:forEach var="zuo" begin="1" end="81">	
															<!-- 如果遍历拿到的数组有被选的座位 那么就换图片 超链失效 -->
															<c:if test="${empty place}">
					
																<span style="padding-left: 30px;line-height: 45px" id="sp${zuo}">						
																			<a href="javascript:xuanzuo(${zuo},${hall.price},'${loginName}') " >
																				<img class="zz" src="img/zuo1.png" id="${zuo}" width="30xp" height="30px"></a>
																			</span>	
															</c:if>
															<c:if test="${not empty place }">
																<c:set var="iscontain" value="false" /> 
																								
																<c:forEach var="s" items="${place}">	
															     	<c:if test="${s eq zuo}">																		
																		<c:set var="iscontain" value="true" /> 
																	</c:if>
															    </c:forEach>
															     
																	<c:if test="${iscontain}">
																		<span style="padding-left: 30px;line-height: 45px" id="sp${zuo}">
																			<a> 
																				 <img class="zz" src="img/zuo2.png" id="${zuo}"width="30xp" height="30px" >
																			</a>
																		</span>
																	</c:if>
																	<c:if test="${not iscontain}">
																		<span style="padding-left: 30px;line-height: 45px" id="sp${zuo}">						
																			 <a href="javascript:xuanzuo(${zuo},${hall.price},'${loginName}') " >
																				 <img class="zz" src="img/zuo1.png" id="${zuo}" width="30xp" height="30px">
																			</a> 
																			</span>
																	</c:if>
															</c:if>
														<c:if test="${zuo%9 eq 0 }">
																<br>
															</c:if>	
													</c:forEach>																										
										</div>
									<div>		
								</div>
								<div id="tishi" style="margin-top: 200px;margin-left: 180px;">
									 <div >
									 		<img src="img/log4.png" style="width:550px ;height:60px ;">
									 </div>
								</diV>
								
								<div id="shuoming" style="margin-left: 170px;margin-top:90px;font-size: 12px;color: gray;line-height: 30px;">
										<p>使用说明:</p>
										<p>1、每笔订单最多可选购4张电影票，情侣座不单卖；</p>
										<p>2、选座时，请尽量选择相邻座位，不要留下单个座位；</p>
										<p>3、点击"完成选座"后，请在15分钟内完成支付，超时系统将释放你选定的座位；</p>
										<p>4、选座购票为特殊商品，出票成功后，如无无法使用问题，不得退换；</p>
										<p>5、付款后若没有出票成功，我们将自动为您退款。出票成功后，请牢记取票密码，若没有收到取票短信，请到订单中心查询，或拨打客服电话4006-099-866；</p>
									</div>
							</div>
							
					</div>
			
			<div id="moves" style="width:180px;height: 250px;position: absolute;right: 4px;top:180px;line-height: 25px">
				<div id="movesPic">
						<img src="${movie.moviepic}" style="width: 150px;height: 180px;">
					</div>
					<div id="jianjie">
						<p id="moveName" style="margin-top:10px;font-size: 20px;color:gray;">${movie.moviename}</p>
						<p id="moveTime" style="margin-top:10px;font-size: 17px;color: #808080;">类型：${movie.genre }</p>
						<p id="moveTime" style="margin-top:10px;font-size: 17px;color: #808080;">电影时长：${movie.timelen }分钟</p>
					</div>		
			</div>
			
			<div style="width:180px;position: absolute;right: 10px;top:540px">
				<div style="color:gray;">
						<p id="move_theatre">影院：${hall.cname}</p><br>
						<p id="movenum">影厅：${hall.hname}</p><br>
						<p id="movecount">场次：${hall.sess}</p>
							<br>
						<p id="move_money">票数：<span id="sp_01" style="color:red">0</span></p>
						<p id="move_summoney">总价：<span id="sp_02" style="color:red">0</span></p>
						<br>
						<br>
						<input type="button" value="确定提交"  id="tiket"
							style="border: 0;background:gray;outline:none;cursor:pointer;
							width: 180px;height: 40px;color: white;border-radius:20px;font-family: 
							微软雅黑;font-size: 18px;"disabled="disabled" onclick="getmonet('${hall.cid}','${hall.hid}','${hall.mid}','${hall.sess}','${hall.price}','${loginName }')"/>
				</div>
					<div id="btn_01"></div>
			</div>
		<!-- 支付 -->
		<div id="payfu" style="display:none;position: absolute;left:300px;top:300px;
		background: rgba(0,0,0,0.6);width:600px;height:300px;border-radius:40px">
			<div style="float:left;">
				<img src="img/logos.png" style="width:150px;height:80px;margin-left:10%;margin-top:35%"><br><br>
				<span id="py1" style="color:red;font-size:1px;margin-left:20px;">咖啡电影欢迎您</span>
			</div>
			<p id="py2" style="margin-left:40%;margin-top:10%;font-size:5px;color:white">请确认支付：</p><br>
			<span id="pay" style="margin-left:20%;margin-top:20%;font-size:20px;color:yellow"></span>
			<div id="offer" style="margin-left:38%;margin-top:4%;font-size:20px;border-radius:30px;
			width:190px;height:40px;background: #00BFFF;color:white;text-align:center;line-height: 39px;cursor: pointer;">确认支付 </div>
		</div>
	</body>
</html>