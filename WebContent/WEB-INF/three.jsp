<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前三个模板</title>
<style type="text/css">
.content {
	margin: 20px;
}

div {
	text-align: center;
}
</style>
</head>
<body>
	<div class="content">
		<form id="ZSGCForm1" name="ZSGCForm" action="ZSGCForm.do"
			method="post" enctype="multipart/form-data">
			<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
				name="type" type="hidden" value=${requestScope.td.type } />
			<div>
				<p>工程概况</p>
				<span>工程名称:</span><input id="工程名称" name="engname" type="text"
					value="${requestScope.td.engname }" /> <br> <span>工程地点:</span><input
					id="区" name="engpositionqu" type="text"
					value="${requestScope.td.engpositionqu }" />区<input id="路"
					name="engpositionlu" type="text"
					value="${requestScope.td.engpositionlu }" />路<input id="号"
					name="engpositionhao" type="text"
					value="${requestScope.td.engpositionhao }" />号 <br> <span>投资类别:</span>
				<c:if test="${requestScope.td.cateofinves==null }">
					<input name="cateofinves" type="checkbox" value="1" />1 外资
							<input name="cateofinves" type="checkbox" value="2" />2 合资
							<input name="cateofinves" type="checkbox" value="3" />3 国有
							<input name="cateofinves" type="checkbox" value="4" />4 集体
							<input name="cateofinves" type="checkbox" value="5" />5 民营
						</c:if>
				<c:if test="${requestScope.td.cateofinves!=null }">
					<c:set var="cateofinves" value="${requestScope.td.cateofinves }" />
					<c:choose>
						<c:when test="${fn:contains(cateofinves, '1')}">
							<input name="cateofinves" type="checkbox" checked="checked"
								value="1" />1 外资
								</c:when>
						<c:otherwise>
							<input name="cateofinves" type="checkbox" value="1" />1 外资
								</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${fn:contains(cateofinves, '2')}">
							<input name="cateofinves" type="checkbox" checked="checked"
								value="2" />2 合资
								</c:when>
						<c:otherwise>
							<input name="cateofinves" type="checkbox" value="2" />2 合资
								</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cateofinves, '3')}">
							<input name="cateofinves" type="checkbox" checked="checked"
								value="3" />3 国有
								</c:when>
						<c:otherwise>
							<input name="cateofinves" type="checkbox" value="3" />3 国有
								</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${fn:contains(cateofinves, '4')}">
							<input name="cateofinves" type="checkbox" checked="checked"
								value="4" />4 集体
								</c:when>
						<c:otherwise>
							<input name="cateofinves" type="checkbox" value="4" />4 集体
								</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${fn:contains(cateofinves, '4')}">
							<input name="cateofinves" type="checkbox" checked="checked"
								value="5" />5 民营
								</c:when>
						<c:otherwise>
							<input name="cateofinves" type="checkbox" value="5" />5 民营
								</c:otherwise>
					</c:choose>
				</c:if>
				<br> <span>预算造价:</span><input id="预算造价" name="budgetcost"
					type="text" value="${requestScope.td.budgetcost }" />万元<br> <span>建筑面积:</span><input
					id="建筑面积" name="buildarea" type="text"
					value="${requestScope.td.buildarea }" />㎡ <br> <span>结构类型层次:</span><input
					id="结构类型" name="structuralevel" type="text"
					value="${requestScope.td.structuralevel }" /> <br> <span>每平方米造价:</span><input
					id="预算造价" name="costmeter" type="text"
					value="${requestScope.td.costmeter }" />万元
			</div>
			<div>
				<span>房产证或房屋租赁协议：</span><input type="file" name="file1" /><br>
				<span>产权单位同意装修的证明材料：</span><input type="file" name="file2" /><br>
				<span>审图资料：</span><input type="file" name="file3" /><br> <span>规划部门意见：</span><input
					type="file" name="file4" /><br> <span>施工合同：</span><input
					type="file" name="file5" /><br> <span>施工单位资质证书：</span><input
					type="file" name="file6" /><br> <span>五大员证书：</span><input
					type="file" name="file7" /><br> <span>工伤保险：</span><input
					type="file" name="file8" /><br> <span>居地意见：</span><input
					type="file" name="file9" /><br>
			</div>

			<input type="submit" value="再次提交">
		</form>
	</div>
</body>
</html>