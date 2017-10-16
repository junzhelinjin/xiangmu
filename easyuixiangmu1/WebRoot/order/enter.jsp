<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>入库</title>

<link href="../pages/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="../custom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
<link rel="stylesheet" href="../pages/css/providers1.css">
</head>
<body>
	<div class="container">
		<table id="dg" style="width:100%;height:470px" title="出入库数据表"
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
					class="con-span" style="margin-left: 48%">配送员名字: </span>
					<input
					class="easyui-textbox" id="txt" type="text" name="name"
					style="width:166px;height:35px;line-height:35px;"></input>
					 <a	href="javascript:seach();" class="easyui-linkbutton"
					iconCls="icon-search" data-options="selected:true">查询</a> <a
					href="javascript:openSelect()" class="easyui-linkbutton" iconCls="icon-search">自定义查询</a>
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
		
		function adddetail() {
			$('#wu-form-2').form('submit', {
				url : '../order/insert',
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
		var countid,id;
		function odetail(count,id) {
			$('#wu-dialog-4').dialog({
				closed : false,
				modal : true,
				
			});
			$.getJSON("../order/remove");
			this.id=id;
			var cid=0;
			$("#foucs").textbox('textbox').focus();
			
			
			document.onkeydown=function(event){
				var e = event || window.event || arguments.callee.caller.arguments[0];          
			          if(e && e.keyCode==13){ // enter 键
			        	  if(cid<count){
			        	  cid++;
			        	  countid=cid;
			        	  var value="";
			        	  if($("#foucs").textbox('getValue').length>0){
			        		  value=$("#foucs").textbox('getValue');
			        	  }
				          var url1='../order/enter?value='+value;
				          
				               $('#dg1').datagrid(
				   					{
				   					url : url1,
				   					columns : [ [{
				   						field : 'code',
				   						title : '快递单号',
				   						width : 110,
				   					},{
				   						field : 'zone_id',
				   						title : '区域',
				   						width : 110,
				   					},{
				   						field : 'sizename',
				   						title : '快递类型',
				   						width : 110,
				   					},{
				   						field : 'typename',
				   						title : '中转类型',
				   						width : 110,
				   					},{
				   						field : 'comments',
				   						title : '备注',
				   						width : 110,
				   					}
				   				] ]
				   			});
				               $("#foucs").textbox('setValue');
				           }else{
					        	  alert("快递已录完！");
				           }
			        	  $("#foucs").textbox('textbox').focus();
			          }
				      };
				      
		}
		function ininfo() {
			var data={};
			$.ajax({type:"POST",url:"../info/enter?id="+id,data:data,dataType:"json",success:function(json){
				if(json.status>0){
					$.messager.alert('信息提示', '全部入库成功！');
					$('#wu-dialog-4').dialog('close');
					
				}
			}});
			
			
			
		}
		$('#dg')
				.datagrid(
						{
							url : '../order/index',
							columns : [ [
									{
										field : 'date',
										title : '操作时间',
										width : 100,
										sortable : true
									},
									{
										field : 'ename',
										title : '快递公司',
										width : 50
									},
									{
										field : 'enterdate',
										title : '入库日期',
										width : 100
									},
									{
										field : 'count',
										title : '数量',
										width : 50,
										sortable : true
									},
									{
										field : 'ostatusname',
										title : '状态',
										width : 50
									},
									{
										field : 'opt',
										title : '操作',
										width : 30,
										align : 'center',
										formatter : function(value, rec) {
											var btn = "<a class='' href='javascript:void(0)' onclick='odetail("
													+ rec.count+ ","+rec.id +")'>快递详情</a>";
													
											return btn;
										}
									} ] ]
						});

		function edit() {
			$('#wu-form-3').form('submit', {
				url : '../order/update',
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
				url : '../order/insert',
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
				title : "入库信息",
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
				title : "出库信息",
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
		
		function openSelect() {
			$('#wu-dialog-5').dialog({
				closed : false,
				modal : true,});
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

					<td width="60" align="right">快递公司:</td>
					<td><input class="easyui-combobox wu-text" name="express_id"
						editable="false" required="required"
						data-options="valueField:'id',textField:'name',url:'../order/expresslist'"></td>
				</tr>
				<tr>
					<td align="right">数量:</td>
					<td><input type="text" name="count" data-options="min:0,precision:0" class="easyui-numberbox wu-text"
						required="required" /></td>
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
					<td align="right">数量:</td>
					<td><input type="text" name="count" data-options="min:0,precision:0" class="easyui-numberbox wu-text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right">状态:</td>
					<td><input class="easyui-combobox wu-text" name="status"
						editable="false" required="required"
						data-options="valueField:0,textField:1,url:'../order/statuslist'"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="wu-dialog-4" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width:620px;padding:10px;" >
		<div id="tb1" style="padding:0 30px;">
			<div class="conditions">
					<input class="easyui-textbox" id="foucs" type="text" name="input_foucs" placeholder="9位数字"
					style="width:166px;height:35px;line-height:35px;" autofocus="autofocus" onkeydown="onkey();" >
					</input> <a href="javascript:ininfo();" class="easyui-linkbutton" iconCls="icon-reload">全部入库</a>
			</div>
		</div>
		<form id="wu-form-4" method="post" action="../order/insert1">
			<table id="dg1" style="width:100%;height:300px"
			data-options="
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
                striped:true,
                collapsible:true,
                toolbar:'#tb1',
                pageSize:10">
			<thead>
				
			</thead>
			</table>
			
		</form>
		
	</div>
	
	<div id="wu-dialog-5" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width:620px;   padding:10px;" >
		
	</div>
</body>
</html>
