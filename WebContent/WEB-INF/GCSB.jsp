<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工程上报</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.content {
	margin-top: 30px;
	margin: auto;
}

.gc {
	display: none;
	margin-left:300px;
	margin-top: 10px;
}

h3{
	margin-left: -20px;
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
/*设置IE滤镜，这里的id=imghead要与下方利用Javascript生成div的id相呼应。*/
#imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
</style>
 <script type="text/javascript">
      //图片上传预览，非IE则用了HTML5的代码，IE是用了滤镜
      function previewImage(file, MAXWIDTH, MAXHEIGHT){//MAXWIDTH、MAXHEIGHT与放预览图片的DIV——preview的大小相呼应
        var div = document.getElementById('preview');
        if (file.files && file.files[0]) {//HTML5部分
          div.innerHTML = "<img id='imghead'></img>";
          var img = document.getElementById('imghead');
          img.onload = function(){
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            img.style.marginTop = rect.top + 'px';
          }
          var reader = new FileReader();
          reader.onload = function(evt){
            img.src = evt.target.result;
          }
          reader.readAsDataURL(file.files[0]);
        }
        else //兼容IE
        {
          var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
          file.select();
          var src = document.selection.createRange().text;
          div.innerHTML = "<img id='imghead'></img>";
          var img = document.getElementById('imghead');
          img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
          var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
          div.innerHTML = "<div style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }
      }
      //用于计算预览图片的大小
      function clacImgZoomParam(maxWidth, maxHeight, width, height){
        var param = {
          top: 0,
          left: 0,
          width: width,
          height: height
        };
        if (width > maxWidth || height > maxHeight) {
          rateWidth = width / maxWidth;
          rateHeight = height / maxHeight;
          if (rateWidth > rateHeight) {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
          }
          else {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
          }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
      }
</script>
</head>
<body>
	<div class="content">
		<div style="margin-left: 280px;margin-top: 30px;">
			<span style="color: blue;">请选择工程类别</span>
			<select id="gcSel" name="gcSel">
				<!-- <option value="0">--请选择工程类型--</option> -->
				<option value="房建工程">房建工程</option>
				<option value="市政工程">市政工程</option>
				<option value="装饰工程">装饰工程</option>
				<option value="拆除工程">拆除工程</option>
			</select>
		</div>

		<div class="gc" id="fj" style="display: block;">
			<h2 style="margin-left: 260px;">房建工程报监表</h2>
			<form id="ZSGCForm1" name="ZSGCForm" action="ZSGCForm.do"
				method="post" enctype="multipart/form-data">
				<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
					name="type" type="hidden" value="房建工程" />
				<div>
					<h3>工程概况</h3>
					<span>*工程名称</span><input id="工程名称" name="engname" type="text"
						value="${requestScope.td.engname }" /> <br> <span>*工程地点</span><input
						id="区" name="engpositionqu" type="text"
						value="${requestScope.td.engpositionqu }" />区<input id="路" 
						name="engpositionlu" type="text"
						value="${requestScope.td.engpositionlu }" />路<input id="号"
						name="engpositionhao" type="text"
						value="${requestScope.td.engpositionhao }" />号 <br> <span>投资类别</span>
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
					<span>预算造价</span><input id="预算造价" name="budgetcost" type="text"
						value="${requestScope.td.budgetcost }" />万元<br> <span>建筑面积</span><input
						id="建筑面积" name="buildarea" type="text"
						value="${requestScope.td.buildarea }" />㎡ <br> <span>*结构类型层次</span><input
						id="结构类型" name="structuralevel" type="text"
						value="${requestScope.td.structuralevel }" /> <br> <span>每平方米造价</span><input
						id="预算造价" name="costmeter" type="text"
						value="${requestScope.td.costmeter }" />元<br>
					<span>基础类型</span><input type="text"><br>
					<span>工程类别</span><input type="text">
					<input type="checkbox" value="1" />1 住宅
					<input type="checkbox" value="2" />2 公建
					<input type="checkbox" value="3" />3 厂房
					<input type="checkbox" value="4" />4 其他<br>
					<span>建筑节能执行标准</span><input type="text">
					<input type="checkbox" value="1" />50%
					<input type="checkbox" value="2" />65%
					<input type="checkbox" value="3" />其他
					<br>
					<span>绿色建筑</span><input type="text">㎡
					<input type="checkbox" value="1" />一星
					<input type="checkbox" value="2" />二星
					<input type="checkbox" value="3" />三星
					<br>
					<span>可再生能源建筑应用</span><br>
					<span>太阳能光热</span><input type="text">㎡<br>
					<span>太阳能光伏</span><input type="text">KW<br>
					<span>地源热泵</span><input type="text">㎡<br>
					<span>计划开工日期</span><input type="date"><br>
					<span>计划竣工日期</span><input type="date"><br>
					<h3>危险性较大工程</h3>
					<input type="checkbox" value="1" />深基坑
					<input type="checkbox" value="2" />高大模板
					<input type="checkbox" value="3" />30M以上高空作业
					<input type="checkbox" value="4" />爬架
					<input type="checkbox" value="5" />人货电梯
					<input type="checkbox" value="6" />塔吊
					<input type="checkbox" value="7" />其他
					<br>
					<span>周边环境</span>
					<input type="checkbox" value="1" />临近高压线
					<input type="checkbox" value="2" />临近居民区、商业区
					<input type="checkbox" value="2" />其他
					<br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>勘察单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>设计单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>监理单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>施工单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>安全生产许可证</span><input type="text"><br>
					<span>项目经理</span><input type="text"><br>
					<span>岗位证书</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<span>工地现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1万M2以内至少一人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1-5万M2以内至少二人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（5万M2以上至少三人）<br>
					<span>施工图审查单位</span><input type="text"><br>
					<span>工伤保险征收部门</span><input type="text"><br>
					<span>社保保单号</span><input type="text"><br>
					<span>保费金额</span><input type="text"><br>
					<h3>建设单位承诺</h3>
					<p>1、对本表所填内容真实性负责；</p>
					<p>2、不具备安全生产条件不施工，不对设计、施工、监理单位提出违反有关法律、法规和强制性标准的要求，不压缩合同约定的工期；</p>
					<p>3、认真落实质量通病防治导则、节能保温等工作要求；</p>
					<p>4、不肢解分包工程，对违法分包承担相应责任。</p>
					<span>建设单位代表</span><input type="text">（单位公章）<br>
					<h3>审查意见</h3>
					<input type="checkbox" value="1" />符  合
					<input type="checkbox" value="2" />不符合
					<br>
					<span>审查人</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<br>
					<span>监督机构</span><input type="text">
					<br>
					<span>联系电话</span><input type="text">
					<br>
					<span>监督注册号</span><input type="text">
					<br>
					<h3>报监意见</h3>
					<span>意见填写</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<span>（公 章）</span>
					<br>
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
							<td>
								<!--用来放预览图片的DIV-->
								 <div id="preview" style="width:320px;height:240px;display: none;"></div>
								 <!--一旦用户选择了图片文件，则触发上方的previewImage函数-->
	   	 						<input id="file1" type="file" name="file1" onchange="previewImage(this,320,240)" accept="image/*" />
   	 						</td>
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
			</form>
			<br>
			<button id="submitButton1" class="GCButton">工程提交</button>
		</div>
		<div class="gc" id="sz">
			<h2 style="margin-left: 260px;">市政模板</h2>
			<form id="ZSGCForm2" name="ZSGCForm" action="ZSGCForm.do"
				method="post" enctype="multipart/form-data">
				<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
					name="type" type="hidden" value="市政工程" />
				<div>
					<h3>工程概况</h3>
					<span>*工程名称</span><input id="工程名称" name="engname" type="text"
						value="${requestScope.td.engname }" /> <br> <span>*工程地点</span><input
						id="区" name="engpositionqu" type="text"
						value="${requestScope.td.engpositionqu }" />区<input id="路"
						name="engpositionlu" type="text"
						value="${requestScope.td.engpositionlu }" />路<input id="号"
						name="engpositionhao" type="text"
						value="${requestScope.td.engpositionhao }" />号 <br> <span>投资类别</span>
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
					<br> <span>预算造价</span><input id="预算造价" name="budgetcost" type="text"
						value="${requestScope.td.budgetcost }" />万元<br> <span>建筑面积</span><input
						id="建筑面积" name="buildarea" type="text"
						value="${requestScope.td.buildarea }" />㎡ <br> <span>*结构类型层次</span><input
						id="结构类型" name="structuralevel" type="text"
						value="${requestScope.td.structuralevel }" /> <br> <span>每平方米造价</span><input
						id="预算造价" name="costmeter" type="text"
						value="${requestScope.td.costmeter }" />万元
						
						<span>基础类型</span><input type="text"><br>
					<span>工程类别</span><input type="text">
					<input type="checkbox" value="1" />1 住宅
					<input type="checkbox" value="2" />2 公建
					<input type="checkbox" value="3" />3 厂房
					<input type="checkbox" value="4" />4 其他<br>
					<span>建筑节能执行标准</span><input type="text">
					<input type="checkbox" value="1" />50%
					<input type="checkbox" value="2" />65%
					<input type="checkbox" value="3" />其他
					<br>
					<span>绿色建筑</span><input type="text">㎡
					<input type="checkbox" value="1" />一星
					<input type="checkbox" value="2" />二星
					<input type="checkbox" value="3" />三星
					<br>
					<span>可再生能源建筑应用</span><br>
					<span>太阳能光热</span><input type="text">㎡<br>
					<span>太阳能光伏</span><input type="text">KW<br>
					<span>地源热泵</span><input type="text">㎡<br>
					<span>计划开工日期</span><input type="date"><br>
					<span>计划竣工日期</span><input type="date"><br>
					<h3>危险性较大工程</h3>
					<input type="checkbox" value="1" />深基坑
					<input type="checkbox" value="2" />高大模板
					<input type="checkbox" value="3" />30M以上高空作业
					<input type="checkbox" value="4" />爬架
					<input type="checkbox" value="5" />人货电梯
					<input type="checkbox" value="6" />塔吊
					<input type="checkbox" value="7" />其他
					<br>
					<span>周边环境</span>
					<input type="checkbox" value="1" />临近高压线
					<input type="checkbox" value="2" />临近居民区、商业区
					<input type="checkbox" value="2" />其他
					<br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>勘察单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>设计单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>监理单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>施工单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>安全生产许可证</span><input type="text"><br>
					<span>项目经理</span><input type="text"><br>
					<span>岗位证书</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<span>工地现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1万M2以内至少一人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1-5万M2以内至少二人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（5万M2以上至少三人）<br>
					<span>施工图审查单位</span><input type="text"><br>
					<span>工伤保险征收部门</span><input type="text"><br>
					<span>社保保单号</span><input type="text"><br>
					<span>保费金额</span><input type="text"><br>
					<h3>建设单位承诺</h3>
					<p>1、对本表所填内容真实性负责；</p>
					<p>2、不具备安全生产条件不施工，不对设计、施工、监理单位提出违反有关法律、法规和强制性标准的要求，不压缩合同约定的工期；</p>
					<p>3、认真落实质量通病防治导则、节能保温等工作要求；</p>
					<p>4、不肢解分包工程，对违法分包承担相应责任。</p>
					<span>建设单位代表</span><input type="text">（单位公章）<br>
					<h3>审查意见</h3>
					<input type="checkbox" value="1" />符  合
					<input type="checkbox" value="2" />不符合
					<br>
					<span>审查人</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<br>
					<span>监督机构</span><input type="text">
					<br>
					<span>联系电话</span><input type="text">
					<br>
					<span>监督注册号</span><input type="text">
					<br>
					<h3>报监意见</h3>
					<span>意见填写</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<span>（公 章）</span>
					<br>
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
							<td>
								<!--用来放预览图片的DIV-->
								 <div id="preview" style="width:320px;height:240px;display: none;"></div>
								 <!--一旦用户选择了图片文件，则触发上方的previewImage函数-->
	   	 						<input id="file1" type="file" name="file1" onchange="previewImage(this,320,240)" accept="image/*" />
   	 						</td>
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
				<!-- <div class="fuJianDiv">
					<h3>附件列表</h3>
					<span>文件1：</span><input type="file" name="file1" /><br> <span>文件2：</span><input
						type="file" name="file2" /><br> <span>文件3：</span><input type="file"
						name="file3" /><br> <span>文件4：</span><input type="file" name="file4" /><br>
					<span>文件5：</span><input type="file" name="file5" /><br> <span>文件6：</span><input
						type="file" name="file6" /><br> <span>文件7：</span><input type="file"
						name="file7" /><br> <span>文件8：</span><input type="file" name="file8" /><br>
					<span>文件9：</span><input type="file" name="file9" /><br>
				</div> -->
			</form>
			<br>
			<button id="submitButton2" class="GCButton">工程提交</button>
		</div>

		<div class="gc" id="zs">
			<h2 style="margin-left: 260px;">装饰工程质量安全报监表</h2>
			<form id="ZSGCForm3" name="ZSGCForm" action="ZSGCForm.do"
				method="post" enctype="multipart/form-data">
				<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
					name="type" type="hidden" value="装饰工程" />
				<div>
					<h3>工程概况</h3>
					<span>*工程名称</span><input id="装饰工程名称" name="engname" type="text"
						value="${requestScope.td.engname }" /> <br> <span>*工程地点</span><input
						id="装饰区" name="engpositionqu" type="text"
						value="${requestScope.td.engpositionqu }" />区<input id="路"
						name="engpositionlu" type="text"
						value="${requestScope.td.engpositionlu }" />路<input id="号"
						name="engpositionhao" type="text"
						value="${requestScope.td.engpositionhao }" />号 <br> <span>投资类别</span>
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
					<br> <span>预算造价</span><input id="预算造价" name="budgetcost" type="text"
						value="${requestScope.td.budgetcost }" />万元<br> <span>建筑面积</span><input
						id="建筑面积" name="buildarea" type="text"
						value="${requestScope.td.buildarea }" />㎡ <br> <span>*结构类型层次</span><input
						id="装饰结构类型" name="structuralevel" type="text"
						value="${requestScope.td.structuralevel }" /> <br> <span>每平方米造价</span><input
						id="预算造价" name="costmeter" type="text"
						value="${requestScope.td.costmeter }" />万元
						
						<span>基础类型</span><input type="text"><br>
					<span>工程类别</span><input type="text">
					<input type="checkbox" value="1" />1 住宅
					<input type="checkbox" value="2" />2 公建
					<input type="checkbox" value="3" />3 厂房
					<input type="checkbox" value="4" />4 其他<br>
					<span>建筑节能执行标准</span><input type="text">
					<input type="checkbox" value="1" />50%
					<input type="checkbox" value="2" />65%
					<input type="checkbox" value="3" />其他
					<br>
					<span>绿色建筑</span><input type="text">㎡
					<input type="checkbox" value="1" />一星
					<input type="checkbox" value="2" />二星
					<input type="checkbox" value="3" />三星
					<br>
					<span>可再生能源建筑应用</span><br>
					<span>太阳能光热</span><input type="text">㎡<br>
					<span>太阳能光伏</span><input type="text">KW<br>
					<span>地源热泵</span><input type="text">㎡<br>
					<span>计划开工日期</span><input type="date"><br>
					<span>计划竣工日期</span><input type="date"><br>
					<h3>危险性较大工程</h3>
					<input type="checkbox" value="1" />深基坑
					<input type="checkbox" value="2" />高大模板
					<input type="checkbox" value="3" />30M以上高空作业
					<input type="checkbox" value="4" />爬架
					<input type="checkbox" value="5" />人货电梯
					<input type="checkbox" value="6" />塔吊
					<input type="checkbox" value="7" />其他
					<br>
					<span>周边环境</span>
					<input type="checkbox" value="1" />临近高压线
					<input type="checkbox" value="2" />临近居民区、商业区
					<input type="checkbox" value="2" />其他
					<br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>勘察单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>设计单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>监理单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>执业资格及证书</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<h3>施工单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>安全生产许可证</span><input type="text"><br>
					<span>项目经理</span><input type="text"><br>
					<span>岗位证书</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<span>工地现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1万M2以内至少一人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（1-5万M2以内至少二人）<br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text">（5万M2以上至少三人）<br>
					<span>施工图审查单位</span><input type="text"><br>
					<span>工伤保险征收部门</span><input type="text"><br>
					<span>社保保单号</span><input type="text"><br>
					<span>保费金额</span><input type="text"><br>
					<h3>建设单位承诺</h3>
					<p>1、对本表所填内容真实性负责；</p>
					<p>2、不具备安全生产条件不施工，不对设计、施工、监理单位提出违反有关法律、法规和强制性标准的要求，不压缩合同约定的工期；</p>
					<p>3、认真落实质量通病防治导则、节能保温等工作要求；</p>
					<p>4、不肢解分包工程，对违法分包承担相应责任。</p>
					<span>建设单位代表</span><input type="text">（单位公章）<br>
					<h3>审查意见</h3>
					<input type="checkbox" value="1" />符  合
					<input type="checkbox" value="2" />不符合
					<br>
					<span>审查人</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<br>
					<span>监督机构</span><input type="text">
					<br>
					<span>联系电话</span><input type="text">
					<br>
					<span>监督注册号</span><input type="text">
					<br>
					<h3>报监意见</h3>
					<span>意见填写</span><input type="text">
					<br>
					<span>日期</span><input type="date">
					<span>（公 章）</span>
					<br>
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
							<td>房产证或房屋租赁协议</td>
							<td><input type="file" name="file1" /></td>
						</tr>
						<tr>
							<td>产权单位同意装修的证明材料</td>
							<td><input type="file" name="file2" /></td>
						</tr>
						<tr>
							<td>审图资料</td>
							<td><input type="file" name="file3" /></td>
						</tr>
						<tr>
							<td>规划部门意见</td>
							<td><input type="file" name="file4" /></td>
						</tr>
						<tr>
							<td>施工合同</td>
							<td><input type="file" name="file5" /></td>
						</tr>
						<tr>
							<td>施工单位资质证书</td>
							<td><input type="file" name="file6" /></td>
						</tr>
						<tr>
							<td>五大员证书</td>
							<td><input type="file" name="file7" /></td>
						</tr>
						<tr>
							<td>工伤保险</td>
							<td><input type="file" name="file8" /></td>
						</tr>
						<tr>
							<td>居地意见</td>
							<td><input type="file" name="file9" /></td>
						</tr>
					</table>
				</div>
			</form>
			<br>
			<button id="submitButton3" class="GCButton">工程提交</button>
		</div>

		<div class="gc" id="cc">
			<h2 style="margin-left: 260px;">拆除模板</h2>
			<form id="ZSGCForm3" name="ZSGCForm" action="ZSGCForm.do"
				method="post" enctype="multipart/form-data">
				<input name="id" value="${requestScope.td.id }" type="hidden" /> <input
					name="type" type="hidden" value="装饰工程" />
				<div>
					<h3>工程概况</h3>
					<span>*工程名称</span> <input id="工程名称" name="engname" type="text"
						value="${requestScope.td.engname }" /> <br> <span>*工程地点</span><input
						id="区" name="engpositionqu" type="text"
						value="${requestScope.td.engpositionqu }" /><br> <span>拆除面积</span><input
						type="text" /><br> <span>结构层次</span><input type="text" /><br>
					<span>危险性较大工程</span><input type="radio" name="danger"><span>是</span><input
						type="radio" name="danger"><span>否</span><br> <span>周边环境</span>
					<c:if test="${requestScope.td.cateofinves==null }">
						<input name="cateofinves" type="checkbox" value="1" />临近高压线
							<input name="cateofinves" type="checkbox" value="2" />临近居民、商业
							<input name="cateofinves" type="checkbox" value="3" />其他
					</c:if>
					<c:if test="${requestScope.td.cateofinves!=null }">
						<c:set var="cateofinves" value="${requestScope.td.cateofinves }" />
						<c:choose>
							<c:when test="${fn:contains(cateofinves, '1')}">
								<input name="cateofinves" type="checkbox" checked="checked"
									value="1" />临近高压线
								</c:when>
							<c:otherwise>
								<input name="cateofinves" type="checkbox" value="1" />临近高压线
								</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${fn:contains(cateofinves, '2')}">
								<input name="cateofinves" type="checkbox" checked="checked"
									value="2" />临近居民、商业
								</c:when>
							<c:otherwise>
								<input name="cateofinves" type="checkbox" value="2" />临近居民、商业
								</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${fn:contains(cateofinves, '3')}">
								<input name="cateofinves" type="checkbox" checked="checked"
									value="3" />其他
								</c:when>
							<c:otherwise>
								<input name="cateofinves" type="checkbox" value="3" />其他
								</c:otherwise>
						</c:choose>
					</c:if>
					<br> <span>拟采用的拆除方式</span> <input type="radio"><span>机械</span>
					<input type="radio"><span>爆破</span> <br> <span>计划开工日期</span><input
						type="date"> <br> <span>计划竣工日期</span><input
						type="date">
					<br>
					<h3>建设单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>属  地</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					
					<h3>监理单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级及证书</span><input type="text"><br>
					<span>项目总监</span><input type="text"><br>
					<span>职业资格及证书	</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					
					<h3>拆除单位</h3>
					<span>单位名称</span><input type="text"><br>
					<span>资质等级或备案</span><input type="text"><br>
					<span>安全生产许可证号</span><input type="text"><br>
					<span>项目负责人</span><input type="text"><br>
					<span>岗位证书</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					<span>联系电话</span><input type="text"><br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					<span>现场专职安全员</span><input type="text"><br>
					<span>安全考核证号</span><input type="text"><br>
					
					<h3>报监资料</h3>
					<input type="checkbox"><span>拆除单位资质证书（或登记备案证书）及复印件</span>
					<input type="checkbox"><span>房屋拆除委托合同</span>
					<input type="checkbox"><span>保证金缴纳凭证</span>
					
					<h3>审查依据</h3>
					<p>1、《建设工程安全生产管理条例》（国务院第393号令）</p>
					<p>2、关于印发《关于进一步明确全市建筑拆除施工安全生产职责的意见》的通知（合安办[2009]41号）</p>
					<p>3、《关于进一步较强庐阳区建设领域安全生产工程的通知》（庐安[2013]3号）</p>
					<p>4、《关于进一步加强庐阳区拆除施工安全管理工作的通知》（庐住建[2014]1号）</p>
					
					<h3>审查意见</h3>
					<span>符  合</span><input type="checkbox"><br>
					<span>不符合</span><input type="checkbox"><br>
					<span>审查人</span><input type="text"><br>
					
					<span>监督机构:庐阳区建设工程质量安全监督站</span><br>
					<span>联系电话:0551-65850756</span><br>
					<span>监督注册号</span><input type="text">
					
					<h3>报监意见</h3>
					<span>意见</span><input type="text"><br>
					<span>日期</span><input type="date">
				</div>
			</form>
			<br>
			<button id="submitButton4" class="GCButton">工程提交</button>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#gcSel").change(function() {
				$(".gc").hide();
				var gcSel = $("#gcSel").val();
				switch (gcSel) {
				case '房建工程':
					$("#fj").show();
					break;
				case '市政工程':
					$("#sz").show();
					break;
				case '装饰工程':
					$("#zs").show();
					break;
				case '拆除工程':
					$("#cc").show();
					break;
				default:
					break;
				}
			});
			
			$("#file1").click(function(){
				$("#preview").show();
			});
			
			$(".GCButton").click(function() {
				var id = $(this).attr("id");
				if (id == 'submitButton1') {
					$("#ZSGCForm1").submit();
				} else if (id == 'submitButton2') {
					$("#ZSGCForm2").submit();
				} else if (id == 'submitButton3') {
					var name=$("#装饰工程名称").val();
					var location=$("#装饰区").val();
					var type=$("#装饰结构类型").val();
					/* alert("name"+name);
					alert("location"+location);
					alert("type"+type); */
					if (!name || !location || !type) {
						alert("请将信息填写完整");
					}else {
						$("#ZSGCForm3").submit();
					}
				} else if (id == 'submitButton4') {
					$("#ZSGCForm4").submit();
				}
			});
		});
	</script>
</body>
</html>