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
						<form action="producttype/update1" method="post" class="f1">
							<div class="form-group" style="margin-top: 20px">
								<input type="hidden" name="id" value="${requestScope.info.id}">
							</div>
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px;">类型</label>
							<input style="margin-left: 30px" type="text" name="name" class="must" value="${requestScope.info.name}"/>  

					</c:if>
					<c:if test="${requestScope.info==null}">
						<form action="producttype/insert1" method="post" class="f1" style="margin-top: 20px">
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 20px">类型</label>
							<input style="margin-left: 30px" type="text" name="name" class="must" /> 
					</c:if>
					<select name="parentid" style="margin-left: 10px">
					<option value="0">无上级</option>
						<c:forEach var="r" items="${requestScope.types}">
							<c:if test="${requestScope.info.parentid==r.id}">
								<option selected="selected" value="${r.id}">${r.name}</option>
							</c:if>
							<c:if test="${requestScope.info.parentid!=r.id}">
								<option value="${r.id}">${r.name}</option>
							</c:if>
						</c:forEach>
					</select>
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
