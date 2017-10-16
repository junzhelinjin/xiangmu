<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select name="product_id" style="margin-left: 35px">
<c:forEach var="r" items="${requestScope.productlist}">
<c:if test="${requestScope.info.product_id==r.id}">
<option selected="selected" value="${r.id}">${r.name}</option>
</c:if>
<c:if test="${requestScope.info.product_id!=r.id}">
<option value="${r.id}">${r.name}</option>
</c:if>
</c:forEach>
</select>