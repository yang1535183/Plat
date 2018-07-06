<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content {
	text-align: center;
	margin: auto;
	margin-top: 30px;
}

table {
	margin: auto;
	margin-top: 30px;
}

img {
	width: 10px;
	height: 100px;
}

td {
	padding: 15px;
}
</style>
<script type="text/javascript" src="js/pdf.js"></script>
</head>
<body>
	<div class="content">
		
		<c:if test="${sessionScope.user.identify==1 }">
			<!-- <a href="downFiles.do?filename=房建工程合同模板.doc&path=doc"><button>模板下载</button></a> -->
			<!-- <a href="101.37.24.25:8080/Plat/doc/房建工程合同模板.doc"><button>模板下载</button></a> -->
			
			<div>
				<form action="ZHTSC.do" enctype="multipart/form-data" method="post">
					<input name="tid" type="hidden" value="${tid }" /> 上传文件:<input
						type="file" name="file"><input type="submit" value="文件提交">
				</form>
			</div>
		</c:if>
		<!-- 遍历Map集合 -->
		<table border="1" bordercolor="black"
			style="border-collapse: collapse;">
			<tr>
				<th>文件名</th>
				<th>操作</th>
			</tr>

			<c:forEach var="me" items="${fileNameMap}">
				<tr>
					<c:url value="/download" var="downurl">
						<c:param name="filename" value="${me.key}"></c:param>
					</c:url>
					<c:set var="cateofinves" value="${me.key }" />
					<c:choose>
						<c:when test="${fn:contains(cateofinves, 'jpg')}">
							<td>${me.value}</td>
							<td><a href="downFiles.do?filename=${me.key }&path=${requestScope.pathName }">下载</a> <a
								href="${path }${me.key }" target="_Blank">查看</a> <%-- <img
								src="${path }${me.key }" alt="加载失败"></img></td> --%>
						</c:when>
						<c:otherwise>
							<td>${me.value}</td>
							<td><a href="downFiles.do?filename=${me.key }&path=${requestScope.pathName }">下载</a>
								<button class="lookPdf" data-href="${path }${me.key }">查看</button>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<br/>
		
		<c:if test="${sessionScope.user.identify==1 }">
			<a href="HTTJ.do?tid=${tid }&type=${requestScope.type}"><button>合同提交审批</button></a>
		</c:if>
		<c:if test="${sessionScope.user.identify!=1 }">
			<a href="HTTJ.do?tid=${tid }&type=${requestScope.type}"><button>通过</button></a>
			<a href="repulseHT.do?tid=${tid }&type=${requestScope.type}"><button>打回</button></a>
		</c:if>
		<br><br>
		
		${requestScope.td.detailinfo }
		
		<embed type="application/pdf" id="pdfDome" style="width: 100%;height: 800px;"/>
		
	</div>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(".lookPdf").click(function(){
			 $("#pdfDome").attr("src",$(this).data("href"));
		});
	</script>
</body>
</html>