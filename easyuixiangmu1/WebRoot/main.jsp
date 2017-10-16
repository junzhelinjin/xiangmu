<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>信息管理系统</title> 
<link href="pages/css/base.css" rel="stylesheet">
<link href="pages/css/platform.css" rel="stylesheet">
<link rel="stylesheet" href="custom/uimaker/easyui.css">
</head> 
<body>


    <div class="container">
    <!-- logo -->
        <div id="pf-hd">
            <div class="pf-logo">
                <img src="pages/images/main/main_logo.png" alt="logo">
            </div>
            
            
            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="pages/images/main/user.png" alt="">
                </div>
                <h4 class="pf-user-name ellipsis">${sessionScope.user.name}</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe60d;</i>
                                <span class="pf-opt-name">用户信息</span>
                            </a>
                        </li>
                        <li class="pf-modify-pwd">
                            <a onclick="">
                                <i class="iconfont">&#xe634;</i>
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li class="pf-logout">
                            <a href="login/outlogin">
                                <i class="iconfont">&#xe60e;</i>
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
<!-- left -->
        <div id="pf-bd">
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <span class="iconfont">&#xe64a;</span>
                    <span class="pf-name">组织管理</span>
                    <span class="toggle-icon"></span>
                </h2>
	
                <ul class="sider-nav">
               		 <li  class="current">
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe625;</span>
                            <span class="sider-nav-title">业务处理表</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <li><a href="javascript:;" data-link="order/enter.jsp">入库</a></li>
                            <li><a href="javascript:;" data-link="info/sortout.jsp">分拣</a></li>
                            <li><a href="javascript:;" data-link="info/sortout1.jsp">出库</a></li>
                            <li><a href="javascript:;" data-link="info/sortout2.jsp">退回</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                              <span class="iconfont sider-nav-icon">&#xe647;</span>
                            <span class="sider-nav-title">详细数据表</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s" >
                           <li><a href="javascript:;" data-link="operator/index.jsp">操作员</a></li>
                		   <li><a href="javascript:;" data-link="courier/index.jsp">配送员</a></li>
                		    <li><a href="javascript:;" data-link="info/index.jsp">快递信息表</a></li>
                           <li><a href="javascript:;" data-link="order/index.jsp">出入库数据表</a></li>
                           <li><a href="javascript:;" data-link="orderdetails/index.jsp">明细单数据表</a></li>
                            <li><a href="javascript:;" data-link="express/index.jsp">快递公司</a></li>
                            <li><a href="javascript:;" data-link="zone/index.jsp">区域划分</a></li>
                        </ul>
                     </li>
                 </ul> 
            </div>

             <div id="pf-page">
                <div id="wu-tabs"  class="easyui-tabs" data-options="border:false,fit:true">
                </div>
            </div>
        </div>
        </div>

    <script type="text/javascript" src="custom/jquery.min.js"></script>
    <script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="custom/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="pages/js/main.js"></script>
 
    <script type="text/javascript">
    
    $(function(){
		$('.sider-nav-s a').bind("click",function(){
			var title = $(this).text();
			var url = $(this).attr('data-link');
			addTab(title,url);
		});	
	});
	
	
	$('#wu-tabs').tabs({
		tools:[{
			border:false,
			handler:function(){
				$('#wu-datagrid').datagrid('reload');
			}
		}]
	});
		
	/**
	* Name 添加菜单选项
	* Param title 名称
	* Param href 链接
	* Param iconCls 图标样式
	* Param iframe 链接跳转方式（true为iframe，false为href）
	*/	
	function addTab(title, href){
		var tabPanel = $('#wu-tabs');
		var content = '<iframe class="page-iframe" scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
		if(!tabPanel.tabs('exists',title)){
				tabPanel.tabs('add',{
					title:title,
					content:content,
					fit:true,
					closable:true
				});
		}
		else
		{
			$('#wu-datagrid').datagrid('reload');
			tabPanel.tabs('select',title);
			
		}
	}
	/**
	* Name 移除菜单选项
	*/
	function removeTab(){
		var tabPanel = $('#wu-tabs');
		var tab = tabPanel.tabs('getSelected');
		if (tab){
			var index = tabPanel.tabs('getTabIndex', tab);
			tabPanel.tabs('close', index);
		}
	}
	
	/* function editpass() {
		$('#wu-form-2').form('submit', {
			url : 'login/updatepass',
			success : function(data) {
				if (data) {
					$.messager.alert('信息提示', '提交成功！');
					$('#wu-dialog-3').dialog('close');
				} else {
					$.messager.alert('信息提示', '提交失败！');
				}
			}
		});
	} */
	
	function editpass() {
		var action=$("#wu-form-2").attr("action");
		var data=$("#wu-form-2").serializeArray();
		$.ajax({type:"POST",url:action,data:data,dataType:"json",success:function(json){
			if(json){
				$.messager.alert('信息提示', '修改成功！');
				$('#wu-dialog-2').dialog('close');
			}else{
				$.messager.alert('信息提示', '修改失败！');
			}
		}});
		/* $('#wu-form-2').form('submit', {
			url : 'login/updatepass',
			success : function(data) {
				if (data.status>0) {
					$.messager.alert('信息提示', '修改成功！');
					$('#wu-dialog-2').dialog('close');
				} else {
					$.messager.alert('信息提示', '修改失败！');
				}
			}
		}); */
	} 
	
	function openupdate() {
		$('#wu-form-2').form('clear');
		$('#wu-dialog-2').dialog({
			closed : false,
			modal : true,
			title : "修改密码",
			buttons : [ {
				text : '确定',
				iconCls : 'icon-ok',
				handler : editpass
			}, {
				text : '取消',
				iconCls : 'icon-cancel',
				handler : function() {
					$('#wu-dialog-2').dialog('close');
				}
			} ]
		});
	}
	
</script>
<div id="wu-dialog-2" class="easyui-dialog"
		data-options="closed:true,iconCls:'icon-save'"
		style="width:3 00px; padding:10px;">
		<form id="wu-form-2" method="post" action="login/updatepass">
		<input type="hidden" name="id" value="${sessionScope.user.id}">
			<table style="border-collapse:separate; border-spacing:10px;">
				<tr>
					<td width="60" align="right">原密码:</td>
					<td><input type="text" name="old" class="wu-text"
						required="required"/></td>
				</tr>
				<tr>
					<td align="right">新密码:</td>
					<td><input type="text" name="pass1" class="wu-text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right">二次密码:</td>
					<td><input type="text" name="pass2" class="wu-text"
						required="required" /></td>
				</tr>
			</table>
		</form>
	</div>
</body> 
</html>
