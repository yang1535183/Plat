<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业注册</title>
</head>
<body>
	<div>
		<form action="register.do" method="post">
			企业名：<input type="text" name="name"><br>
			联系方式：<input type="text" name="phone"><br>
			密码：<input type="password" name="pwd"><br>
			确认密码：<input type="password"><br>
			公司名：<input type="text" name="company"><br>
			公司位置：<input type="text" name="position"><br>
			企业承建码：<input type="text" name="code"><br>
			<input type="submit" value="注册">
		</form>
	</div>
</body>
</html>