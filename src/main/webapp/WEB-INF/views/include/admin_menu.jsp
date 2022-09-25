<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;">
	<a href="${path}/">Home</a> |
	<a href="${path}/admin/list.do">상품 목록</a> |
	<c:if test="${sessionScope.admin_userid != null}">
	 <a href="${path}/admin/write.do">상품등록</a> |
	</c:if>
	<a href="${path}/chart/chart.do">구글차트(db)</a> |
	
	<div style="text-align: right;">
	 <h2>
 ${sessionScope.admin_name}(${sessionScope.admin_userid})님 환영합니다.
</h2>
  </div>
</div>
<hr>
    