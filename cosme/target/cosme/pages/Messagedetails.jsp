<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div style="padding: 10px 15px 10px 15px">
    <table style="border-collapse:separate; border-spacing:10px;">
        <tr >
            <td align="right" class="wu-form-text" ><label>发送给</label></td>
            <td><input type="text" class=" wu-text inputlist " value="${requestScope.name}" readonly="true"></input></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>消息</label></td>
            <td><textarea type="text" class=" wu-text combobox inputlist" readonly="true">${requestScope.info}</textarea></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>链接地址1</label></td>
            <td><input type="text"  class=" wu-text  inputlist" value="${requestScope.url}" readonly="true"></input></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>链接地址2</label></td>
            <td><input type="text"  class=" wu-text  inputlist" value="${requestScope.url2}" readonly="true"></input></td>
        </tr>
    </table>
</div>
<style>
    tr{ height: 30px;}
    tr>td:nth-child(odd){
        color: #999;padding-right: 6px;padding-bottom: 5px
    }

    .inputlist{
        margin-bottom: 8px;
        width: 350px;
        height: 40px;
    }
    .multiple{
        height:48px;
    }
    .combobox{
        height:70px;
    }
</style>
</body>
</html>
