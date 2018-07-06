<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二次装修</title>
<style type="text/css">
.content {
	margin: 20px;
}

div {
	text-align: center;
}

input {
	border: none;
}
</style>
</head>

<body>
	<div class="content">
		<h3>合肥市建筑工程质量安全监督报监表 1</h3>
		<form id="tableForm" action="twoDecoration.do" method="post">
			<table border="1" bordercolor="black"
				style="border-collapse: collapse;">
				<tr>
					<td rowspan="8">工程概括</td>
					<td>工程名称</td>
					<td colspan="2"><input id="工程名称" name="engname" type="text" /></td>
					<td>工程地点</td>
					<td colspan="2"><input id="区" name="engpositionqu" type="text" />区<input id="路"
						name="engpositionlu" type="text" />路<input id="号" name="engpositionhao" type="text" />号</td>
				</tr>
				<tr>
					<td>投资类别</td>
					<td colspan="3"><input name="cateofinves" type="checkbox" value="1"/>1 外资<input
						name="cateofinves" type="checkbox" value="2"/>2 合资<input name="cateofinves"
						type="checkbox" value="3"/>3 国有<input name="cateofinves" type="checkbox" value="4"/>4 集体<input
						name="cateofinves" type="checkbox" value="5"/>5 民营</td>
					<td>预算造价</td>
					<td><input id="预算造价" name="budgetcost" type="text" />万元</td>
				</tr>
				<tr>
					<td>建筑面积</td>
					<td><input id="建筑面积" name="buildarea" type="text" />㎡</td>
					<td>结构类型层次</td>
					<td><input id="结构类型" name="structuralevel" type="text" /></td>
					<td>预算造价</td>
					<td><input id="预算造价" name="costmeter" type="text" />万元</td>
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
					<td colspan="2"><input id="计划开工年" type="text" />年<input
						id="计划开工月" type="text" />月<input id="计划开工日" type="text" />日</td>
					<td>计划竣工日期</td>
					<td colspan="2"><input id="计划竣工年" type="text" />年<input
						id="计划竣工月" type="text" />月<input id="计划竣工日" type="text" />日</td>
				</tr>

				<tr>
					<td>危险性较大工程</td>
					<td colspan="3"><input name="危险性较大工程" type="checkbox" />深基坑 <input
						name="危险性较大工程" type="checkbox" />高大模板 <input name="危险性较大工程"
						type="checkbox" />30M以上高空作业 <input name="危险性较大工程" type="checkbox" />爬架
						<input name="危险性较大工程" type="checkbox" />人货电梯 <input
						name="危险性较大工程" type="checkbox" />塔吊 <input name="危险性较大工程"
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
					<td colspan="6" rowspan="1" height="100">工地现场专职安全员：<input
						id="工地现场专职安全员" type="text" /> 安全考核证号： <input id="工地现场安全考核证号"
						type="text" />（1万M2以内至少一人）<br> 现场专职安全员： <input
						id="工地现场专职安全员1" type="text" />安全考核证号：<input id="工地现场安全考核证号1"
						type="text" />1-5万M2以内至少二人）<br /> 现场专职安全员： <input
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

					<td colspan="3" rowspan="1">符 合 <input type="checkbox" /> 不符合
						<input type="checkbox" /><br /> 审查人： <input type="text" /> <input
						id="计划开工年" type="text" />年<input id="计划开工月" type="text" />月<input
						id="计划开工日" type="text" />日
					</td>
				</tr>

				<tr>
					<td>监督机构</td>
					<td colspan="3"><input id="监督机构" type="text" /></td>
					<td rowspan="4">报监意见</td>
					<td colspan="3" rowspan="3"><br /> <br /> <input id="报监意见年"
						type="text" />年<input id="报监意见月" type="text" />月<input
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
		</form>
	</div>
	<div id="">注：1、本表一式五份，由建设单位填写，监督报监办理完毕后，返还建设单位一份；
		2、相关单位应填写全称，工程名称以施工许可证名称为准，一个施工许可证上有多个
		单体工程的应将各单体工程详细情况填写在《单体工程一览表》，并由建设单位盖章。</div>

	<div>
		<button id="sub">确认提交</button>
	</div>
</body>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$("#sub").click(function(){
		alert("触发点击");
		$("#tableForm").submit();
	});
</script>

</html>