<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>靓包注册页</title>
		<script src="js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="admin/js/layer/layer.js"></script>
		<script type="text/javascript" src="js/basic.js"></script>
		<link rel="stylesheet" type="text/css" href="css/reset .css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript">
		
		function save() {
			var data = $(".f2").serializeArray();
			var action = $(".f2").attr("action");
			$.ajax({type:"POST",url:action,dataType:"json",data:data,success:function(json){
				if(json.status>0){
					var fun1=function(){
						location.href="login.jsp";};
					showConfirm("注册成功",fun1);
				}else{
					var fun1=function(){
						location.href="register.jsp";};
					showConfirm("注册失败",fun1);
					
				}
			}});
		}
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
			<div class="regis_first">
				<div class="container">
					<div class="regis fr">
						<div class="login_top">
							<ul class="fl">
								<li>用户注册</li>
							</ul>
							<div class="fl" style="margin: 16px 0 0 15px;font-size: 12px">
							<span>已有帐号</span>
							<a href="login.jsp" style="margin-left: 4px;">在此登陆</a>
							</div>
							<div class="clear"></div>
						</div>
						<hr />
						<div class="regis_form">
							<form action="userlogin/register" method="post" class="f2">
								
								<div class="regis_input">
									<img src="img/zhanghu2.png">
									<input type="text" name="tel" placeholder="帐号"/>
								</div>
								<div class="regis_input">
									<img src="img/password.png">
									<input type="password" name="pass" placeholder="新密码"/>
								</div>
								<div class="regis_input">
									<img src="img/password.png">
									<input type="password" name="pass" placeholder="重复密码"/>
								</div>
								<div class="regis_input">
									<img src="img/weibo.png">
									<input type="email" name="email" placeholder="邮箱"/>
								</div>
								<div class="login_button">
									<button type="button" onclick="javascript:save();">注册</button>
								</div>
							</form>
						</div>
						<div class="login_bom">
							<ul class="fl">
								<li><a href="#">《靓淘优选用户协议》</a></li>
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
