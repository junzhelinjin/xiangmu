<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>信息管理系统</title> 
    <link href="pages/css/base.css" rel="stylesheet">
    <link href="pages/css/login/login.css" rel="stylesheet">
     <script type="text/javascript" src="custom/jquery.min.js"></script>
     <script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="pages/js/main.js"></script>
	<script type="text/javascript">
		var a=0;
		function openmain() {
			var form=$(".f1");
			var data=form.serializeArray();
			var action = form.attr("action");
			$.ajax({type:"POST",url:action,data:data,dataType:"json",success:function(json){
				if(json.status>0){
					location.href="main.jsp";
				}else{
					location.href="login.html";
				}
			}});
		}
</script>
</head> 
<body>
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<span class="split"></span>
			<span class="sys-name">物流管理</span>
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
						<div class="lg-label"><h4>用户登录</h4></div>
						
						<form class="f1" action="login/loginweb" method="post">
							<div class="lg-username input-item clearfix">
								<i class="iconfont">&#xe60d;</i>
								<input type="text" name="tel" placeholder="账号/邮箱/手机号" class="must" value="admin">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe634;</i>
								<input type="password" name="pass" placeholder="请输入密码" class="must" value="123">
							</div>
							<div class="lg-check clearfix">
								<div class="input-item">
									<i class="iconfont">&#xe633;</i>
									<input type="text" placeholder="验证码" name="code" autocomplete="off" class="must">
								</div>
								<img class="check-code" src="img/code.jpg" onclick="this.src='img/code.jpg?a='+(a++)">
							</div>
							<div class="tips clearfix">
								<label><input type="checkbox" checked="checked">记住用户名</label>
								<a href="javascript:;" class="register">立即注册</a>
								<a href="javascript:;" class="forget-pwd">忘记密码？</a>
							</div>
							<div class="enter">

								<a href="javascript:;" class="purchaser" onClick="javascript:window.location='main.html'">重置</a>
								
								<a href="javascript:;" class="supplier" onClick="openmain();" type="submit">登录</a>
							</div>
						</form>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
		</div>
	</div>
	<div class="login-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">地址：江苏省南京市雨花台区软件园&nbsp;邮编：210019&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015&nbsp;-&nbsp;2016&nbsp;uimaker-专注于ui设计&nbsp;版权所有</div>
			<div class="other-info">建议使用IE8及以上版本浏览器&nbsp;苏ICP备&nbsp;09003078号&nbsp;E-mail：admin@uimaker.com</div>
		</div>
	</div>
</body> 
</html>
    
