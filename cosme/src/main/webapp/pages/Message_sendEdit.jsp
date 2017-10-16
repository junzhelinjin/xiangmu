<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<form id="wu-form-2" method="post">
    <div style="padding: 10px 15px 10px 15px">
        <table style="border-collapse:separate; border-spacing:10px;">
            <input type="hidden" name="id" value="0"/>
            <tr >
                <td align="right" class="wu-form-text">消息类型</td>
                <td ><input class="easyui-combobox " editable="false" name="infotype" data-options="valueField:0,textField:1,url:'../Message_send/statuslist'"> </td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text" ><label>消息内容</label></td>
                <td><textarea  type="text" name="info" class="easyui-validatebox wu-text combobox inputlist" data-options="min:0,precision:0" required="true"></textarea></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">接收人</td>
                <td><input onclick="selectname();" type="text" name="operator_dest_names"  class="easyui-validatebox wu-text combobox inputlist showname"  required="true"></input></td>
            </tr>
            <tr >
                <td align="right" class="wu-form-text">链接地址</td>
                <td><input type="text" name="url_s" class="easyui-validatebox wu-text multiple"  required="true"></td>
            </tr>
            <input type="hidden" name="operator_dest_ids" class="showid">
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
        width: 220px;
        height:28px;
    }
    .combobox{
        height:80px;
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
           href: '../Message_send/noticetree',
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
       $(".showname").val(text);
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
