<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<base href="../">
<script type="text/javascript" src="model/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/basic.js"></script>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.css" />
<link rel="stylesheet" href="assets/css/colorpicker.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

<script src="assets/js/ace-extra.min.js"></script>

<script>
	function save() {
		sendForm($(".f1"));
	}
</script>
</head>

<body>
	<div class="modal-body no-padding">
		<div class="page-content">
			<div class="row">
				
					<c:if test="${requestScope.info!=null}">
						<form action="client/update1" method="post" class="f1">
							<div class="form-group">
								<input type="hidden" name="id" value="${requestScope.info.id}">
							</div>
							<div class="form-group" >
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 40px">昵称</label>
								<input	type="text" name="nickname" class="must" style="margin-left: 60px"
									value="${requestScope.info.nickname}" />
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1" style="margin-left: 40px">邮箱</label>

							 <input
									type="text" name="email" class="must" style="margin-left: 60px"
									value="${requestScope.info.email}" />
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 40px">选择问题</label>
								<select	name="question" style="margin-left: 30px">
									<c:forEach var="row" items="${requestScope.questionlist}"
										varStatus="v">
										<c:if test="${requestScope.info.question==v.index}">
											<option selected="selected" value="${v.index}">${row}</option>
										</c:if>
										<c:if test="${requestScope.info.question!=v.index}">
											<option value="${v.index}">${row}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 40px">问题答案</label>
								<input type="text" name="questionresult" class="must" style="margin-left: 30px"
									value="${requestScope.info.questionresult}"/>

							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 40px">状态</label>
								<select	name="status"  style="margin-left: 60px">
									<c:forEach var="row" items="${requestScope.statuslist}"
										varStatus="v">
										<c:if test="${requestScope.info.status==v.index}">
											<option selected="selected" value="${v.index}">${row}</option>
										</c:if>
										<c:if test="${requestScope.info.status!=v.index}">
											<option value="${v.index}">${row}</option>
										</c:if>
									</c:forEach>
								</select>

							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 40px">备注</label>
								<input style="margin-left: 60px" type="text" name="comments" class="must"	value="${requestScope.info.comments}" />

							</div>
					</c:if>
					<c:if test="${requestScope.info==null}">
						<form action="client/insert1" method="post" class="f1">
						<input type="hidden" name="lastdate">
							<br>
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px">帐号</label>
							<input style="margin-left: 20px"
								type="text" name="tel" class="must" /> <label style="margin-left: 20px"
								class="col-sm-3 control-label no-padding-right">密码</label>
							 <input style="margin-left: 20px"
								type="password" name="pass" class="must" /> <br>
							<br> 
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px">昵称</label>
							 <input style="margin-left: 20px" type="text" name="nickname" class="must" /> 
							 
							 <label class="col-sm-3 control-label no-padding-right"
								for="form-field-1" style="margin-left: 20px">邮箱</label>
							 <input style="margin-left: 20px" type="email" name="email" class="must" />
							<br>
							<input type="hidden" name="createdate">
							<input type="hidden" name="lastdate">
							<br> 
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px">选择密保问题</label>
							 <select style="margin-left: 20px"
								name="question">
								<option value="0">您母亲的名字？</option>
								<option value="1">您父亲的名字？</option>
								<option value="2">您的名字？</option>
							</select>
							<br><br>
							 <label class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-left: 20px">回答的答案：</label>
							 <input style="margin-left: 20px" type="text" name="questionresult" class="must"/>
					
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px">状态</label>
							 <select style="margin-left: 20px"
								name="powers">
								<option value="0">可用</option>
								<option value="1">禁用</option>
								<option value="2">锁定</option>
							</select>
						 <br>
							<input type="hidden" name="logindate">
							<br> <label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px;">备注</label>
							<input style="margin-left: 20px"
								type="text" class="must" name="comments" /> <br>
					</c:if>
					
						<div style="margin-top: 30px;margin-left: 80px">
							<button type="reset" style="margin-left: 10%">
								<i class="icon-undo bigger-110"></i> 重置
							</button>
							<button type="button" onclick="javascript:save();" style="margin-left: 20%">
								 保存
							</button>
						</div>
				
					</form>

				
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->

	</div>
</body>
</html>
