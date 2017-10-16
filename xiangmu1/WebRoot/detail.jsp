<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/reset .css" />
		<link rel="stylesheet" type="text/css" href="css/style2.css" />
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/basic.js"></script>
		<script type="text/javascript" src="js/layer/layer.js"></script>
		<script type="text/javascript" src="js/jquery.jqzoom.js"></script>
		<script type="text/javascript" src="js/base.js"></script>
		
		<script type="text/javascript">
			function add() {
				var data={id:parseInt($("#proid").val()),count:parseInt($(".counttext").val())};
				
				$.ajax({type:"POST",url:"addshopcar.html",data:data,dataType: "json",success: function(json){
					if(json.status>0){
						showMsg("已成功添加到购物车");
						$(".reimg").attr("src","img/yuan1.png");
					}else{
						var fun=function (){
							location.href="info.html?id="+$("#proid").val();
						}
						showPage("欢迎购买","login1.jsp",300,200,fun,true);
					}
					
				}});
			};
			
		</script>
	</head>

	<body>
		<div class="">
			<div class="container">
				<div class="top_logo">
					<div class="fl">
						欢迎来到靓包商城! 首页
					</div>
					<div class="fr">
						<ul>
							<li><img src="img/zhanghu.png" height="13px" />
								<c:if test="${sessionScope.cuser!=null}">${sessionScope.cuser.nickname}</c:if>
						<c:if test="${sessionScope.cuser==null}">
						<a href="login.jsp">请登录</c:if></a>
							</li>
							<li>
								<a href="#">快速注册</a>
							</li>
							<li><img src="img/xin.png" />
								<a href="#">我的收藏</a>
							</li>
							<li>
								<a href="shopcar.html">我的订单</a>
							</li>
							<li><img src="img/phone.png" />
								<a href="#">手机靓宝</a>
							</li>
							<li>
								<a href="#">我的积分</a>
							</li>
							<li>
								<a href="outlogin">退出</a>
							</li>
						</ul>
					</div>
					<div class="clear">

					</div>
				</div>
				<div class="frist">
					<div class="left fl">
						<img src="img/LOGO.png" />
					</div>
					<div class="frist-input fl">
						<input type="text" name="" id="" value="魅蓝2" class="frist-input-text" /><input type="button" id="" value="搜索" class="frist-input-button" />
					</div>
					<div class="first-over fr">
					<input type="hidden" id="proid" value="${requestScope.info.id}">
						<img src="img/car_06.png" />
						<a href="shopcar.html"> &nbsp;去购物车结算</a>
						<img src="img/170.png" class="reimg"></img>
					</div>
					<div class="clear">

					</div>
				</div>
				<div class="text">
					<a href="#">值得哭 |</a>
					<a href="#">小米6 |</a>
					<a href="#">金立 |</a>
					<a href="#">华为畅想7 |</a>
					<a href="#">苹果7 |</a>
					<a href="#">一元800M </a>
				</div>
				<div class="secont-logo">
					<ul>
						<li>
							<a href="#">全部商品分类</a>
						</li>
						<li>
							<a href="#">商城首页</a>
						</li>
						<li>
							<a href="#">手机首页</a>
						</li>
						<li>
							<a href="#">新机首发</a>
						</li>
						<li>
							<a href="#">手机社区</a>
						</li>
						<li>
							<a href="#">企业采购</a>
						</li>
						<li>
							<a href="#">精选店铺</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="line">
				<div class="container">
					<div class="line-left fl">
						<li>
							<a href="#">家电数码</a> <img src="img/135.png" /></li>
						<li>
							<a href="#">手机通信</a> <img src="img/135.png" /></li>
						<li>
							<a href="#">手机</a> <img src="img/135.png" /></li>
						<li>
							<a href="#"><span>华为(HUAWEI)<img src="img/129.png" class="img0"/></span></a> <img src="img/135.png" /></li>
						<li>
							<a href="#">华为畅想6S</a> <img src="img/135.png" /></li>
					</div>
					<div class="fr">
						<div class="line-fr fl">
							<a href="">华为官方旗舰店</a>
						</div>
						<div class="line-fr fl">
							<img src="img/tou.png" />
							<a href="">联系供应商</a>
						</div>
						<div class="line-fr fl">
							<img src="img/shoucang2.png" />
							<a href="#">关注店铺</a>
						</div>
						<div class="clear">

						</div>
					</div>
					<div class="clear">

					</div>
				</div>
			</div>
			<div class="thrid">
				<div class="container">
					<div class="thrid-left fl">
						<div class="thrid-left-top">
							<div id="preview" class="spec-preview">
								<span class="jqzoom">
										<img jqimg="img/41.png" src="img/41.png" />
								</span>
							</div>
							<!--缩图开始-->
							<div class="spec-scroll">
								<a class="prev">&lt;</a>
								<a class="next">&gt;</a>
								<div class="items">
									<ul>
										<c:forEach var="r" items="${requestScope.info.piclist}">
											<li><img bimg="${r.url}" src="${r.url}" onmousemove="preview(this);"/></li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<div class="thrid-left-bottom">
							<ul>
								<li><img src="img/xin.png" />
									<a href="">关注</a>
								</li>
								<li><img src="img/enjoy.png" />
									<a href="">分享</a>
								</li>
								<li><img src="img/duizhao.png" />
									<a href="">对照</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="thrid-right fl">
						<div class="thrid-frist">
							<ul>
								<li>${requestScope.info.name}</li>
							</ul>
						</div>
						<div class="thrid-three">
							<div class="thrid-three-one">
								<div class="fl img1">
									<img src="img/117.png" />
								</div>
								<div class="text1 fl">全靓淘食物商品通用</div>
								<div class="thrid-text fl">
									<a href="#" style="color: #f80e3f;;">去刮奖</a>
									<img src="img/120.png" />
								</div>
								<div class="clear">

								</div>
							</div>
							<div class="thrid-three-one">
								<div class="word4 fl">促&nbsp;&nbsp;销</div>
								<div class="img2 fl">
									<span class="thrid-three-two">${requestScope.info.price*requestScope.info.disc}</span>
									<del class="thrid-three-th">${requestScope.info.price}</del>
								</div>
								<div class="clear">

								</div>
							</div>
							<div class="thrid-three-one">
								<div class="word4 fl">支&nbsp;&nbsp;持</div>
								<div class="img2 fl">
									<img src="img/119.png" / class="fl class=" img2 "">
									<img src="img/118.png" class="fl" class="img2" />
								</div>
								<div class="clear">

								</div>
							</div>
							<div class="thrid-three-one">
								<div class="word4 fl">本店活动</div>
								<div class="word3 fl">
									满79，包邮
								</div>
								<div class="thrid-text2 fl">
									<div class="">
										更多优惠 &nbsp;<img src="img/111.png" />
									</div>
								</div>
								<div class="clear">

								</div>
							</div>
						</div>
						<div class="thrid-four">
							<div class="word4 fl">运&nbsp;&nbsp;费 </div>
							<div class="word3 img2 fl">
								广东深圳 至 青岛 <img src="img/129.png" /> 市南区 <img src="img/129.png" /> 香港中路街道 <img src="img/129.png" /> 快递 :0.00
							</div>
							<div class="clear">

							</div>
						</div>
						<div class="thrid-five">
							<div class="word4 fl">重&nbsp;&nbsp;量</div>
							<div class="word3 img2 fl">
								0.33kg
							</div>
							<div class="clear">

							</div>
						</div>
						<div class="thrid-six">

							<ul>
								
								<li>
									<ul>
										<li class="li-color">购买方式</li>
										<li class="li-border div-pei">分期付款</li>
									
									</ul>
								</li>
								<li>
									<ul>
										<li class="li-color">套&nbsp;&nbsp;餐</li>
										<li class="li-border">优惠套餐1</li>
										<li class="li-border">优惠套餐2</li>
										<li class="li-border">优惠套餐3</li>
										<li class="li-border">优惠套餐4</li>
										<li class="li-border">优惠套餐5</li>
									</ul>
								</li>
								<li>
									<div class="li-color">
										<div class="fl">增值保障&nbsp;</div>
										<div class="li-border fl div-bao">
											<div class="fl">
												<img src="img/cu.png" class="img3" />
											</div>
											<div class="fl">
												<select class="li-color-select">
													<option value="">碎屏包一年￥66</option>
												</select>
											</div>
											<div class="clear">

											</div>
										</div>
										<div class="li-border fl div-bao">
											<div class="fl">
												<img src="img/124.png" class="img3" />
											</div>
											<div class="fl">
												<select class="li-color-select">
													<option value="">一年换新 ￥36</option>
												</select>
											</div>
											<div class="clear">

											</div>
										</div>
										<div class="li-border fl div-bao">
											<div class="fl">
												<img src="img/125.png" class="img3" />
											</div>
											<div class="fl">
												<select name="">
													<option value="">碎屏包两年 ￥96</option>
												</select>
											</div>
											<div class="clear">

											</div>
										</div>
										<div class="clear">

										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="thrid-eit">

							<div>
								<div class="li-color fl thrid-eit-text">数&nbsp;&nbsp;量</div>
								<div class="thrid-eit-fi fl ">
									<div class="fl ">
										<input type="text"  name="count" min="1" value="1" class="counttext " />
									</div>
									<div class="fl ">
										<div class=" ">
											<input type="button" id="conuntbtn" value="+" />
										</div>
										<div class=" ">
											<input type="button" id="conuntbtn1" value="-" />
										</div>
									</div>
									<div class="clear ">

									</div>
								</div>
								<div class="thrid-eit-fi-over fl">
									<a href="javascript:add();" style="color: white;text-decoration: none;">加入购物车</a>
								</div>
								<div class="clear">

								</div>
							</div>

							<ul>
								<li>
									<ul>
										<li class="li-color">本地活动</li>
										<li class="li-color">
											<a href="#">4G套餐低至18元》</a>
										</li>
										<li class="li-color">温馨提示</li>
										<li class="li-color">支持7天无理由退货</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="clear">

					</div>
				</div>
			</div>

			<div class="four">
				<div class="container">
					<div class="">
						<div class="meta-left fl">
							<div class="meta-left-title">
								关于手机您可能要找
							</div>
							<div>
								<ul class="meta-left-bottom">
									<li class="meta-left-ul">
										<a href="" #>安卓(Android)</a>
									</li>
									<li>
										<ul class="meta-left-ul">
											<li>
												<a href="" #>5.0-4.6英寸</a>
											</li>
											<li>
												<a href="" #>双卡双待</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="meta-left-ul">
											<li>
												<a href="" #>晓龙芯片</a>
											</li>
											<li>
												<a href="" #>自拍神器</a>
											</li>
											<li>
												<a href="" #>3GB</a>
											</li>
										</ul>
									</li>
									<li>
										<ul class="meta-left-ul">
											<li>
												<a href="#">联通4G</a>
											</li>
											<li>
												<a href="#">电信4G</a>
											</li>
										</ul>
									</li>
									<li class="meta-left-ul">
										<a href="" #>联通4G/移动4G/电信4G</a>
									</li>
									<li>
										<ul class="meta-left-ul">
											<li>
												<a href="#">移动4G</a>
											</li>
											<li>
												<a href="#">32G</a>
											</li>
											<li>
												<a href="#">八核</a>
											</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
						<div class="meta-bottom fl">
							<div class="meta-bottom-top">
								<div class="meta-bottom-top-f fl">
									<div class="fl">
										<img src="img/phone1.png" />
									</div>
									<div class="meta-bottom-top-text fl">
										分辨率 : 1280 x 720 (HD)
									</div>
									<div class="clear">

									</div>
								</div>
								<div class="meta-bottom-top-f fl">
									<div class="fl">
										<img src="img/shexiang.png" />
									</div>
									<div class="fl">
										<div class="meta-bottom-top-text">
											后置摄像头 : 1300万像素
										</div>
										<div class="meta-bottom-top-text">
											前置摄像头 : 500万像素
										</div>
									</div>
									<div class="clear">

									</div>
								</div>
								<div class="meta-bottom-top-f fl">
									<div class="fl">
										<img src="img/cpu.png" />
									</div>
									<div class="fl">
										<div class="meta-bottom-top-text">
											核数 : 八核
										</div>
										<div class="meta-bottom-top-text">
											频数 : 最高1.4GHz
										</div>
									</div>
								</div>
								<div class="clear">

								</div>
							</div>
							<div class="meta-bottom-mid">
								<span id="meta-bottom-mid-f">
									品牌
								</span>
								<span id="meta-bottom-mid-s">
									: 华为 ( HUAWEI )
								</span>
								<span id="meta-bottom-mid-t">
									<img src="img/xin.png"/>
									关注
								</span>
							</div>
							<div class="meta-bottom-bom">
								<div class="meta-bottom-bom-ul fl">
									<ul>
										<li>商品名称 : 华为畅享6S</li>
										<li>系 统 : 安卓 (Andrid)</li>
										<li>机身内存 : 32GB</li>
									</ul>
								</div>
								<div class="fl meta-bottom-bom-ul">
									<ul>
										<li>商品编号 : 4207732</li>
										<li>运行内存 : 32GB</li>
										<li>机身颜色 : 金色、银色、粉色</li>
									</ul>
								</div>
								<div class="fl meta-bottom-bom-ul">
									<ul>
										<li>商品产地 : 中国大陆</li>
										<li>电池容量 : 3000mAh-3999mAh</li>
									</ul>
								</div>
								<div class="fl">
									<ul>
										<li>商品毛重 : 330.00g</li>
										<li>热 点 : 晓龙芯片，双卡双待</li>
									</ul>
								</div>
								<div class="clear">

								</div>
							</div>
							<div class="meta-bottom-last fr">
								<a href="" style="color: #5faded;">更多参数 》</a>
							</div>
						</div>
						<div class="clear">

						</div>
					</div>
				</div>
			</div>

			<div class="five">
				<div class="container">
					<div class="five-frame">
						<div class="fl">
							<div class="five-frame-top">
								达人选购
							</div>
							<div class="five-frame-bottom">
								<div class="">
									<img src="img/138.png" / style="margin-top: 15px;">
									<p class="five-frame-bottom-p">
										<a href="#">荣耀 畅玩6X 32GB 全网通4G 手机 高配版 铂金光</a>
										<p class="price">￥1299</p>

									</p>
									<img src="img/139.png" />
									<p class="five-frame-bottom-p">
										<a href="#">华为 4GB 32GB 全网通4G 手机 高配版 白色</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/140.png" />
									<p class="five-frame-bottom-p">
										<a href="#">华为 HUAWEI noal 54GB版本 手机 高配版 玫瑰金</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/141.png" />
									<p class="five-frame-bottom-p">
										<a href="#">华为 麦芒5X 54GB 全网通4G 手机 高配版 香槟金</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/142.png" />
									<p class="five-frame-bottom-p">
										<a href="#">荣耀 V9 4GB+54GB 全网通4G 手机 高配版 极光蓝</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/143.png" />
									<p class="five-frame-bottom-p">
										<a href="#">荣耀 畅玩7X 54GB 全网通4G 手机 高配版 铂金光</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/144.png" />
									<p class="five-frame-bottom-p">
										<a href="#">荣耀 P9 双卡双待 全网通4G 手机 高配版 铂金光</a>
										<p class="price">￥1299</p>
									</p>
									<img src="img/145.png" />
									<p class="five-frame-bottom-p">
										<a href="#">荣耀8 青春版 32GB 全网通4G 手机 高配版 铂金光</a>
										<p class="price">￥1299</p>
									</p>

								</div>
							</div>

							<div class="five-frame-left-btm">
								<div class="five-frame-left-btm-t">
									手机热销榜
								</div>
								<div class="five-frame-left-btm-m">
									<ul>
									<li id="five-sp">同价位</li>
									<li id="five-sp">同品牌</li>
									<li id="five-sp">总排行</li>
									</ul>
								</div>
								<div class="five-frame-left-btm-b">
									<div class="five-img relative">
										<div class="fl">
											<img src="img/146.png" />
										</div>
										<div class="img4">
											<img src="img/yuan1.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">华为荣耀6X</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/147.png" />
										</div>
										<div class="img4">
											<img src="img/yuan2.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">360N5</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/148.png" />
										</div>
										<div class="img4">
											<img src="img/yuan3.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">小米Note4</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/149.png" />
										</div>
										<div class="img4">
											<img src="img/yuan4.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">华为荣耀6X</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/150.png" />
										</div>
										<div class="img4">
											<img src="img/yuan5.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">华为荣耀6X</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/151.png" />
										</div>
										<div class="img4">
											<img src="img/yuan6.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">华为荣耀6X</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
									<div class="five-img relative">
										<div class="fl">
											<img src="img/164.png" />
										</div>
										<div class="img4">
											<img src="img/yuan7.png" />
										</div>
										<div class="fl">
											<p class="img4-text">
												<a href="#">华为荣耀6X</a>
											</p>
											<p class="price">￥1699.00</p>
										</div>
										<div class="clear">

										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="fl five-frame-right">
							<img src="img/tu.png" />
						</div>
						<div class="clear">

						</div>
					</div>
				</div>
			</div>
			<div class="elv">
				<div class="container">
					<div class="img6">
					<img src="img/5售后.png" style="width: 800px; margin-left: 209px;"/>
					</div>
				</div>
			</div>
			<div class="six">
				<div class="container">
					<div class="phont fl">

						<div class="img5 fl">
							<img src="img/you.png" />
						</div>
						<div class="txt fl words">
							<div class="word1">
								品质保障
							</div>
							<div class="">
								品质护航 购物无忧
							</div>
						</div>
						<div class="clear">

						</div>
					</div>
					<div class="phont fl">
						<div class="img5 fl">
							<img src="img/7tian.png" />
						</div>
						<div class="txt fl words">
							<div class="word1">
								七天无理由退换货
							</div>
							<div class="">
								为您提供售后无忧保障
							</div>
						</div>
						<div class="clear">

						</div>
					</div>
					<div class="phont fl">
						<div class="img5 fl">
							<img src="img/te.png" />
						</div>
						<div class="txt fl words">
							<div class="word1">
								特色服务体验
							</div>
							<div class="">
								为您呈现不一样的服务
							</div>
						</div>
						<div class="clear">

						</div>
					</div>
					<div class="phont1 fl" style="border: none;">
						<div class="img5 fl">
							<img src="img/109.png" />
						</div>
						<div class="txt fl words">
							<div class="word1">
								帮助中心
							</div>
							<div class="">
								您的购物指南
							</div>
						</div>
						<div class="clear">

						</div>
					</div>
					<div class="clear">

					</div>
				</div>
			</div>

			<div class="eight">
				<div class="container">
					<div class="txt1 fl words">
						<div class="word2">
							&nbsp;购物指南
						</div>
						<div class="">
							免费注册
						</div>
						<div class="">
							开通支付宝
						</div>
						<div class="">
							支付宝充值
						</div>
					</div>
					<div class="txt1 fl words">
						<div class="word2">
							&nbsp;品质保障
						</div>
						<div class="">
							发票保证
						</div>
						<div class="">
							售后服务
						</div>
						<div class="">
							缺货赔付
						</div>
					</div>
					<div class="txt1 fl words">
						<div class="word2">
							&nbsp;支付方式
						</div>
						<div class="">
							快捷支付
						</div>
						<div class="">
							信用卡
						</div>
						<div class="">
							货到贷款
						</div>
					</div>
					<div class="txt1 fl words">
						<div class="word2">
							&nbsp;商家服务
						</div>
						<div class="">
							商家入驻
						</div>
						<div class="">
							商家中心
						</div>
						<div class="">
							物流服务
						</div>
					</div>
					<div class="txt1 fl words">
						<div class="word2">
							&nbsp;手机靓宝
						</div>
						<div>
							<img src="img/saoma1.png" style="height: 60px;" />
						</div>

					</div>
					<div class="clear">

					</div>
				</div>
			</div>
			<div class="nine">
				<div class="txt3">
					关于靓淘 &nbsp; 帮助中心&nbsp; 开房平台&nbsp; 诚聘精英&nbsp; 联系我们&nbsp; 网站合作&nbsp; 法律声明及隐私政策&nbsp; 知识产权&nbsp; 廉政举报&nbsp; 规则意见征集&nbsp;

				</div>
			</div>
			<div class="last">
				<div class="txt3">
					保留一切权利。&nbsp;客服热线：400-123-8888<br /> 京公网安备 110101020012006|京ICP证111033|食品流通许可证&nbsp;SP13123123111(1-1)|营业执照
				</div>
			</div>
		</div>
	</body>
	<!--<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>-->
	<script type="text/javascript">
		$(document).ready(function() {
		
			$("#conuntbtn").click(function() {
				y = $(".counttext").val();
				y++;
				$(".counttext").val(y);
			});

			$("#conuntbtn1").click(function() {
				
					y = $(".counttext").val();
					if(y>1){
					y--;
					$(".counttext").val(y);
					}
			});
			
			
		});
	</script>

</html>