<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

</head>
<body>
<div style="padding: 10px 15px 10px 15px">
    <table style="border-collapse:separate; border-spacing:10px;">
        <tr >
            <td align="right" class="wu-form-text">公告</td>
            <td><textarea type="text" name="message" class="easyui-validatebox wu-text combobox inputlist multiple" readonly="true">${requestScope.text}</textarea></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>发送给</label></td>
            <td><textarea type="text" onclick="selectname();" class=" wu-text combobox inputlist"  readonly="true">${requestScope.str}</textarea></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>已接收</label></td>

            <td><textarea type="text" onclick="selectname();" class=" wu-text combobox inputlist"  readonly="true">${requestScope.str1}</textarea></td>
        </tr>
        <tr >
            <td align="right" class="wu-form-text" ><label>未接收</label></td>
            <td><textarea type="text" onclick="selectname();" class=" wu-text combobox inputlist"  readonly="true">${requestScope.str2}</textarea></td>
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
        height: 44px;
    }
    .multiple{
        height:48px;
    }
    .combobox{
        height:50px;
    }
</style>
</body>
</html>
