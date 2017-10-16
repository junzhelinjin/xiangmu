<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登陆信息</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="js/basic.js"></script>
		<script type="text/javascript" src="js/layer/layer.js"></script>
	<script type="text/javascript">
		function save() {
			var form=$(".f1");
			var m = form.children(".must");
			for ( var i = 0; i < m.length; i++) {
				if (m.get(i).value.length == 0) {
					showMsg("信息不全");
					return ;		
				}
			}
			var data = form.serializeArray();
			var action = form.attr("action");
			$.ajax({type:"POST",url:action,dataType:"json",data:data,success:function(json){
				if(json.status>0){
					closePage();
				}else{
					location.href="login1.jsp";
				}
			}});
		}
	</script>
  </head>
  
  <body>
    <form action="login1.html" method="post" class="f1">
   <b style="margin-left: 10px"> 帐号：</b><input type="text" name="tel" style="margin: 10px 20px;" class="must"><br>
    <b style="margin-left: 10px">密码：</b><input type="password" name="pass" style="margin: 10px 20px;" class="must"><br>
    
    </form>
    <div style="margin: 20px 0 0 70px">
    <input type="reset" value="重置">
    <button onclick="save();" style="margin-left: 20px">保存</button>
    </div>
  </body>
</html>
