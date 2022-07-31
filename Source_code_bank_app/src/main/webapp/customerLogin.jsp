<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731622.jpg')
		no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}
.login-block {
	width: 320px;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	border-top: 5px solid #ff656c;
	margin: 0 auto;
}

.login-block h1 {
	text-align: center;
	color: #000;
	font-size: 18px;
	text-transform: uppercase;
	margin-top: 0;
	margin-bottom: 20px;
}

.login-block input {
	width: 100%;
	height: 42px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
	font-size: 14px;
	font-family: Montserrat;
	outline: none;
}

.login-block input#username {
	background: #fff
		url('https://www.logolynx.com/images/logolynx/03/035700704195450d2a80ac8f56f70313.jpeg')
		20px top no-repeat;
	background-size: 16px 80px;
}
.fcc-btn {
  background-color:#34495E;
  color: white;
  padding: 15px 25px;
  text-decoration: none;
}
</style>
<meta charset="UTF-8">
<title>Customer Login Page</title>
</head>
<body>
<br>
<div align="right">  <a class="fcc-btn" href="employeeLogin.jsp">Employee Login</a> </div>
 	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'> 
<form action="cusLogin" method="post">

		<h1 style="color:#FDFEFE" align="center">Welcome To Online Banking</h1>

		 <div class="login-block">
			<h1>Customer Login</h1>
			<p style="color:red;">${message1}</p>
			<p style="color:red;">${logout}</p>
		<input type="text" placeholder="Username" name="username"> <input
				type="password" placeholder="Password" name="password1"> <input
				type="submit" name="submit" value="login">
				

		</div> 
	</form>
</body>
</html>