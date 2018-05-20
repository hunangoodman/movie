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
    
    <title>My JSP 'movieinfo.jsp' starting page</title>
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
		
		p{
			margin-top:	10px;
			word-wrap:break-word;
			font-size: 19px;
			line-height: 26px;	
			font-weight:50;
			color:white;
			letter-spacing: 1px;
		}
.button{
	width:120px;
	height: 38px;
	background: #00BFFF;
	border-radius: 20px;
	text-align: center;
	line-height: 35px;
	color: white;
	font-family: "微软雅黑";
	cursor: pointer;
}	
#movie_content1{
	z-index:1px;
	background:url('img/28.jpg');
	background-color:rgba(158, 158, 158, 0.12);
	width: 100%;
	height: 480px;
}
#movie_tp{
	float: left;
	width: 230px;
	height: 360px;
	margin-left: 50px;
	margin-top: 50px;
}

#movie_yy{
	z-index:90px;
	float: left;
	margin-left: 30px;
	margin-top: 60px;
	width: 800px;
	height: 330px;
}

.moves{
	z-index:1;
	width:100%;
	height:251px;
	margin:auto;
	background:rgba(158, 158, 158, 0.2);
	border-top:0.4px solid rgba(158, 158, 158, 0.2);
	border-radius:10px;
	padding-left: 30px;
}
.moves_title{
	float:left;
	margin-top:60px;
	font-size: 28px;
	
 }
 
 .moves_pingfen{
	 float:left;
 	margin-top:60px;
 	margin-left:300px;
 	font-size:25px;
 	color:#ee48a3;
 }
 .moves_money{
 	float:left;
 	margin-left:150px;
 	margin-top:60px;
 	font-size: 18px;
 }
 .move_btn{
 		float:left;
 		margin-left: 55px;
 		margin-top:60px;
 }	
    </style>
	<script type="text/javascript">
		function tiket(cid,mname,hid,sess){
			location.href="MovieManager?method=findPlace&cid="+cid+"&mid="+mname+"&hid="+hid+"&sess="+sess;
		}	
		function getover1(o){
			o.style.backgroundColor="#4eccf6";
		}
		function getout1(o){
			o.style.backgroundColor="#00BFFF";
		}
		function getover(o){
			var v = document.getElementById(o);
			v.style.width="830px";
			v.style.height="220px";
		}
		
		function getout(o){
			var v = document.getElementById(o);
				v.style.width="800px";
				v.style.height="200px";
		}
		//相关电影
		function getXingguang(){
			
		}
		</script>
  </head>
  <!-- 头部 -->
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
 <!-- 详情-->
    <div id="movie_content1">
			<div id="movie_tp">
				<img src="${movie.moviepic }" width="230px" height="360px"/>
			</div>	
				<div id="movie_yy">
				<p style="margin-top:5px;margin-bottom:20px;font-size:40px;text-shadow:0 0 0.22em #f87,-0 -0  0.2em #f87;">${movie.moviename }</p>
					<p>电影评分:${movie.grade}</p>
					<p>导演:${movie.direct }&nbsp;主演:${movie.act }</p>
					<p>地区:中国大陆&nbsp;时长:${movie.timelen}分钟&nbsp;上映时间:${movie.showtime}</p><br>
					<p>
					剧情:&nbsp;${movie.introduce }
					</p><br>
				<div class="button" onmouseover="getover1(this)"onmouseout="getout1(this)" onclick="getXingguang()">相似影片</div>
			</div>
		</div>
	<!-- 院线 -->	
    	<c:forEach var="s" items="${list }"  >
    			<div  class ="moves" id="moves${s}" >
    				<div class="moves_title"><a href="javascrtpt:">${s.cname}</a></div>
    				<div class="moves_pingfen">${s.sess }&nbsp;&nbsp;${s.hname }&nbsp;</div>
    				<div class="moves_money"><span style="color:orange;font-size: 25px">￥${s.price}</span>&nbsp;起</div>
    				<div class="move_btn">
	    				<input type="button" value="选座购票"
	    				 style="width: 130px;height: 40px;background: #00BFFF;
	    				 color:white;border:0px;cursor: pointer;outline: none;
	    				 border-radius: 20px;" onclick="tiket('${s.cid}','${s.mid}','${s.hid }','${s.sess }')"/>
    				 </div>
    				
    				<div class="move_addres" style="color: gray;font-size: 18px;padding-top: 120px;margin-top:40px">${s.caddress} </div>
    			</div>
    	</c:forEach>
  </body>
</html>
