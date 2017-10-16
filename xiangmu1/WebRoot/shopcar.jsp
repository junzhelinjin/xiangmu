<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>淘宝</title>
		<link rel="stylesheet" type="text/css" href="css/reset .css"/>
		<link rel="stylesheet" type="text/css" href="css/style1.css" />
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript">
			function all1() {
				var allorder=$(".order");
				$(".allsum").text("0");
				for(var i=0;i<allorder.size();i++){
					var onprice=parseFloat($(allorder[i]).find(".onprice").text());
					var count=parseFloat($(allorder[i]).find(".salecount").val());
					var sum=onprice*count;
					$(allorder[i]).find(".sum1").text(sum);
					var allsum=parseFloat($(".allsum").text());
					if($(allorder[i]).find("[type=checkbox]").attr("checked")){
						$(".allsum").text(allsum+sum);
					}
				}
			}
			function all2(o) {
				var count=$(o).parent().next().find(".salecount").attr("value");
				if(count>1){
				count=parseFloat(count)-1;
				$(o).parent().next().find(".salecount").attr("value",count);
				all1();
				}
			}
			function all3(o) {
				var count=$(o).parent().prev().find(".salecount").attr("value");
				count=parseFloat(count)+1;
				$(o).parent().prev().find(".salecount").attr("value",count);
				all1();
				
			}
			function checkall() {
				if($("#checkall").attr("checked")){
					$(".abc").attr("checked","true");
					all1();
				}else{
					$(".abc").attr("checked","");
					all1();
				}
			}
			function checkall1() {
				if($("#checkall1").attr("checked")){
					$(".abc").attr("checked","true");
					all1();
				}else{
					$(".abc").attr("checked","");
					all1();
				}
			}
			function del(o) {
				if (confirm("是否删除"))
					location.href = "operator/del?id=" + $(o).prev().val();
			}
		</script>
	</head>

	<body>
		<div class="container">
			<div class="top">
				<div class="fl">
					<a href="index.html">欢迎来到靓宝商城！我的首页</a>
				</div>
				<div class="fr">
					<ul>
						<li><img src="img/zhanghu.png" class="img0" />
							<c:if test="${sessionScope.cuser!=null}">${sessionScope.cuser.nickname}</c:if>
						<c:if test="${sessionScope.cuser==null}">
						<a href="login.jsp">请登录</c:if></a>
						</li>
						<li>
							<a href="#">快速注册</a>
						</li>
						<li><img src="img/xin.png" class="img0" />
							<a href="#">我的收藏</a>
						</li>
						<li>
							<a href="shopcar.html">我的订单</a>
						</li>
						<li><img src="img/phone.png" class="img0" />
							<a href="#">手机靓宝</a>
						</li>
						<li>
							<a href="#">我的积分</a>
						</li>
						<li>
							<a href="outlogin.html">退出</a>
						</li>
					</ul>
				</div>
				<div class="clear">

				</div>
			</div>

			<div class="frist">
				<div class="left fl">
					<div class="fl">
						<a href="index.html"><img src="img/LOGO.png" /></a>
					</div>
					<div class="txt fr">
						购物车
					</div>
					<div class="clear">

					</div>
				</div>
				<div class="right fr">
					<input type="button" name="" id="" value="搜 索" />
					<input type="text" name="" id="" value="华为" />
					<div class="clear">
						
					</div>
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
				<div class="fr">
					配送至：
					<select name="">
						<option value="">山东省&nbsp;青岛市&nbsp;崂山区</option>
					</select>
				</div>
				<div class="clear">

				</div>
			</div>
			<div class="thrid">
				<div class="word1 fl">
					<input type="checkbox" id="checkall" onclick="checkall();"/> 全选
				</div>
				<div class="word2 fl">
					商品
				</div>
				<div class="word3 fl">
					单价
				</div>
				<div class="word3 fl">
					数量
				</div>
				<div class="word3 fl">
					小计
				</div>
				<div class="word3 fl">
					操作
				</div>
				<div class="clear">

				</div>
			</div>
			<div>
			<c:forEach var="r" items="${requestScope.shopcar}">
			<div class="fifth order">
				<div class="btn fl">
					<div class="frist2 fl">
						<input type="checkbox" class="abc" onclick="all1();"/>
					</div>
					<div class="second2 fl">
						<img src="${r.url}" style="width: 80px" class="img3"/>
					</div>
					
					<div class="third2 fl">
						<div class="txt3">
							${r.info}
						</div>
						<div class="txt4">
							<img src="img/160.png"/>&nbsp;支持7天无理由退货
						</div>
						<div class="txt5">
							<img src="img/161.png"/>&nbsp;选包装
						</div>
						<div class="">

						</div>
					</div>
					
					<div class="fifth2 fl">
						<div class="txt6">
							<del>${r.price}</span>
						</div>
						<div class="onprice">
							${r.price*r.disc}
						</div>
					</div>
					<div class="fourth2 fl subcount">
						<div class="left fl">
							<a href="javascript:;" onclick="all2(this);">—</a> 
						</div>
						<div class="fl" style="padding: 6px 6px;">
							<input style="width: 20px;height: 18px;border: none;padding:0 0;" type="text" class="salecount" onchange="all1();" value="${r.count}">
						</div>
						<div class="right fr">
						&nbsp;<a href="javascript:;" onclick="all3(this);">+</a> 
						</div>
						<div class="clear">
							
						</div>
					</div>
					<div class="six2 fl sum1">
						${r.price*r.disc*r.count}
					</div>
					<div class="six2 fl " style="margin-left:160px">
					<input type="hidden" value="${r.id}">
						<a href="javascript:;"><img src="img/166.png" /></a>
					</div>
					<div class="clear">

					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			</c:forEach>
			
			<div class="six">
				<div class="left fl">
				<input type="checkbox" id="checkall1" onclick="checkall()1;"/> 全选
				</div>
				<div class="mid fl">
					总金额（以免运费） ： &nbsp;￥<span class="allsum">0</span>
				</div>
				<div class="right fr">
					<div class="txt">
						<a href="#" style="color: white;">立即结算</a>
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
		</div>
		<div class="forth">
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png"/>
				</div>
				<div class="txt fl">
					<div class="txt1 fl">
						品质保障
					</div>
					<div class="txt2 fl">
						品质护航 购物无忧
					</div>
					<div class="clear">
						
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png"/>
				</div>
				<div class="txt fl">
					<div class="txt1 fl">
						七天无理由退换货
					</div>
					<div class="txt2 fl">
						为您提供售后无忧保障
					</div>
					<div class="clear">
						
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png"/>
				</div>
				<div class="txt fl">
					<div class="txt1 fl">
						特色服务体验
					</div>
					<div class="txt2 fl">
						为您呈现不一样的服务
					</div>
					<div class="clear">
						
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			<div class="frist fl">
				<div class="fl">
					<img src="img/you.png"/>
				</div>
				<div class="txt fl">
					<div class="txt1 fl">
						帮助中心
					</div>
					<div class="txt2 fl">
						您的购物指南
					</div>
					<div class="clear">
						
					</div>
				</div>
				<div class="clear">
					
				</div>
			</div>
			<div class="clear">
				
			</div>
		</div>
		
		<div class="eight">
			<div class="frist1 fl">
				<div class="txt1">
					购物指南
				</div>
				<div class="txt2">
					免费注册
				</div>
				<div class="txt2">
					开通支付宝
				</div>
				<div class="txt2">
					支付宝充值
				</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">
					品质保障
				</div>
				<div class="txt2">
					发票保证
				</div>
				<div class="txt2">
					售后服务
				</div>
				<div class="txt2">
					缺货赔付
				</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">
					支付方式
				</div>
				<div class="txt2">
					快捷支付
				</div>
				<div class="txt2">
					信用卡
				</div>
				<div class="txt2">
					货到贷款
				</div>
			</div>
			<div class="frist1 fl">
				<div class="txt1">
					商家服务
				</div>
				<div class="txt2">
					商家入驻
				</div>
				<div class="txt2">
					商家中心
				</div>
				<div class="txt2">
					物流服务
				</div>
			</div>
			<div class="frist5 fr">
				<div class="txt1">
					手机靓宝
				</div>
				<div class="">
					<img src="img/saoma1.png" class="img5"/>
				</div>
			</div>
			<div class="clear">
				
			</div>
		</div>
		
		<div class="nine">
			<div class="txt">
			关于靓淘 &nbsp; &nbsp;帮助中心&nbsp;&nbsp; 开房平台&nbsp; &nbsp;
			诚聘精英&nbsp;&nbsp;联系我们&nbsp;&nbsp; 网站合作&nbsp;&nbsp;
			法律声明及隐私政策&nbsp;&nbsp;知识产权&nbsp;&nbsp; 
			廉政举报&nbsp;&nbsp; 规则意见征集
			</div>
		</div>
		
		<div class="ten">
			<div class="txt">
				OOPYRIGHT 2010-2017 北京创锐文化有限公司 UHEL.COM 保留一切权利。
				客服热线：400-123-8888 &nbsp;京公安网安备 11010102001226|
				京[CP证111033号|食品流通许可证SP11011051110165515] （1-1）|营业执照
			</div>
		</div>
		</div>
	</body>
</html>