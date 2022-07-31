<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731612.jpg')
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


.fcc-btn {
  background-color:#34495E;
  color: white;
  padding: 15px 25px;
  text-decoration: none;
}
</style>

<meta charset="UTF-8">
<title>Login</title>
</head>
<script>
 function Register(){
		document.forms[0].action = "EmpRegServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
 function Login(){
		try{
		var username = document.getElementById("username").value;
		var password1 = document.getElementById("password1").value;
		var submitb = document.getElementById("submitb").value;
	
		console.log(username);
		console.log(password1);
		
		
		if(!username){
			console.log(username);
			alert('Please enter the name');
			return false;
		}	
		if(!password1){
			console.log(password1);
			alert('Please enter the password');
			return false;	
		}
		}
		catch(e){
			console.log(e);
		}
		document.forms[0].action= "LoginServlet";
		document.forms[0].method= 'post';
		document.forms[0].submit();
		}
 
 </script>
<body>
	<br>
	<div align="right">
		<a class="fcc-btn" href="customerLogin.jsp">Customer Login</a>
	</div>

	<form>

	
		
		<div class="login-block">
		<h1 align="center">Employee Login</h1>
		<p style="color:red;"> ${message1 }</p>
		<p style="color:red;"> ${register}</p>
		<input type="text" placeholder="Username" name="username"
				id="username" ><input type="password"
				placeholder="Password" name="password1" id="password1"> <br>
		<input type="submit" name="submitb" id="submitb" onclick="Login()"
				value="Login"><br>
				<a class="fcc-btn" href="employeeregister.jsp">Employee Register</a>
		</div>
	</form>
</body>
</html>