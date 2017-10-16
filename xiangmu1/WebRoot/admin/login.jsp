<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<script type="text/javascript" src="model/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/basic.js"></script>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

<script type="text/javascript">
	var a = 0;

	function save() {
		var data = $(".f2").serializeArray();
		var action = $(".f2").attr("action");
		$.ajax({type:"POST",url:action,dataType:"json",data:data,success:function(json){
			if(json.status>0){
				var fun1=function(){
					location.href="login.jsp";};
				showConfirm("注册成功",fun1);
			}else{
				confirm("注册失败");
			}
		}});
		
	}
</script>
</head>

<body class="login-layout">
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="icon-leaf green"></i>

							</h1>

						</div>

						<div class="space-30"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="icon-coffee green"></i> 操作员登录
										</h4>

										<div class="space-6"></div>
										<form action="operator/login" method="post">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="account" class="form-control"
														placeholder="Username" value="admin"/> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="pass" class="form-control"
														placeholder="Password" value="123"/> <i class="icon-lock"></i>
												</span>
												</label>
												 <label class="block clearfix input-icon-right"> 
												 
												 <span class="block input-icon input-icon-right"">
													 <input	name="code" placeholder="验证码" class="form-control" style="width: 100px;display: inline-block;" autocomplete="off"/> 
													 <img src="../img/code.jpg" onclick="this.src='../img/code.jpg?a='+(a++)" style="margin-left: 40px">
												</span>
												</label>

												<div class="space"></div>

												<div class="clearfix">
													<label class="inline"> <input type="checkbox"
														class="ace" /> <span class="lbl">记住密码</span>
													</label>

													<button type="submit"
														class="width-35 pull-right btn btn-sm btn-primary">
														<i class="icon-key"></i> 登录
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>
									</div>
									<!-- /widget-main -->

									<div class="toolbar clearfix">
										<div>
											<a href="#" onclick="show_box('forgot-box'); return false;"
												class="forgot-password-link"> <i class="icon-arrow-left"></i>
												忘记密码
											</a>
										</div>

										<div>
											<a href="#" onclick="show_box('signup-box'); return false;"
												class="user-signup-link"> 注册 <i class="icon-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="icon-key"></i> 重置密码
										</h4>

										<div class="space-6"></div>
										<p>输入您注册时候的email，用以接收密码重置信息</p>

										<form>
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="email" class="form-control" placeholder="Email" />
														<i class="icon-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button"
														class="width-35 pull-right btn btn-sm btn-danger" onclick="location.href='login.jsp'">
														<i class="icon-lightbulb"></i> 确定
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /widget-main -->

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;"
											class="back-to-login-link"> 返回 <i
											class="icon-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="icon-group blue"></i> 注册
										</h4>

										<div class="space-6"></div>
										<p>请输入相关信息</p>

										<form action="operator/register" method="post" class="f2">
											<fieldset>
												<label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="text" name="account" class="form-control"
														placeholder="account" /> <i class="icon-user"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="pass1" class="form-control"
														placeholder="Password" /> <i class="icon-lock"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="password" name="pass2" class="form-control"
														placeholder="Repeat Password" /> <i class="icon-retweet"></i>
												</span>
												</label> <label class="block clearfix"> <span
													class="block input-icon input-icon-right"> <input
														type="name" name="name" class="form-control"
														placeholder="Name" /> <i class="icon-user"></i>
												</span>
												</label> <input type="hidden" value="123" id="mesg" /> <label
													class="block"> <input type="checkbox" class="ace" />
													<span class="lbl"> 我接受 <a href="#">使用相关协议</a>
												</span>
												</label>

												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-30 pull-left btn btn-sm">
														<i class="icon-refresh"></i> 重置
													</button>

													<button type="button" onclick="javascript:save();" class="width-65 pull-right btn btn-sm btn-success">
														<a>注册</a> <i class="icon-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" onclick="show_box('login-box'); return false;"
											class="back-to-login-link"> <i class="icon-arrow-left"></i>
											返回
										</a>
									</div>
								</div>
								<!-- /widget-body -->
							</div>
							<!-- /signup-box -->
						</div>
						<!-- /position-relative -->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
	</div>
	<!-- /.main-container -->


	<script type="text/javascript">
		function show_box(id) {
			jQuery('.widget-box.visible').removeClass('visible');
			jQuery('#' + id).addClass('visible');
		}
	</script>
</body>
</html>
