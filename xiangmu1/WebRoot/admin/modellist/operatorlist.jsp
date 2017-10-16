<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<select name="lastoperator_id">
<c:forEach var="r" items="${requestScope.operatorlist}">
<c:if test="${requestScope.info.lastoperator_id==r.id}">
<option selected="selected" value="${r.id}">${r.name}</option>
</c:if>
<c:if test="${requestScope.info.lastoperator_id!=r.id}">
<option value="${r.id}">${r.name}</option>
</c:if>
</c:forEach>
</select>