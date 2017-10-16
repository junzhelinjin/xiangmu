<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="../">
<script type="text/javascript" src="model/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/basic.js"></script>
<script type="text/javascript">
function save() {
	sendForm($(".f1"));
}
</script>
</head>
<body>
	<form action="client/updatepass" method="post" class="f1" target="_top">
		<input type="hidden" name="id" value="${requestScope.id}">
		<br>
		<label style="margin-left: 30px">旧密码</label>
		<input
			type="password" name="old" class="must" style="margin-left: 20px"/> <br> <br> 
			<label style="margin-left: 30px">新密码</label>
		
		 <input
			type="password" name="new1" class="must" style="margin-left: 20px"/> <br> <br>
			<label style="margin-left: 20px">2次密码</label>
		
		 <input
			type="password" name="new2" class="must" style="margin-left: 20px"/> <br> <br><br>
				
				<button class="btn" type="reset" style="margin-left: 50px">
					 重置
				</button>
				
				<button class="btn" type="button" onclick="javascript:save();" style="margin-left: 80px">
					保存
				</button>
			</div>
		</div>
	</form>
</body>
</html>