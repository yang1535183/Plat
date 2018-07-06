<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载文件显示页面</title>
</head>
<body>
	<!-- 遍历Map集合 -->
	<c:forEach var="me" items="${fileNameMap}">
		<c:url value="/download" var="downurl">
			<c:param name="filename" value="${me.key}"></c:param>
		</c:url>
		<c:set var="cateofinves" value="${me.key }"/>
		<c:choose>
			<c:when test="${fn:contains(cateofinves, 'jpg')}">
				 ${me.value}<a href="downFiles.do?filename=${me.key }">下载</a>
				<img src="${path }${me.key }" alt="加载失败"></img>
			</c:when>
			<c:otherwise>
				 ${me.value}<a href="downFiles.do?filename=${me.key }">下载</a>
			</c:otherwise>
		</c:choose>
		<br />
	</c:forEach>
</body>
</html>