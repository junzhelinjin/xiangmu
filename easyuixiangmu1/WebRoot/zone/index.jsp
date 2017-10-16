<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>配送员表单</title>

<link href="../pages/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
<link rel="stylesheet" href="../pages/css/providers1.css">
</head>
<body>
	<div class="container">
		<table id="dg" style="width:100%;height:470px" title="区域划分"
			data-options="
                rownumbers:true,
                remoteSort:true,
                singleSelect:true,
                autoRowHeight:false,
                pagination:true,
                fitColumns:true,
                striped:true,
                checkOnSelect:false,
                selectOnCheck:false,
                collapsible:true,
                toolbar:'#tb',
                pageSize:10">
			<thead>
				
			</thead>
		</table>
		<div id="tb" style="padding:0 30px;">
			<div class="conditions">
				<a style="margin-left: 2%" href="javascript:openAdd();"
					class="easyui-linkbutton" data-options="selected:true">新增</a> <span
					class="con-span" style="margin-left: 50%">配送区域: </span><input
					class="easyui-textbox" id="txt" type="text" name="name"
					style="width:166px;height:35px;line-height:35px;"></input> <a
					href="javascript:seach();" class="easyui-linkbutton"
					iconCls="icon-search" data-options="selected:true">查询</a> <a
					href="#" class="easyui-linkbutton" iconCls="icon-reload">重置</a>

			</div>

		</div>
	</div>

	<script type="text/javascript" src="../custom/jquery.min.js"></script>
	<script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../custom/easyui-lang-zh_CN.js"></script>

	<script type="text/javascript">
		function reload() {
			$('#dg').datagrid('reload');
		}
		function del(id) {
			$.messager.confirm('信息提示', '是否删除！', function(r) {
				if (r) {
					$.getJSON("../zone/del", {
						id : id
					}, function() {
						reload();
					});
				}
			});
		}

		$('#dg')
				.datagrid(
						{
							url : '../zone/index',
							columns : [ [
									{
										field : 'name',
										title : '配送区域',
										width : 50,
										sortable : true
									},
									{
										field : 'parentname',
										title : '上级区域',
										width : 100
									},
									{
										field : 'cname',
										title : '负责人',
										width : 50,
										sortable : true
									},
									{
										field : 'opt',
										title : '操作',
										width : 30,
										align : 'center',
										formatter : function(value, rec) {
											var btn = "<a class='' href='javascript:void(0)' onclick='del("
													+ rec.id + ")'>删除</a>";
											return btn;
										}
									} ] ]
						});

		function edit() {
			$('#wu-form-3').form('submit', {
				url : '../zone/update',
				success : function(data) {
					if (data) {
						$.messager.alert('信息提示', '提交成功！');
						$('#wu-dialog-3').dialog('close');
						reload();
					} else {
						$.messager.alert('信息提示', '提交失败！');
						reload();
					}
				}
			});
		}
		function add() {
			$('#wu-form-2').form('submit', {
				url : '../zone/insert',
				success : function(data) {
					if (data) {
						$.messager.alert('信息提示', '保存成功！');
						$('#wu-dialog-2').dialog('close');
						reload();
					} else {
						$.messager.alert('信息提示', '保存失败！');
						reload();
					}
				}
			});
		}

		function openAdd() {
			$('#wu-form-2').form('clear');
			$('#wu-dialog-2').dialog({
				closed : false,
				modal : true,
				title : "添加信息",
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : add
				}, {
					text : '取消',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#wu-dialog-2').dialog('close');
					}
				} ]
			});
		}

		function openEdit(field) {
			$('#wu-form-3').form('clear');
			$('#wu-form-3').form('load', field);
			$('#wu-dialog-3').dialog({
				closed : false,
				modal : true,
				title : "修改信息",
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : edit
				}, {
					text : '取消',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#wu-dialog-3').dialog('close');
					}
				} ]
			});
		}

		$('#dg').datagrid({
			onDblClickRow : function(index, field) {
				openEdit(field);
			}
		});

		function seach() {
			$('#dg').datagrid('load', {
				txt : txt.value
			});
		}
	</script>

	<div id="wu-dialog-2" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width:3 00px; padding:10px;">
		<form id="wu-form-2" method="post">
			<table style="border-collapse:separate; border-spacing:10px;">
				
				<tr>
					<td align="right">配送区域:</td>
					<td><input type="text" name="name" class="wu-text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right">上一级区域:</td>
					<td><input class="easyui-combobox wu-text" name="parentid"
						editable="false" required="required"
						data-options="valueField:'id',textField:'name',url:'../zone/zonelist'"></td>
				</tr>
				<tr>
					<td align="right">负责人:</td>
					<td><input class="easyui-combobox wu-text" name="courier_id"
						editable="false" required="required"
						data-options="valueField:'id',textField:'name',url:'../zone/courierlist'"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div id="wu-dialog-3" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width:300px; padding:10px;" >
		<form id="wu-form-3" method="post">
			<table style="border-collapse:separate; border-spacing:10px;">
				<tr>
					<input type="hidden" name="id" />
					<td align="right">配送区域:</td>
					<td><input type="text" name="name" class="wu-text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right">上一级区域:</td>
					<td><input class="easyui-combobox wu-text" name="parentid"
						editable="false" required="required"
						data-options="valueField:'id',textField:'name',url:'../zone/zonelist'"></td>
				</tr>
				<tr>
					<td align="right">负责人:</td>
					<td><input class="easyui-combobox wu-text" name="courier_id"
						editable="false" required="required"
						data-options="valueField:'id',textField:'name',url:'../zone/courierlist'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
