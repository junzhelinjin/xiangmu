<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>靓包登录页</title>
		<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/reset .css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		
		<script type="text/javascript">
			var a = 0;
		</script>
	</head>
	<body>
		<div>
			<div class="container">
				<div class="top">
					<img src="img/LOGO.png" class="fl"/> 
					<div class="fl top_right">
						<ul style="margin-top: 15px;">
							<li><img src="img/7tianwuliyou.png" /> 7天无理由退换货</li>
							<li><img src="img/zheng.png" /> 100%保证正品</li>
							<li><img src="img/money.png" /> 退货返运费</li>
						</ul>
					</div>
					<div class="clear">
					
					</div>
				</div>
				
			</div>
			<div class="first">
				<div class="container">
					<div class="fl">
						<img src="img/beijing.png" style="height: 430px;"/>
					</div>
					<div class="login fr">
						<div class="login_top">
							<ul>
								<li>欢迎登录</li>
								<li>扫码登录</li>
							</ul>
						</div>
						<hr />
						<div class="login_form">
							<form action="login" method="post" class="f1">
								<div class="login_input">
									<img src="img/zhanghu2.png">
									<input type="text" name="tel" placeholder="手机号" class="must tel" value="111"/>
								</div>
								<div class="login_input">
									<img src="img/password.png">
									<input type="password" name="pass" placeholder="密码" class="must pass" value="123"/>
								</div>
								<div class="login_code">
									<input type="text" name="code" placeholder="验证码" autocomplete="off" class="must"/>
									 <img src="img/code.jpg" onclick="this.src='img/code.jpg?a='+(a++)" style="margin-left: 30px;height: 23px">
								</div>
								<div class="login_button">
									<button type="submit">登录</button>
								</div>
							</form>
						</div>
						<div class="login_bom">
							<div class="fl login_bom_left">
							<input type="checkbox" onclick="selector(this)" name=""/>&nbsp;记住用户名
							</div>
							<ul class="fl">
								<li><a href="#">忘记密码</a></li>
								<li><a href="register.jsp">免费注册</a></li>
							</ul>
							<div class="clear">
								
							</div>
						</div>
					</div>
					<div class="clear">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
