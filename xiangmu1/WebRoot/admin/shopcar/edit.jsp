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
						<form action="shopcar/update1" method="post" class="f1">
							<div class="form-group">
								<input type="hidden" name="id" value="${requestScope.info.id}">
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 30px">商品</label>
							<%@include file="../modellist/clientlist.jsp"%>
							<br><br>
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 30px">数量</label>
							<input style="margin-left: 20px" type="text" name="count" class="must" value="${requestScope.info.count}"/> 

							</div>
					</c:if>
					<c:if test="${requestScope.info==null}">
						<form action="shopcar/insert1" method="post" class="f1">							<br>
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 30px">购买人</label>
							<%@include file="../modellist/clientlist.jsp"%>
								<label style="margin-left: 30px" class="col-sm-3 control-label no-padding-right">产品</label>
							 <%@include file="../modellist/productlist.jsp"%>
							<br> <br>
							<label class="col-sm-3 control-label no-padding-right" style="margin-left: 30px">数量</label>
							 <input style="margin-left: 35px" type="text" name="count" class="must" /> 
					
						
					</c:if>
					
						<div style="margin-top: 30px;margin-left: 80px">
							<button type="reset" style="margin-left: 20px">
								<i class="icon-undo bigger-110"></i> 重置
							</button>
							<button type="button" onclick="javascript:save();" style="margin-left: 40px">
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
