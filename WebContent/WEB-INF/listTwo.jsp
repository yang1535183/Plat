<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.DataTable {
	margin: 3%;
}

table {
	border: none;
}

th, td {
	text-align: center;
	border: 1px solid #D2D2D2;
	padding: 10px;
}

tr:hover {
	background-color: lavender;
	cursor: pointer;
	font-size: 16px;
}

tr td button:hover {
	background-image: linear-gradient(to top, rgb(245, 245, 245),
		rgb(254, 254, 254));
	border-radius: 3px;
}

ul, li {
	list-style: none;
	width: 80%;
}

li {
	margin-left: 20%;
}
</style>
</head>
<body>
	<div class="DataTable">
		<table width="95%" style="table-layout: fixed;">
			<tr>
				<th>编号</th>
				<th>工程类型</th>
				<th>工程名称</th>
				<th>工程地点</th>
				<th>状态</th>
				<th>意见</th>
				<th>操作</th>
			</tr>

			<c:forEach var="item" items="${requestScope.list }" varStatus="s">
				<tr id="${item.id }">
					<td>${item.id }</td>
					<td>${item.type }</td>
					<td>${item.engname }</td>
					<td>${item.engpositionqu }区${item.engpositionlu }路
						${item.engpositionhao }号</td>
					<td>${item.state }</td>
					<td>${item.info }</td>
					<td>
						<a href="showTwo.do?id=${item.id }"><button>查看详情</button></a>
						<c:if test="${item.state=='待审核' }">
							<c:if test="${sessionScope.user.identify==0 }">
								<a href="passTwo.do?id=${item.id }"><button>通过</button></a>
								<a href="repulseTwo2.do?id=${item.id }"><button>打回</button></a>
							</c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>