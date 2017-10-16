<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select name="client_id">
<c:forEach var="r" items="${requestScope.clientlist}">
<c:if test="${requestScope.info.client_id==r.id}">
<option selected="selected" value="${r.id}">${r.nickname}</option>
</c:if>
<c:if test="${requestScope.info.client_id!=r.id}">
<option value="${r.id}">${r.nickname}</option>
</c:if>
</c:forEach>
</select>