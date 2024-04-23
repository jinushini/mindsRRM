<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>微波所数字化服务平台-请登录</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/structure.css">
<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
</head>
<body>
	<div class="login_title">
		<p>微波所数字化服务平台</p>
		<p class="English">Microwave Institute Integrated Digital Services</p>
	</div>

	<form action="pages/system/login!login.action" method="post"
		class="box login">
		<fieldset class="boxBody">
			<label>用户名</label> 
			<input type="text" tabindex="1" name="loginName" placeholder="请输入用户名（与内网用户名保持一致）" required> 
			<label><a href="#" class="rLink" tabindex="5">忘记密码? </a>密码</label> 
			<input type="password" name="password" tabindex="2" required>
		</fieldset>
		<footer>
			<label><input type="checkbox" tabindex="3">保持登录</label> 
			<input type="submit" class="btnLogin" value="登录" tabindex="4">
		</footer>
	</form>
	<footer id="main">
		<a href="#">西安分院微波所版权所有</a> | <a href="#">&copy;2017</a>
	</footer>
</body>
</html>