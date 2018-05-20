<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'native.jsp' starting page</title>
    <style type="text/css">
    	*{padding: 0;margin: 0;list-style: none;text-decoration: none;font-family: '微软雅黑 Light'}
		.lei,.bigbar{width: 100%;height: 70px;background:rgb(59,58,65);font-family:"Georgia";font-weight: 800}
		.page{color:#E0FFFF;width: 90px;height: 70px;float: left;line-height: 60px;margin-left: 10px;text-align: center;}
		.first{background: black;}
		.cur{width: 90px;height: 70px;float: left;}
		.login{margin-left: 380px;border-right:1px solid gray}
		.bigbar{position: relative;}
		.bigbar a:hover{color: white;background: black;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87}
		.bigbar a:visited {background: black;}
		.lei{display: none;z-index: 999;background:rgba(59,58,65,0.5);color:white}
		.lei div{display: none;}
		.lei div:hover{text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87;background:rgb(59,58,65) }
		.search{float: left;width:350px;height:30px;margin-top:15px;border-radius:20px;background: #B0E0E6;
				border:none;line-height: 30px;color:gray;margin-left:50px}
		.searchin{background:#B0E0E6;border:0;height:29px;position: absolute;top:16px;width:260px;color:gray;font-weight: 800}
		.searimg{float:right;width:34px;margin-right:3px;height:30px;border-radius:30px;cursor:pointer}
		.all{cursor:pointer}
		.logo{padding-top:13px;margin-left:10px;width:70px;height:35px;float: left;}
		
		#div_1{
				width: 561px;
				height:50px;
				border-radius: 25px;
				background-color:deepskyblue;
				position: absolute;
				z-index: 2;
				left: 365px;
				top: 200px;
			}
			#div_01{
					width: 28%;
					height: 35px;
					border-radius: 20px;
					background-color: white;
					position:absolute;
					left: 640px;
					top: 13px;
			}
				#mian_search{
					width:540px;
					height: 40px;
					border-radius: 20px;
					background-color: white;
					position:absolute;
					left: 10px;
					top: 4px;
				}
				#div_01{
					width: 28%;
					height: 35px;
					border-radius: 20px;
					background-color: white;
					position:absolute;
					left: 640px;
					top: 13px;
				}
				/* 搜索栏分类功能 */
				#div_02{
					position: absolute;
					top: 10px;
					left: 10px;
					text-align: center;
					width: 50px;
					height: 20px;
			
				}
				#div_02_1{
					z-index:9999;
					width: 50px;
					position: relative;
					left: 12px;
					top:35px;
					padding-top: 3px;
					text-align: center;
					font-size:14px;
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
					right: 20px;
					top: 3px;
					text-align: center;
				}
				#ss_01{
					background-color: white;
					border: 0;
					border-radius: 15px;
					width: 52px;
					outline: none;
				}
				/*搜索分类层*/
				#div_02{
					position: absolute;
					top: 7px;
					left: 10px;
					text-align: center;
					width: 50px;
					height: 20px;			
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
				/*搜索结果层*/
				#div_6{
					background-color: white;
					width:900px;
					height:600px;
					top:225px;
					left: 200px;
					border-radius: 10px;
					position: absolute;
					z-index: 1;
					}
				/*头部div设置*/
				#tou_01{
					width: 100%;
					height: 46px;
					background-color:#1f1f1e;
					opacity:0.9;
					padding-top: 20px;
				}
				/*头部字体设置*/
				#touspan{
					color: whitesmoke;
					font-family: "微软雅黑";
					font-size: 13px;
				}
				/*搜索结果布局*/
				#div_8{
					width: 400px;
					height: 200px;
					margin-left: 20px;
					
				}
				/*评分 */
				#bj_01{
				width: 60px;
				height: 55px;
				background-color:#10bf46;
				position: absolute;
				text-align: center;
				padding-top: 6px;
				left:280px;
				top:260px;
				}
				/*名称 */
				#bj_02{
					width:300px;
					height:40px;
					position: absolute;
					left:90px;
					font-size: 25px;
					color:#4a85ef;
					padding-top: 5px;
					
				}
				/*照片 */
				#bj_03{
					width: 100px;
					height: 140px;
					position: absolute;
					left:90px;
					margin-top: 50px;
				}
				/*类型 */
				#bj_04{
					position: absolute;
					left:280px;
					margin-top: 50px;
				}
				/*导演  */
				#bj_05{
					position: absolute;
					left:280px;
					margin-top: 75px;
				}
				/*主演   */
				#bj_06{
					position: absolute;
					left:280px;
					margin-top: 100px;
				}
				/*字体 */
				#bj_zt{
					font-size: 14px;
					color:#757976;
				}
				
				/*热搜 */
				#rs_01{
					position: absolute;
					left: 580px;	
					top:150px;
				}
				#rs_02{
					position: absolute;
					left: 710px;	
					top:190px;
				}
				#rs_03{
					position: absolute;
					left: 580px;	
					top:350px;
				}
				#rs_04{
					position: absolute;
					left: 710px;	
					top:350px;
				}
    </style>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	function change(){
		document.getElementById("im").src="img/action/jj.jpg";
		document.getElementById("bj_02").innerHTML="建军大业";
		document.getElementById("score").innerHTML="7.8";
		document.getElementById("bj_zt").innerHTML="分钟-类型&nbsp;:&nbsp;108分钟--战争/青春";
		document.getElementById("bj_05").innerHTML="导演：  李安";
		document.getElementById("bj_06").innerHTML="半个娱乐圈";
	}
	function sear(){
		if(document.getElementById("bj_02").innerHTML=="建军大业"){
			location.href="MovieManager?method=findById&item=3";
		}else
			location.href="MovieManager?method=findById&item=4";
	}
	$(function(){
		
		var diy=document.getElementsByClassName("diy");
		$(".genrel").mouseover(function(){
			$(".lei").slideDown("slow");
			for(var i=0;i<diy.length;i++){
				$(diy[i]).fadeIn(i+3000);
			}
		});
		$("#mainss").mouseover(function(){
			$(".lei").slideUp("slow");
			$(".diy").hide();
		}); 
		
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
		
	})
	</script>
  </head>
  
  <body>
   <div class="bigbar">
	<a href="" class="page first"> 首页</a>
	<a class="page genrel">筛选</a>
	<a href="" class="page">我的订单</a>
	<img class="logo" src="img/logos.png"></a>
	<span class="cur up"></span>
	<div id="div_01">
				<!--搜索分类-->
					<div id="div_02">
						<input type="button" value="全部" style="border: 0;background: white;cursor: pointer;color: gray;outline: none;"
							  id="btn" />
					</div>
						<div id="div_02_1" style="display: none;" >
							<table id="bg_01" border="0" style="text-align: center;" >
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
	
	<!-- 搜索主页 -->
	<div id="mainss" style="width: 100%;height: 450px;z-index:-1;background-color: deepskyblue; position: absolute;top:65px;left:0" ></div>
		
		
	<div id="div_1">
		<div id="mian_search">
				<!--搜索分类-->
					<div id="div_02">
						<input type="button" value="全部" style="border: 0;background: white;cursor: pointer;color: gray;outline: none;"
							  id="btn" />
					</div>
					<!--搜索栏分类-->
						<div id="div_02_1" style="display: none;" >
							<table id="bg_01" border="0" style="text-align: center;" >
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
					<button id="ss_01" onclick="change()"><img src="img/ic_map_search_n.png"/></button>
				</div>
				
				<div id="div_5" class="up"><span style="color: #DCDCDC;font-size: 16px;">|</span></div>
		</div>
		</div>
		<div id="div_6" class="up">
				<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span  style="font-size: 15px; color: #aba9a9">影视&nbsp;&nbsp;&nbsp;&nbsp;影人&nbsp;&nbsp;&nbsp;&nbsp;作品</span><br/><hr color="#eceaea"/>
				<br/><br/>
				<!--热搜-->
				<div  id="rs_01">
						<span style="font-size: 15px; color:#777676">热搜：</span><br/><br/>
						<img src="img/al2.jpg"  width="100px"  height="140px">
				</div>
				<div id="rs_02">
					<img src="img/sansheng.jpg"  width="100px"  height="140px">
				</div>
				<div id="rs_03">
					<img src="img/nameto.jpg"  width="100px"  height="140px">
				</div>
				<div id="rs_04">
					<img src="img/gtx3.jpg"  width="100px"  height="140px">
				</div>
				<!--接收数据展示到页面-->
						<div id="div_8">
							<!--评分-->
								<div id="bj_01">
									<span style="font-size: 13px;color: white;">总评分</span><br/><span id="score" style="font-size: 23px;color: white;">9.2</span>
								</div>
							<!--名称-->
								<div id="bj_02">
									战狼2
								</div>
							<!--照片-->
								<div id="bj_03">
									<img id="im" src="img/action/index-1.jpg"  width="160px"  height="240px">
								</div>
							<!--类型-->
								<div id="bj_04">
									<span id="bj_zt">分钟-类型&nbsp;:&nbsp;120分钟--战争/动作 </span>
								</div>
							<!--导演-->
								<div id="bj_05">
									<Span id="bj_zt">导演&nbsp;:&nbsp;吴京</Span>
								</div>
								
							<!--主演-->	
								<div id="bj_06"> 
									<span id="bj_zt">主演&nbsp;:&nbsp;吴京，卢靖珊，安得鲁</span>
								</div>
								<div onclick="sear()" style="cursor:pointer;width:150px;line-height:37px;text-align:center;height:40px;background:aqua;border-radius:20px;position: absolute;left:280px;top:360px">
									立即购票
								</div>
						</div>
						<br/>
				</div>
				
				<div style="position:absolute;top:840px;width:90%;height:70px;line-height:70px;color:gray;text-align: center">
		<hr style="margin-left:120px">
		&copy版权所有，翻版必究，咖啡时光网由Coffee团队制作<img alt="" src="img/logos.png" width="75" height="45" > 最终解释权归Coffee团队所有&nbsp&nbsp|&nbsp&nbsp<a href="">联系我们</a>
		</div>
  </body>
</html>
