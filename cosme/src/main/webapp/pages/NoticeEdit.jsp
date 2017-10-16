<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="custom/uimaker/easyui.css">
    <link rel="stylesheet" type="text/css" href="custom/uimaker/icon.css">
    <script type="text/javascript" src="../custom/jquery.min.js"></script>
    <script type="text/javascript" src="../custom/jquery.easyui.min.js"></script>
</head>
<body>
<form id="wu-form-2" method="post">
    <div style="padding: 10px 15px 10px 15px">
        <table style="border-collapse:separate; border-spacing:10px;">
                <input type="hidden" name="id" value="0"/>

            <tr >
                <td align="right" class="wu-form-text">类型</td>
                <td ><input class="easyui-combobox" editable="false" name="type"   data-options="valueField:0,textField:1,url:'../Notice/typelist'"> </td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">公告</td>
                <td><textarea type="text" name="message" class="easyui-validatebox wu-text combobox inputlist multiple"  data-options="min:0,precision:0" required="true"></textarea></td>
            </tr>

            <tr >
                <td align="right" class="wu-form-text" ><label>接收人</label></td>
                <td><textarea type="text" onclick="selectname();" class=" wu-text combobox inputlist showname" required="required" >${requestScope.str}</textarea></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">结束时间</td>
                <td><input class="easyui-datetimebox" name="destdate"
                           data-options="required:true,showSeconds:false" style="width: 200px;"></td>
            </tr>

            <input type="hidden" name="destids" class="showid">
            <input type="hidden" name="noids" class="showid">
        </table>
    </div>

</form>
<div id="win"></div>
<style>
    tr{ height: 30px;}
    tr>td:nth-child(odd){
      color: #999;padding-right: 6px;padding-bottom: 5px
    }

    .inputlist{
        margin-bottom: 8px;
        width: 350px;
        height: 44px;
    }
    .multiple{
        height:48px;
    }
    .combobox{
        height:70px;
    }
</style>
<script>
   if(alldata!=null)  $('#dd form').form('load', alldata);

    function selectname() {
        $('#win').dialog({
            title: '接收人',
            width: 260,
            height: 250,
            closed: false,
            cache: false,
            href: '../Notice/noticetree',
            inline:true,
            buttons : [ {
                text : '确定',
                iconCls : 'icon-ok',
                handler : sendid
            }, {
                text : '取消',
                iconCls : 'icon-cancel',
                handler : function() {
                    $('#win').dialog('close');
                }
            } ]
        });
    }
    function sendid() {
        var nodes = $('#tt1').tree('getChecked');
        var id='';
        var text = "";
        for(var i=0; i<nodes.length; i++){
            if (text != '') text+=', ';
            text+=nodes[i].text;
        }
        text=text.replace("职务,","");
        text=text.replace("前台,","");
        text=text.replace("咨询师,","");
        $(".showname").text(text);
        for(var i=0; i<nodes.length; i++){
            if (id != '') id+=',';
            id+=nodes[i].id;
        }
        for(var i=0;i<nodes.length;i++){
            id=id.replace("0,","");
        }

        $(".showid").val(id);
        $('#win').dialog('close');
    }

</script>
</body>
</html>
