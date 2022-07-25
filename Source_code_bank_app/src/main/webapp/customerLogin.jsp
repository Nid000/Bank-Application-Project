<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background:
		url('https://images.unsplash.com/photo-1501167786227-4cba60f6d58f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
		no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}

.logo {
	width: 213px;
	height: 36px;
	background: url('http://i.imgur.com/fd8Lcso.png') no-repeat;
	margin: 30px auto;
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
	padding: 0 20px 0 50px;
	outline: none;
}

.login-block input#username {
	background: #fff
		url('https://www.logolynx.com/images/logolynx/03/035700704195450d2a80ac8f56f70313.jpeg')
		20px top no-repeat;
	background-size: 16px 80px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'>
	<form action="cusLogin" method="post">

		<div class="logo"></div>
		<div class="login-block">
			<h1>Login</h1>
			<h1>${message1}</h1>

			<input type="text" placeholder="Username" name="username"> <input
				type="password" placeholder="Password" name="password1"> <input
				type="submit" name="submit" value="login">

		</div>
	</form>
</body>
</html>