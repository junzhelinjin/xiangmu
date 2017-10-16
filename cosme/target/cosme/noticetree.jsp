<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="custom/jquery.min.js"></script>
    <script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
</head>
<body>
<ul id="tt1" class="easyui-tree" checkbox="true">
    <li data-options="id:0">
        <span>职务</span>
        <ul>
            <li data-options="id:0">
                <span>前台</span>
                <ul>
                    <c:forEach var="r" items="${requestScope.operatorlist}">
                        <c:if test="${r.type==1}">
                            <li data-options="id:'${r.id}'"><span>${r.name}</span></li>
                        </c:if>
                    </c:forEach>
                </ul>

            </li>

    `
            <li data-options="id:0">
                <span>咨询师</span>
                <ul>
                    <c:forEach var="r" items="${requestScope.operatorlist}">
                        <c:if test="${r.type==2}">
                    <li data-options="id:'${r.id}'"><span>${r.name}</span></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>

        </ul>
    </li>

</ul>

</body>
</html>
