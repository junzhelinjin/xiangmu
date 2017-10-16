<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>日程表</title>
    <link href="css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="../custom/uimaker/icon.css">
</head>
<body>
<div class="container">

    <table id="tt" class="easyui-datagrid" style="width:100%;height:400px" title=""></table>

    <div id="tb" style="padding:0 30px;">
        <div class="conditions">
            <span class="con-span" style="margin-left: 20%">发送日期: </span>
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

            function details(id) {
                $('#dd').dialog({
                    closed: false,
                    modal:true,
                    href:"../Message/details?id="+id,
                    title: "详情",
                    width:480,
                    height:400,
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
                    {field:'date',title:'发送时间',width:80,sortable:true},
                    {field:'oname',title:'发送人',width:50,sortable:true},
                    {field:'typename',title:'消息类型',width:50,sortable:true},
                    {field:'info',title:'消息',width:80,sortable:true},
                    {field:'statusname',title:'消息状态',width:50,sortable:true},
                    {field:'readDate',title:'读取时间',width:80,sortable:true},
                    {field:'opt',title:'操作',width:50,align:'center',
                        formatter:function(value,rec){
                            var btn = "<a class=''  href='javascript:void(0)' onclick='details("+rec.id+")'>详情</a> ";
                            return btn;
                        }
                    }
                ];
                datagridInit("../Message/index",cols);
            });

            function seach(){
                $('#tt').datagrid('load',{
                    txt: txt.value,
                    txt1:txt1.value,
                    txt2:txt2.value
                });
            }
        </script>

    <div id="dd" ></div>
    <script type="text/javascript" src="js/my.js"></script>

</body>
</html>

