<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>领导打回</title>
<style type="text/css">
form, table, h3, .content, td {
	text-align: center;
}

th, td {
	text-align: center;
	border: 1px solid #D2D2D2;
	padding: 10px;
}
table {
	align-content: center;
	margin: auto;	
}
</style>
</head>
<body>
	<div class="content">
		<h3>意见填写</h3>
		<form action="lindaoRepulse.do" method="post">
			<input type="hidden" name="tid" value="${requestScope.td.id }"/>
			<input type="hidden" name="type" value="${requestScope.type }"/>
			<table border="1" bordercolor="black"
				style="border-collapse: collapse;">
				<tr>
					<th>工程名称</th>
					<td>${requestScope.td.engname }</td>
				</tr>
				<tr>
					<th>工程地点</th>
					<td>${requestScope.td.engpositionqu }区
						${requestScope.td.engpositionlu }路
						${requestScope.td.engpositionhao }号</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="detailinfo" name="info" rows="20" cols="100">
								
						</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="意见提交"/>
		</form>
	</div>
</body>
</html>