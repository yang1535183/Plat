<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房建工程模板</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.content {
	margin-top: 30px;
	margin-left: 30px;
}

.gc {
	display: none;
	margin-left: 20px;
	margin-top: 10px;
}

.GCButton{
	padding: 5px;
	border-radius: 10px;
}

span,input{
	margin: 5px;
}

td{
	text-align: center;
	padding: 3px;
}
</style>
</head>
<body>
	<div class="content">
		<form id="ZSGCForm1" name="ZSGCForm" action="ZSGCForm.do"
				method="post" enctype="multipart/form-data">
				<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
					name="type" type="hidden" value="房建工程" />
				<div>
					<h3>工程概况</h3>
					<span>*工程名称:</span><input id="工程名称" name="engname" type="text"
						value="${requestScope.td.engname }" /> <br> <span>*工程地点:</span><input
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
							<c:when test="${fn:contains(cateofinves, '5')}">
								<input name="cateofinves" type="checkbox" checked="checked"
									value="5" />5 民营
								</c:when>
							<c:otherwise>
								<input name="cateofinves" type="checkbox" value="5" />5 民营
								</c:otherwise>
						</c:choose>
					</c:if>
					<br> 
					<span>预算造价:</span><input id="预算造价" name="budgetcost" type="text"
						value="${requestScope.td.budgetcost }" />万元<br> <span>建筑面积:</span><input
						id="建筑面积" name="buildarea" type="text"
						value="${requestScope.td.buildarea }" />㎡ <br> <span>*结构类型层次:</span><input
						id="结构类型" name="structuralevel" type="text"
						value="${requestScope.td.structuralevel }" /> <br> <span>每平方米造价:</span><input
						id="预算造价" name="costmeter" type="text"
						value="${requestScope.td.costmeter }" />万元
				</div>
				
				
				<div class="fuJianDiv">
					<h3>附件列表</h3>
					<table border="1" bordercolor="black"
					style="border-collapse: collapse;">
						<tr>
							<th>类型</th>
							<th>附件</th>
						</tr>
						<tr>
							<td>施工许可证</td>
							<td><input type="file" name="file1" /></td>
						</tr>
						<tr>
							<td>工伤保险</td>
							<td><input type="file" name="file2" /></td>
						</tr>
						<tr>
							<td>农民工保障金</td>
							<td><input type="file" name="file3" /></td>
						</tr>
						<tr>
							<td>审图资料</td>
							<td><input type="file" name="file4" /></td>
						</tr>
						<tr>
							<td>五方责任主体承诺书</td>
							<td><input type="file" name="file5" /></td>
						</tr>
						<tr>
							<td>预拌砂浆应用承诺书</td>
							<td><input type="file" name="file6" /></td>
						</tr>
						<tr>
							<td>备案合同</td>
							<td><input type="file" name="file7" /></td>
						</tr>
						<tr>
							<td>中标通知书</td>
							<td><input type="file" name="file8" /></td>
						</tr>
						<tr>
							<td>企业安全生产许可证</td>
							<td><input type="file" name="file9" /></td>
						</tr>
					</table>
				</div>
				<input type="submit" value="再次提交">
			</form>
	</div>
</body>
</html>