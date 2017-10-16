<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>通知表</title>
    <link href="css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
</head>
<body>
<div class="container">

    <table id="tt" class="easyui-datagrid" style="width:100%;height:400px" title=""></table>

    <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <a href="#" class="easyui-linkbutton" onclick="openAdd()" iconCls="icon-add">新增</a>
            <a href="#" iconCls="icon-edit" class="easyui-linkbutton" onclick="openEdit()" style="margin-left: 2%">修改</a>
            <span class="con-span" style="margin-left: 20%">创建日期: </span>
            <input class="easyui-datebox" id="txt2" type="text" name="name"
                    style="width:156px;height:35px;line-height:35px;"></input>
            <span class="con-span" style="margin-left: 1%">消息类型: </span>
            <select class="easyui-combobox" name="status" id="txt1" style="width:100px;height:35px;line-height:35px;">
                <option value="0">普通</option><option value="1">加急</option><option value="2" selected>全部</option></select>
            <span class="con-span" style="margin-left: 1%">消息状态: </span>
            <select class="easyui-combobox" name="status" id="txt" style="width:100px;height:35px;line-height:35px;">
                <option value="0">未读</option><option value="1">已读</option><option value="2" selected>全部</option></select>
            <a href="javascript:seach();" class="easyui-linkbutton"
                iconCls="icon-search">查询</a>
        </div>
    </div>

</div>

        <script type="text/javascript" src="../custom/jquery.min.js"></script>
        <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="../custom/easyui-lang-zh_CN.js"></script>

        <script type="text/javascript">
            function reload() {
                $('#tt').datagrid('reload');
            }

            function del(id) {
                $.messager.confirm('信息提示', '是否删除！', function(r) {
                    if (r) {
                        $.getJSON("../Notice/del", {
                            id : id
                        }, function() {
                            reload();
                        });
                    }
                });
            }
            function details(id) {
                $('#dd').dialog({
                    closed: false,
                    modal:true,
                    href:"../Notice/details?id="+id,
                    title: "详情",
                    width:480,
                    height:410,
                    buttons: [{
                        text: "确定",
                        iconCls: 'icon-ok',
                        handler: function () {
                            $('#dd').dialog('close');
                        }
                    }, {
                        text: "关闭",
                        iconCls: 'icon-cancel',
                        handler: function () {
                            $('#dd').dialog('close');
                        }
                    }]
                });
                if(data) alldata=data;
                else alldata=null;
            }

            $(function(){
                cols=[
                    {field:'createdate',title:'创建时间',width:100,sortable:true},
                    {field:'startdate',title:'显示时间',width:100,sortable:true},
                    {field:'message',title:'公告',width:80,sortable:true},
                    {field:'oname',title:'操作人',width:80,sortable:true},
                    {field:'statusname',title:'公告状态',width:70,sortable:true},
                    {field:'typename',title:'类型',width:50,sortable:true},
                    {field:'destdate',title:'结束时间',width:100,sortable:true},
                    {field:'opt',title:'操作',width:80,align:'center',
                        formatter:function(value,rec){
                            var btn = "<a class=''  href='javascript:void(0)' onclick='del("+rec.id+")'>删除</a> | <a class=''  href='javascript:void(0)' onclick='details("+rec.id+")'>详情</a> ";
                            return btn;
                        }
                    }
                ];
                datagridInit("../Notice/index",cols);
            });
            function openAdd(){
                openDialog("新增","NoticeEdit.jsp",480,400,add);
            }
            function openEdit(){
                if($('#tt').datagrid('getSelected')==null){
                    $.messager.alert('提示','请选择要修改的行！','error');
                }
                if($('#tt').datagrid('getSelected')!=null){
                    var id=($('#tt').datagrid('getSelected').id);
                    openDialog("修改","../Notice/foredit?id="+id,480,400,edit,$('#tt').datagrid('getSelected'));
                }

            }
            function seach(){
                $('#tt').datagrid('load',{
                    txt: txt.value,
                    txt1:txt1.value,
                    txt2:txt2.value
                });
            }
            function add(){
                $("[name=id]").val(0);
                $('#wu-form-2').form('submit', {
                    url:'../Notice/insert',
                    success:function(data){
                        if(data){
                            $('#dd').dialog('close');
                            reload();
                        }
                    }
                });
            }
            function edit(){
                $('#wu-form-2').form('submit', {
                    url:'../Notice/update',
                    success:function(data){
                        if(data){
                            $('#dd').dialog('close');
                            reload();
                        }
                    }
                });
            }
        </script>


    <div id="dd" ></div>

    <script type="text/javascript" src="js/my.js"></script>

</body>
</html>

