<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>淘宝</title>
<link rel="stylesheet" type="text/css" href="css/reset .css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var a=0;
	function save(o) {
		a++;
		alert(a);
		
	}
</script>
</head>

<body>
	<div class="container">
		<div class="top" style="margin-top: 5px">
			<div class="fl">欢迎来到靓宝商城！我的首页</div>
			<div class="fr">
				<ul>
					<li><img src="img/zhanghu.png" class="img0" /> 
						<c:if test="${sessionScope.cuser!=null}">${sessionScope.cuser.nickname}</c:if>
						<c:if test="${sessionScope.cuser==null}">
						<a
						href="login.jsp">请登录</c:if></a></li>
					<li><a href="register.jsp">快速注册</a></li>
					<li><img src="img/xin.png" class="img0" /> <a href="#">我的收藏</a>
					</li>
					<li>
					<a href="shopcar.html">我的订单</a></li>
					<li><img src="img/phone.png" class="img0" /> <a href="#">手机靓宝</a>
					</li>
					<li><a href="#">我的积分</a></li>
					<a href="outlogin.html">退出</a>
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<div class="frist">
			<div class="left fl">
				<div class="fl">
					<img src="img/LOGO.png" />
				</div>
				
				<div class="clear"></div>
			</div>
			<div class="right fr">
				<input type="button" name="" id="" value="搜 索" /> <input
					type="text" name="" id="" value="商品" />
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		
		<div class="etow" style="margin-bottom: 15px">
				<div class="etow_left fl">
					<div class="etow_left_top">
						所有产品分类
					</div>
					<div class="etow_left_btn">
						<ul>
						<c:forEach var="r" items="${requestScope.ptlist}">
							<c:if test="${r.parentid==0}">
							<li>
								<ul class="etowul">
									<li class="etowulli">${r.name}</li>
									<c:forEach var="r1" items="${requestScope.ptlist}">
									<c:if test="${r1.parentid==r.id}">
									<li><a href="index.html?producttype_id=${r1.id}">${r1.name}</a></li>
									</c:if>
									</c:forEach>
								</ul>
							</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>
					
				</div>
				<div  class="fl" style="margin-left: 10px">
					<img src="img/01.jpg" >
				</div>
				<div class="clear">
					
				</div>
			</div>
		
		<div class="second">
			<div class="fl">
				<div class="txt fl" style="border-bottom: 2px solid red;">
					<a href="#">全部商品</a>
				</div>
				<div class="txt fl">
					<a href="#">降价商品</a>
				</div>
				<div class="txt fl">
					<a href="#">库存紧张</a>
				</div>
			</div>
			
			<div class="clear"></div>
		</div>
		
		<div style="margin-top: 15px;">
			<c:forEach var="r2" items="${requestScope.productlist}">
			<div style="width: 190px;height: 200px;border: 1px #cdcdcd solid;margin: 4px 5px;" class="fl">
				<div style="margin: 3px 10px">
				<img src="${r2.url}" width="160px" height="150px">
				<b><a href="info.html?id=${r2.id}">${r2.name}</a></b>
				</div>
				<div>
					<div style="font-size: 15px;margin-left:10px" class="fl">￥<b>${r2.price}</div>
					<div style="margin-right: 12px" class="fr shopcar"><a><img src="img/car_06.png" onclick="save(this);"></img></a></div>
					
					<div class="clear"></div>
				</div>
			</div>
			</c:forEach>
			<div class="clear"></div>
		</div>
		<div class="forth">
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png" />
				</div>
				<div class="txt fl">
					<div class="txt1 fl">品质保障</div>
					<div class="txt2 fl">品质护航 购物无忧</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png" />
				</div>
				<div class="txt fl">
					<div class="txt1 fl">七天无理由退换货</div>
					<div class="txt2 fl">为您提供售后无忧保障</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png" />
				</div>
				<div class="txt fl">
					<div class="txt1 fl">特色服务体验</div>
					<div class="txt2 fl">为您呈现不一样的服务</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png" />
				</div>
				<div class="txt fl">
					<div class="txt1 fl">帮助中心</div>
					<div class="txt2 fl">您的购物指南</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>

		<div class="eight">
			<div class="frist1 fl">
				<div class="txt1">购物指南</div>
				<div class="txt2">免费注册</div>
				<div class="txt2">开通支付宝</div>
				<div class="txt2">支付宝充值</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">品质保障</div>
				<div class="txt2">发票保证</div>
				<div class="txt2">售后服务</div>
				<div class="txt2">缺货赔付</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">支付方式</div>
				<div class="txt2">快捷支付</div>
				<div class="txt2">信用卡</div>
				<div class="txt2">货到贷款</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">商家服务</div>
				<div class="txt2">商家入驻</div>
				<div class="txt2">商家中心</div>
				<div class="txt2">物流服务</div>
			</div>
			<div class="frist5 fr">
				<div class="txt1">手机靓宝</div>
				<div class="">
					<img src="img/saoma1.png" class="img5" />
				</div>
			</div>
			<div class="clear"></div>
		</div>

		<div class="nine">
			<div class="txt">关于靓淘 &nbsp; &nbsp;帮助中心&nbsp;&nbsp; 开房平台&nbsp;
				&nbsp; 诚聘精英&nbsp;&nbsp;联系我们&nbsp;&nbsp; 网站合作&nbsp;&nbsp;
				法律声明及隐私政策&nbsp;&nbsp;知识产权&nbsp;&nbsp; 廉政举报&nbsp;&nbsp; 规则意见征集</div>
		</div>

		<div class="ten">
			<div class="txt">OOPYRIGHT 2010-2017 北京创锐文化有限公司 UHEL.COM
				保留一切权利。 客服热线：400-123-8888 &nbsp;京公安网安备 11010102001226|
				京[CP证111033号|食品流通许可证SP11011051110165515] （1-1）|营业执照</div>
		</div>
	</div>
</body>

</html>