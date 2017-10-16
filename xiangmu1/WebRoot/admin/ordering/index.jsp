<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- basic styles -->
<base href="../">
<script type="text/javascript" src="model/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/basic.js"></script>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
<script src="assets/js/ace-extra.min.js"></script>

<script type="text/javascript">
	var fun=function(){
	   location.href="ordering/index";
	};
	function openNewWin(title, url) {
		showPage(title,url,480,290,fun,true);
	}
	function openNewWin1(title, url) {
		showPage(title,url,400,190,fun);
	}
</script>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed');
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="../index.jsp">主页</a></li>
			<li class="active">订单表</li>
		</ul>

	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">

				<div class="row">
					<div class="col-xs-12">
						<div class="space-4"></div>
						<div style="float: right;">
							<form action="ordering/index" method="post">
								<input type="hidden" name="math" value="like"> <input
									type="hidden" name="table" value="ordering"> 
									<input type="hidden" name="col" value="status">
									 <select name="value" placeholder="根据状态查询" value="${requestScope.value}">
									 <option value="0">未发货</option>
									 <option value="1">已发货</option>
									 <option value=""></option>
									 </select> 
									 &nbsp; 
									 <input type="submit" value="查询">
							</form>
							<div class="space-4"></div>
						</div>

						<div class="table-responsive">
							<table id="sample-table-2"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center"><label> <input type="checkbox"
												class="ace" /> <span class="lbl"></span>
										</label></th>
										<th>创建日期</th>
										<th>购买人</th>
										<th>产品</th>
										<th>数量</th>
										<th>总价</th>
										<th>折扣</th>
										<th>状态</th>
										<th>操作员</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="r" items="${requestScope.list }">
										<tr>
											<td class="center"><label> <input
													type="checkbox" class="ace" /> <span class="lbl"></span>
											</label></td>
											<td>${r.date}</td>
											<td>${r.cname}</td>
											<td>${r.pname}</td>
											<td>${r.count}</td>
											<td>${r.amount}</td>
											<td>${r.disc}</td>
											<td>${r.ostatusname}</td>
											<td>${r.oname}</td>
											<td>
												<div
													class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
													<a class="blue"
														href="javascript:openNewWin('新增','ordering/add');"> <i
														class="icon-zoom-in bigger-130"></i>
													</a> <a class="green"
														href="javascript:openNewWin1('修改','ordering/edit?id=${r.id}');">
														<i class="icon-pencil bigger-130"></i>
													</a> 
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="dataTables_info" id="sample-table-2_info">
									总页数 ${requestScope.where.pagecount} > 总行数  ${requestScope.where.rowcount} > 当前页 ${requestScope.where.pageno}
									</div>
							</div>
							<div class="col-sm-6">
								<div class="dataTables_paginate paging_bootstrap">
									<a href="ordering/index?pageno=${requestScope.where.prepage}">上一页</a>&nbsp;&nbsp;&nbsp;<a href="ordering/index?pageno=${requestScope.where.nextpage}">下一页</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>


	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>
	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<script src="model/window.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		jQuery(function($) {

			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

			$('[data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table');
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
		});
		
	</script>

</body>

</html>
