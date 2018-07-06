<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" import="com.zhuozhengsoft.pageoffice.*"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>装饰工程详情</title>
<style type="text/css">
.content {
	margin: 20px;
}

div {
	text-align: center;
}

input {
	border: none;
	text-align: center;
	color: red;
}

td {
	padding: 7px;
}
/* .infoDiv{
	border: solid 1px gray;
	padding: 10px; 
} */
</style>
<script type="text/javascript">
	function preview(oper) {
		if (oper < 10) {
			bdhtml = window.document.body.innerHTML; //获取当前页的html代码    
			sprnstr = "<!--startprint" + oper + "-->"; //设置打印开始区域    
			eprnstr = "<!--endprint" + oper + "-->"; //设置打印结束区域    
			prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html    

			prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr)); //从结束代码向前取html    
			window.document.body.innerHTML = prnhtml;
			window.print();
			window.document.body.innerHTML = bdhtml;
		} else {
			window.print();
		}
	}
</script>
</head>
<body>
	<div id="content" class="content">
		<c:if test="${sessionScope.user.identify!=3 }">
			<!--startprint1-->
			<div class="content">
			<button onclick="preview(1)" style="float: right;">打印</button>
				<h2>合肥市建筑工程质量安全监督报监表</h2>
				<table border="1" bordercolor="black"
					style="border-collapse: collapse;">
					<tr>
						<td rowspan="8">工程概况</td>
						<td>工程名称</td>
						<td colspan="2">${requestScope.td.engname }</td>
						<td>工程地点</td>
						<td colspan="2"><input id="区" name="engpositionqu"
							type="text" value="${requestScope.td.engpositionqu }" />区<br><input
							id="路" name="engpositionlu" type="text"
							value="${requestScope.td.engpositionlu }" />路<br><input id="号"
							name="engpositionhao" type="text"
							value="${requestScope.td.engpositionhao }" />号</td>
					</tr>
					<tr>

						<td>投资类别</td>
						<td colspan="3"><c:if
								test="${requestScope.td.cateofinves==null }">
								<input name="cateofinves" type="checkbox" value="1" />1 外资
								<input name="cateofinves" type="checkbox" value="2" />2 合资
								<input name="cateofinves" type="checkbox" value="3" />3 国有
								<input name="cateofinves" type="checkbox" value="4" />4 集体
								<input name="cateofinves" type="checkbox" value="5" />5 民营
							</c:if> <c:if test="${requestScope.td.cateofinves!=null }">
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
							</c:if></td>
						<td>预算造价</td>
						<td><input id="预算造价" name="budgetcost" type="text"
							value="${requestScope.td.budgetcost }" />万元</td>
					</tr>
					<tr>
						<td>建筑面积</td>
						<td><input id="建筑面积" name="buildarea" type="text"
							value="${requestScope.td.buildarea }" />㎡</td>
						<td>结构类型层次</td>
						<td><input id="结构类型" name="structuralevel" type="text"
							value="${requestScope.td.structuralevel }" /></td>
						<td>每平方米造价</td>
						<td><input id="预算造价" name="costmeter" type="text"
							value="${requestScope.td.costmeter }" />万元</td>
					</tr>
					<tr>
						<td>基础类型</td>
						<td><input id="基础类型" type="text" /></td>
						<td>工程类别</td>
						<td colspan="3"><input name="工程类别" type="checkbox" />1 住宅<input
							name="工程类别" type="checkbox" />2 公建<input name="工程类别"
							type="checkbox" />3 厂房<input name="工程类别" type="checkbox" />4 其他</td>
					</tr>
					<tr>
						<td>建筑节能执行标准</td>
						<td colspan="5"><input name="建筑节能执行标准" type="checkbox" />50%<input
							name="建筑节能执行标准" type="checkbox" />65%<input name="建筑节能执行标准"
							type="text" /></td>
					</tr>
					<tr>
						<td>绿色建筑</td>
						<td colspan="2"><input id="绿色建筑" type="text" /></td>
						<td colspan="3"><input name="绿色建筑" type="checkbox" />一星<input
							name="绿色建筑" type="checkbox" />二星<input name="绿色建筑"
							type="checkbox" />三星</td>
					</tr>
					<tr>
						<td>可再生能源建筑应用</td>
						<td>太阳能光热</td>
						<td><input id="太阳能光热" type="text" />㎡</td>
						<td>太阳能光伏</td>
						<td><input id="太阳能光伏" type="text" />kW</td>
						<td>地源热泵<input id="地源热泵" type="text" />M
						</td>
					</tr>
					<tr>
						<td>计划开工日期</td>
						<td colspan="2"><input id="计划开工年" type="text" />年<br><input
							id="计划开工月" type="text" />月<br><input id="计划开工日" type="text" />日</td>
						<td>计划竣工日期</td>
						<td colspan="2"><input id="计划竣工年" type="text" />年<br><input
							id="计划竣工月" type="text" />月<br><input id="计划竣工日" type="text" />日</td>
					</tr>

					<tr>
						<td>危险性较大工程</td>
						<td colspan="3"><input name="危险性较大工程" type="checkbox" />深基坑
							<input name="危险性较大工程" type="checkbox" />高大模板 <input
							name="危险性较大工程" type="checkbox" />30M以上高空作业 <input name="危险性较大工程"
							type="checkbox" />爬架 <input name="危险性较大工程" type="checkbox" />人货电梯
							<input name="危险性较大工程" type="checkbox" />塔吊 <input name="危险性较大工程"
							type="checkbox" />其他</td>
						<td>周边环境</td>
						<td colspan="2"><input name="周边环境" type="checkbox" />临近高压线 <input
							name="周边环境" type="checkbox" />临近居民区、商业区 <input name="周边环境"
							type="checkbox" />其他</td>
					</tr>

					<tr>
						<td rowspan="2">建设单位</td>
						<td>单位名称</td>
						<td colspan="2"><input id="建设单位名称" type="text" /></td>
						<td>资质登记证书</td>
						<td colspan="2"><input id="建设资质登记证书" type="text" /></td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td colspan="2"><input id="建设项目负责人" type="text" /></td>
						<td>联系电话</td>
						<td colspan="2"><input id="建设联系电话" type="text" /></td>
					</tr>

					<tr>
						<td rowspan="2">勘察单位</td>
						<td>单位名称</td>
						<td colspan="2"><input id="勘察单位名称" type="text" /></td>
						<td>资质登记证书</td>
						<td colspan="2"><input id="勘察资质登记证书" type="text" /></td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td><input id="勘察项目负责人" type="text" /></td>
						<td>执业资格及证书</td>
						<td><input id="勘察执业资格及证书" type="text" /></td>
						<td>联系电话</td>
						<td><input id="勘察联系电话" type="text" /></td>
					</tr>

					<tr>
						<td rowspan="2">设计单位</td>
						<td>单位名称</td>
						<td colspan="2"><input id="设计单位名称" type="text" /></td>
						<td>资质登记证书</td>
						<td colspan="2"><input id="设计资质登记证书" type="text" /></td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td><input id="设计项目负责人" type="text" /></td>
						<td>执业资格及证书</td>
						<td><input id="设计执业资格及证书" type="text" /></td>
						<td>联系电话</td>
						<td><input id="设计联系电话" type="text" /></td>
					</tr>

					<tr>
						<td rowspan="2">监理单位</td>
						<td>单位名称</td>
						<td colspan="2"><input id="监理单位名称" type="text" /></td>
						<td>资质登记证书</td>
						<td colspan="2"><input id="监理资质登记证书" type="text" /></td>
					</tr>
					<tr>
						<td>项目负责人</td>
						<td><input id="监理项目负责人" type="text" /></td>
						<td>执业资格及证书</td>
						<td><input id="监理执业资格及证书" type="text" /></td>
						<td>联系电话</td>
						<td><input id="监理联系电话" type="text" /></td>
					</tr>

					<tr>
						<td rowspan="5">施工单位</td>
						<td rowspan="2">单位名称</td>
						<td rowspan="2" colspan="2"><input id="施工单位名称" type="text" /></td>
						<td>资质等级及证书</td>
						<td colspan="2"><input id="施工单位资质等级及证书" type="text" /></td>
					</tr>
					<tr>
						<td>安全生产许可证号</td>
						<td colspan="2"><input id="安全生产许可证号" type="text" /></td>
					</tr>
					<tr>
						<td>项目经理</td>
						<td colspan="2"><input id="施工单位项目经理" type="text" /></td>
						<td>岗位证书</td>
						<td colspan="2"><input id="施工单位岗位证书" type="text" /></td>
					</tr>

					<tr>
						<td>安全考核证号</td>
						<td colspan="2"><input id="施工单安全考核证号" type="text" /></td>
						<td>联系电话</td>
						<td colspan="2"><input id="施工单位联系电话" type="text" /></td>
					</tr>

					<tr>
						<td colspan="6" rowspan="1" height="100">现场专职安全员：<input
							id="工地现场专职安全员" type="text" /> 安全考核证号： <input id="工地现场安全考核证号"
							type="text" />（1万M2以内至少一人）<br> 现场专职安全员： <input
							id="工地现场专职安全员1" type="text" />安全考核证号：<input id="工地现场安全考核证号1"
							type="text" />（1-5万M2以内至少二人）<br /> 现场专职安全员： <input
							id="工地现场专职安全员2" type="text" />安全考核证号：<input id="工地现场安全考核证号2"
							type="text" />（5万M2以上至少三人）
						</td>
					</tr>

					<tr>
						<td colspan="2">施工图审查单位</td>
						<td colspan="5"><input id="施工图审查单位" type="text" /></td>
					</tr>

					<tr>
						<td colspan="2">工伤保险征收部门</td>
						<td><input id="工伤保险征收部门" type="text" /></td>
						<td>社保保单号</td>
						<td><input id="社保保单号" type="text" /></td>
						<td>保费金额</td>
						<td><input id="保费金额" type="text" /></td>
					</tr>

					<tr>
						<td colspan="4">建设单位承诺</td>
						<td colspan="3">审查意见</td>
					</tr>

					<tr height="136">
						<td colspan="4" rowspan="1">1、对本表所填内容真实性负责；<br />
							2、不具备安全生产条件不施工，不对设计、施工、监理单位提出违反有关法律、法规和强制性标准的要求，不压缩合同约定的工期； <br />
							3、认真落实质量通病防治导则、节能保温等工作要求； <br /> 4、不肢解分包工程，对违法分包承担相应责任。 <br />
							建设单位代表： <input type="text" />（单位公章）
						</td>

						<td colspan="3" rowspan="1">符 合 <input type="checkbox" />
							不符合 <input type="checkbox" /><br /> 审查人： <input type="text" /><br>
							<input id="计划开工年" type="text" />年<br><input id="计划开工月" type="text" />月<br><input
							id="计划开工日" type="text" />日
						</td>
					</tr>

					<tr>
						<td>监督机构</td>
						<td colspan="3"><input id="监督机构" type="text" /></td>
						<td rowspan="4">报监意见</td>
						<td colspan="3" rowspan="3"><br /> <br /> <input id="报监意见年"
							type="text" />年<br><input id="报监意见月" type="text" />月<br><input
							id="报监意见日" type="text" />日<br /> (公章)</td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td colspan="3"><input type="text" /></td>
					</tr>
					<tr>
						<td>监督注册号</td>
						<td colspan="3"><input type="text" /></td>
					</tr>
				</table>
			</div>
			<div id="">注：1、本表一式五份，由建设单位填写，监督报监办理完毕后，返还建设单位一份；
				2、相关单位应填写全称，工程名称以施工许可证名称为准，一个施工许可证上有多个
				单体工程的应将各单体工程详细情况填写在《单体工程一览表》，并由建设单位盖章。</div>
			<!--endprint1-->
		</c:if>
		<c:if test="${sessionScope.user.identify==3 }">
			<div class="content">

				<div>
					<h3>审核列表</h3>
					<table border="1" bordercolor="black"
						style="border-collapse: collapse; margin: auto;">
						<tr>
							<th>审核项</th>
							<th>内容</th>
							<th>操作</th>
						</tr>
						<tr>
							<td>工程名称</td>
							<td>${requestScope.td.engname }</td>
							<td><input class="radioClass" name="radio1" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio1" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian1" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>工程地点:</td>
							<td>${requestScope.td.engpositionqu }区${requestScope.td.engpositionlu }路${requestScope.td.engpositionhao }号</td>
							<td><input class="radioClass" name="radio2" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio2" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian2" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>投资类别</td>
							<td><c:choose>
									<c:when test="${requestScope.td.cateofinves ==1}">
										外资
									</c:when>
									<c:when test="${requestScope.td.cateofinves ==2}">
										合资
									</c:when>
									<c:when test="${requestScope.td.cateofinves ==3}">
										国有
									</c:when>
									<c:when test="${requestScope.td.cateofinves ==4}">
										集体
									</c:when>
									<c:when test="${requestScope.td.cateofinves ==5}">
										民营
									</c:when>
									<c:otherwise>
										 外资
									</c:otherwise>
								</c:choose></td>
							<td><input class="radioClass" name="radio3" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio3" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian3" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>预算造价</td>
							<td>${requestScope.td.budgetcost }</td>
							<td><input class="radioClass" name="radio4" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio4" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian4" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>建筑面积</td>
							<td>${requestScope.td.buildarea }</td>
							<td><input class="radioClass" name="radio5" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio5" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian5" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>结构类型/层次</td>
							<td>${requestScope.td.structuralevel }</td>
							<td><input class="radioClass" name="radio6" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio6" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian6" type="text"
								placeholder="选填" value=""></td>
						</tr>

						<tr>
							<td>每平方米造价</td>
							<td>${requestScope.td.costmeter }</td>
							<td><input class="radioClass" name="radio7" value="0"
								checked="checked" type="radio" /><span>通过</span> <input
								class="radioClass" name="radio7" value="1" type="radio" /><span>不通过</span>
								<span>意见：</span><input class="yiJian" name="yiJian7" type="text"
								placeholder="选填" value=""></td>
						</tr>
					</table>
				</div>
			</div>
		</c:if>
		<div class="content">
			<!-- 遍历Map集合 -->
			<%-- <%
				PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
				poCtrl1.setServerPage("poserver.zz"); //此行必须
				poCtrl1.setSaveFilePage("savefile.jsp");//如要保存文件，此行必须
				//打开文件
				poCtrl1.webOpen("doc/test.doc", OpenModeType.docNormalEdit, "张三");
			%>
			<div id="content" style="height: 800px; width: 100%;">
				<%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
			</div> --%>
			<table border="1" bordercolor="black"
				style="border-collapse: collapse; margin: auto;">
				<h3>附件列表</h3>
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
								<td><a
									href="downFiles.do?filename=${me.key }&path=${requestScope.pathName }">下载</a>
									<a href="${path }${me.key }" target="_Blank">查看</a><img
									src="${path }${me.key }" alt="加载失败"></img></td>
							</c:when>
							<c:when test="${fn:contains(cateofinves, 'png')}">
								<td>${me.value}</td>
								<td><a
									href="downFiles.do?filename=${me.key }&path=${requestScope.pathName }">下载</a>
									<a href="${path }${me.key }" target="_Blank">查看</a><img
									src="${path }${me.key }" alt="加载失败"></img></td>
							</c:when>
							<c:otherwise>
								<td>${me.value}</td>
								<td><a
									href="downFiles.do?filename=${me.key }&path=${requestScope.pathName }">下载</a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<br />

			<c:if test="${requestScope.td.state=='待审核'}">
				<c:if test="${sessionScope.user.identify==3 }">
					<button id="pass">通过</button>
					<button id="repulse">打回</button>
					<form style="display: none;" id="repulseForm" action="repulse.do"
						method="get">
						<input type="hidden" name="tid" value="${requestScope.td.id }">
						<input type="hidden" id="infoStr" name="infoStr"> <input
							type="hidden" id="yiJianDetail" name="yiJianDetail" value="">
						<!-- 请填写意见：<input id="detailInfo" name="detailInfo" value="" type="text" placeholder="请填写意见(可为空)" style="border: black 1px solid;">
						<br><br>
						<input type="submit" value="确认打回" style="cursor:pointer;"> -->
					</form>
					<br>
					<div id="selDIV" style="display: none">
						<span id="selOne">选择下一环节处理人</span> <select id="selLD">
						</select>
						<button id="checked" data-tid="${requestScope.td.id }">确认提交</button>
						<form style="display: none" id="passForm" action="pass.do"
							method="get">
							<input name="tid" value="${requestScope.td.id }" /> <input
								id="uuid" name="uid" /> <input id="info" name="info" />
						</form>
					</div>
				</c:if>
			</c:if>

			<c:if test="${requestScope.td.state=='审核通过'}">
				<c:if test="${sessionScope.user.identify==4 }">
					<a href="pass.do?tid=${requestScope.td.id }"><button>通过</button></a>
					<a href="lindaoRepulse.do?tid=${requestScope.td.id }"><button>打回</button></a>
					<br>
					<br>
				</c:if>
			</c:if>

			<c:if test="${requestScope.td.state=='未通过' }">
				<c:if test="${sessionScope.user.identify==1 }">
					<a href="again.do?tid=${requestScope.td.id }"><button
							id="again">再次提交</button></a>
				</c:if>
			</c:if>
		</div>
		
		<br>
		<div>
			<table>
				<%-- <tr>
					<td>审查意见</td>
					<td>${requestScope.td.info}</td>
				</tr>
				<tr>
					<td>领导意见</td>
					<td>${requestScope.td.detailinfo }</td>
				</tr> --%>
				<tr>
					<td>报监记录</td>
					<td>
						<c:forEach items="${requestScope.list2 }" var="item" varStatus="s">
							<p style="padding: 3px;color: blue">${item.rdate }:<span>${item.raction }</span>
							</p>
						</c:forEach>
					</td>
				</tr>
			</table>
			<%-- <c:if
				test="${requestScope.td.info!=null && requestScope.td.info!='' }">
				<div>
					<span>审查意见 </span><span style="color: blue;">${requestScope.td.info}</span>
				</div>
			</c:if>
			<c:if test="${requestScope.td.detailinfo!='' }">
				<span>领导意见：${requestScope.td.detailinfo }</span>
			</c:if>

			<div>
				<h4>报监记录</h4>
				<div class="infoDiv">
					<c:forEach items="${requestScope.list2 }" var="item" varStatus="s">
						<p style="padding: 3px;">${item.rdate }:<span>${item.raction }</span>
						</p>
					</c:forEach>
				</div>
			</div> --%>
		</div>
	</div>

	<script type="text/javascript" src=" jquery.min.js"></script>
	<script type="text/javascript" src=" pageoffice.js" id="po_js_main"></script>
	<script type="text/javascript">
		POBrowser.openWindow
	</script>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#pass")
									.click(
											function() {
												$("#selDIV").show();
												var id = $("#selOne").attr(
														"data-id");
												var html = "<option value='0'>--请选择--</option>";
												$
														.get(
																"selOne.do",
																{
																	id : id
																},
																function(data) {
																	for (var i = 0; i < data.length; i++) {
																		html += "<option value='"+data[i].id+"'>"
																				+ data[i].name
																				+ "</option>";
																	}
																	$("#selLD")
																			.html(
																					html);
																});
											});

							$("#selLD").change(function() {
								var uid = $("#selLD").val();
								if (value == '0' || value == 0) {
									$("#checked").hide();
								}
								$("#checked").show();
							});

							$("#checked").click(function() {
								var uid = $("#selLD").val();
								$("#uuid").val(uid);
								$("#passForm").submit();
							});

							$("#repulse").click(function() {
								$("#repulseForm").show();
								var arr = $(".radioClass:checked");
								var radioValue = "";
								for (var i = 0; i < arr.length; i++) {
									radioValue += $(arr[i]).val() + ",";
								}

								var yiJianArr = $(".yiJian");
								var yiJianValue = "";
								for (var i = 0; i < yiJianArr.length; i++) {
									yiJianValue += $(yiJianArr[i]).val() + ",";
								}

								/* alert(radioValue); */
								$("#infoStr").val(radioValue);
								/* alert(yiJianValue); */
								$("#yiJianDetail").val(yiJianValue);

								$("#repulseForm").submit();
							});
						});
	</script>
</body>
</html>