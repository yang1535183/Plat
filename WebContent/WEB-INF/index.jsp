<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>建设监管平台</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
.layui-footer {
	text-align: center;
}

.layui-nav-child {
	padding-left: 20px;
}
</style>
<script type="text/javascript" src=" js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src=" pageoffice.js" id="po_js_main"></script>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo" style="width: 300px">庐阳区住建局质安管理信息化平台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<!-- <ul class="layui-nav layui-layout-left">
				<li class="topTab layui-nav-item"><a href="#">建筑工程</a></li>
				<li class="topTab layui-nav-item"><a href="#">市政工程</a></li>
				<li class="topTab layui-nav-item"><a href="#">装修工程</a></li>
				<li class="topTab layui-nav-item"><a href="#">拆除工程</a></li>
			</ul> -->
			<ul class="layui-nav layui-layout-right">
				<c:if test="${sessionScope.user!=null }">
					<li class="layui-nav-item"><a href="javascript:;"> <img
							src="img/Logo.png" class="layui-nav-img">
							${sessionScope.user.name }
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="myIndex.do" target="ifr">基本资料</a>
							</dd>
							<dd>
								<a href="safe.do" target="ifr">安全设置</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="loginOut.do">退出</a></li>
				</c:if>
				<c:if test="${sessionScope.user==null }">
					<li class="layui-nav-item"><a href="javascript:;"> <img
							src="http://t.cn/RCzsdCq" class="layui-nav-img"> 你好，游客！
					</a></li>
					<li class="layui-nav-item"><a href="login.do">登录</a></li>
				</c:if>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
				<li class="layui-nav-item"><a class="" href="ToDo.do" target="ifr">待办事宜</a></li>
					<li class="layui-nav-item"><a class="" href="javascript:;">质量安全报监</a>
						<dl class="layui-nav-child">
							<c:if test="${sessionScope.user.identify==1 }">
								<dd>
									<a href="GCSB.do" target="ifr">工程上报</a>
								</dd>
							</c:if>
							<dd>
								<a href="GCList.do" target="ifr">查看工程</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a class="" href="javascript:;">工程合同备案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="GCListByTypeAndState.do?type=房建工程&state=审批通过"
									target="ifr">房建工程</a>
							</dd>
							<dd>
								<a href="GCListByTypeAndState.do?type=市政工程&state=审批通过"
									target="ifr">市政工程</a>
							</dd>
							<dd>
								<a href="GCListByTypeAndState.do?type=装饰工程&state=审批通过"
									target="ifr">装饰工程</a>
							</dd>
							<dd>
								<a href="GCListByTypeAndState.do?type=拆除工程&state=审批通过"
									target="ifr">拆除工程</a>
							</dd>
							<!-- <dd>
								<a href="contract.do" target="ifr">总合同</a>
							</dd>
							<dd>
								<a href="javascript:POBrowser.openWindowModeless('contract.jsp', 'width=1050px;height=900px;');">Word</a>
							</dd>
							<dd>
								<a href="downFiles.do?filename=房建工程合同模板.doc&path=doc" target="ifr">合同模板下载</a>
							</dd> -->
							<!-- <dd>
								<a href="hTSB.do" target="ifr">合同上报</a>
							</dd>
							<dd>
								<a href="downFile.do" target="ifr">模板合同下载</a>
							</dd>
							<dd>
								<a href="welcome.do?name=分合同" target="ifr">分合同</a>
							</dd>
							<dd>
								<a href="welcome.do?name=监理合同" target="ifr">监理合同</a>
							</dd>
							<dd>
								<a href="welcome.do?name=设备(联合体招标)" target="ifr">设备(联合体招标)</a>
							</dd> -->
						</dl></li>
					<li class="layui-nav-item layui-this"><a href="http://101.132.193.250:30002/regulatory/lypcinfo.html?lv=${sessionScope.user.company }" target="ifr">工程监管</a>
						<!-- <dl class="layui-nav-child">
							<dd>
								<a href="welcome.do?name=质量监管" target="ifr">质量监管</a>
							</dd>
							<dd>
								<a href="welcome.do?name=安全监管" target="ifr">安全监管</a>
							</dd>
							<dd>
								<a href="welcome.do?name=市场行为" target="ifr">市场行为</a>
							</dd>
							<dd>
								<a href="welcome.do?name=农民工管理" target="ifr">农民工管理</a>
							</dd>
							<dd>
								<a href="welcome.do?name=监控" target="ifr">监控</a>
							</dd>
							<dd>
								<a href="welcome.do?name=工程验收" target="ifr">工程验收</a>
							</dd>
							<dd>
								<a href="welcome.do?name=工程资料" target="ifr">工程资料</a>
							</dd>
							<dd>
								<a href="welcome.do?name=工伤保险" target="ifr">工伤保险</a>
							</dd>
							<dd>
								<a href="welcome.do?name=质量奖" target="ifr">质量奖</a>
							</dd>
							<dd>
								<a href="welcome.do?name=安全奖" target="ifr">安全奖</a>
							</dd>
						</dl> -->
					</li>
					<li class="layui-nav-item"><a class="" href="javascript:;">混凝土与燃气企业监管</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="welcome.do?name=混凝土企业" target="ifr">混凝土企业</a>
							</dd>
							<dd>
								<a href="welcome.do?name=燃气企业" target="ifr">燃气企业</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a class="" href="javascript:;">混凝土与施工现场监控</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="http://main.diiwon.com/dist/build/" target="ifr">混凝土监控</a>
							</dd>
							<dd>
								<a href="http://101.132.193.250:30002/监控/监控.html" target="ifr">现场监控</a>
							</dd>
						</dl></li>
					<c:choose>
						<c:when test="${sessionScope.user.identify==0 }">
							<li class="layui-nav-item"><a class=""
								href="http://101.132.193.250:30002/enterprise/basicInformationList.html"
								target="ifr">承建企业信息管理</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.user.code==null }">
									<li class="layui-nav-item"><a class=""
										href="http://101.132.193.250:30002/enterprise/basicInformationList.html"
										target="ifr">承建企业信息管理</a></li>
								</c:when>
								<c:otherwise>
									<li class="layui-nav-item"><a class=""
										href="http://101.132.193.250:30002/enterprise/basicInformation.html?code=${sessionScope.user.code }"
										target="ifr">承建企业信息管理</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
					<li class="layui-nav-item">
						<a class="" href="CompanyList.do" target="ifr">企业项目一览</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe name="ifr" src="http://101.132.193.250:30002/regulatory/lypcinfo.html?lv=${sessionScope.user.company }" frameborder="no" border="0" marginwidth="0"
				marginheight="0" scrolling="yes" allowtransparency="yes"
				style="width: 100%; height: 100%;"> </iframe>
		</div>

		<!-- <div class="layui-footer">
			底部固定区域
			© 安徽迪万科技有限公司
		</div> -->
	</div>
	<script src="layui/layui.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});

		$(".topTab").click(function() {
			$(".topTab").css({
				"background" : "RGB(35,38,46)"
			});
			$(this).css({
				"background" : "RGB(0,150,136)"
			});
		});
	</script>
</body>

</html>