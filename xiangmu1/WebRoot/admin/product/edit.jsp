<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="../">
<script type="text/javascript" src="model/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/basic.js"></script>

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="model/picshow.js"></script>
<script type="text/javascript">
	function save() {
		sendForm($(".f1"));
	}

	function changer(o) {
		$.getJSON("product/gettypes", {
			id : o.value
		}, function(json) {
			$("[name=producttype_id]").empty();
			for (var i = 0; i < json.length; i++) {
				$("[name=producttype_id]").append(
						$("<option value='"+json[i].id+"'>" + json[i].name
								+ "</option>"));
			}
		});

	}
</script>
</head>

<body>
	<div class="modal-body no-padding">
		<div class="page-content">
			<div class="row">
				<div class="tabbable">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#products">
								商品信息 </a></li>
						<li><a data-toggle="tab" href="#productone">商品图片上传</a></li>
					</ul>

				<div class="tab-content">
					<div id="products" class="tab-pane in active">
						<c:if test="${requestScope.info!=null}">
							<form action="product/update1" method="post" class="f1">
								<div class="form-group">
									<input type="hidden" name="id" value="${requestScope.info.id}">
								</div>
								<label style="margin-left: 50%">${requestScope.info.name}</label>
								<br> <br>
								<label class="col-sm-3 control-label no-padding-right" style="margin-left: 10px">类型</label> 
									<select name="pid"	onchange="changer(this);" style="margin-left:15px">
										<option value="0">无上级</option>
										<c:forEach items="${requestScope.types}" var="r">
											<c:if test="${requestScope.info.tid==r.id}">
												<option selected="selected" value="${r.id}">${r.name}</option>
											</c:if>
											<c:if test="${requestScope.info.tid!=r.id}">
												<option value="${r.id}">${r.name}</option>
											</c:if>
										</c:forEach>
									</select> 
									<select name="producttype_id" style="margin-left: 5px">
										<option value="0">无上级</option>
											<c:forEach items="${requestScope.types1}" var="r">
											<c:if test="${requestScope.info.producttype_id==r.id}">
												<option selected="selected" value="${r.id}">${r.name}</option>
											</c:if>
											<c:if test="${requestScope.info.producttype_id!=r.id}">
												<option value="${r.id}">${r.name}</option>
											</c:if>
											</c:forEach>
									</select>
									<label style="margin-left: 20px" class="col-sm-3 control-label no-padding-right">价格</label>
									<input style="margin-left: 20px" type="text" name="price" class="must" value="${requestScope.info.price}" /> <br>
									<br> 
									<label class="col-sm-3 control-label no-padding-right" style="margin-left: 10px">折扣</label> 
									<input style="margin-left: 20px" type="text" name="disc" class="must" value="${requestScope.info.disc}" /> 
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-left: 20px">图片</label>
									<input style="margin-left: 20px" type="text" name="pics" class="must" value="${requestScope.info.pics}" /> <br> <br> 
									<label	class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-left: 10px">商品简介</label>
									<input style="margin-left: 10px" type="text" name="info" class="must" value="${requestScope.info.info}" />
							</c:if>
							<c:if test="${requestScope.info==null}">
								<form action="product/insert1" method="post" class="f1">
									
									<label	class="col-sm-3 control-label no-padding-right"	style="margin-left: 10px">商品名称</label>
									<input	style="margin-left: 20px" type="text" name="name" class="must" />
									<label class="col-sm-3 control-label no-padding-right"	style="margin-left: 10px">类型</label> 
									<select name="pid" onchange="changer(this);" style="margin-left: 5px">
										<option value="0">无上级</option>
										<c:forEach items="${requestScope.types}" var="r">
											<c:if test="${requestScope.info.tid==r.id}">
												<option selected="selected" value="${r.id}">${r.name}</option>
											</c:if>
											<c:if test="${requestScope.info.tid!=r.id}">
												<option value="${r.id}">${r.name}</option>
											</c:if>
										</c:forEach>
									</select> 
									<select name="producttype_id" style="margin-left: 5px">
										<option value="0">无上级</option>
										<c:forEach items="${requestScope.types1}" var="r">
											<c:if test="${requestScope.info.producttype_id==r.id}">
												<option selected="selected" value="${r.id}">${r.name}</option>
											</c:if>
											<c:if test="${requestScope.info.producttype_id!=r.id}">
												<option value="${r.id}">${r.name}</option>
											</c:if>
										</c:forEach>
									</select> <br> <br> 
									<label style="margin-left: 20px" class="col-sm-3 control-label no-padding-right">价格</label> 
									<input	style="margin-left: 37px" type="text" name="price" class="must" /> 
									<label	class="col-sm-3 control-label no-padding-right"	style="margin-left: 10px">折扣</label> 
									<input	style="margin-left: 8px" type="text" name="disc" class="must" />
									<br> <br> 
									<label	class="col-sm-3 control-label no-padding-right"	for="form-field-1" style="margin-left: 10px">累计消费</label>
									<input	style="margin-left: 17px" type="text" name="salcount" class="must" /> 
									<label	class="col-sm-3 control-label no-padding-right" for="form-field-1" style="margin-left: 10px">创建人</label>
									<select name="operator_id">
									<c:forEach var="r" items="${requestScope.operatorlist}">
										
										<option value="${r.id}">${r.name}</option>
									</c:forEach>
									</select>
									<input type="hidden" name="pics">
									 <br><br>
									 <div>
									 	<script id="container" name="info" type="text/plain">
        									初始化内容
  									  	</script>
  									  </div>
									
							</c:if>
							<div style="margin-top: 30px;margin-left: 80px">
								<button type="reset" style="margin-left: 40px">	<i class="icon-undo bigger-110"></i> 重置
								</button>
								<button type="button" onclick="javascript:save();"	style="margin-left: 50px">保存</button>
							</div>
						</div>

						<div id="productone" class="tab-pane">
							<div class="picshow" selector="[name=file]"
								idsserlector="[name=pics]" 
								style="background-color: #eee;width: 400px;height: 100px;margin: 10px 30px;">
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
	<script type="text/javascript">
		var ue = UE.getEditor('container');
	</script>
</body>
</html>
