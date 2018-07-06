<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input id="btnPrint" type="button" value="打印"
		onclick="javascript:window.print();" />

	<input id="btnPrint" type="button" value="打印预览" onclick=preview(1) />
	<style type="text/css" media=print>
.noprint {
	display: none
}
</style>
	<script>
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
	<!--startprint1-->
	<!--endprint1-->
</body>
</html>