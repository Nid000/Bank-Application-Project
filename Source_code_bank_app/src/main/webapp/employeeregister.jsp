<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Employee Registration</title>
</head>
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

 <script>
 
 function Register(){
		try{
		var name = document.getElementById("name").value;
		var username = document.getElementById("username").value;
		var password1 = document.getElementById("password1").value;
		var password2 = document.getElementById("password2").value;
		
		console.log(name);
		console.log(username);
		console.log(password1);
		console.log(password2);
		
		if(!name){
			console.log(name);
			alert('Please enter the name');
			return false;
		}
		if(!username){
			console.log(username);
			alert('Please enter the username');
			return false;
		}
			
		if(!password1){
			console.log(password1);
			alert('Please enter the password');
			return false;	
		}
		if(!password2){
			console.log(password2);
			alert('Confirm the entered password');
			return false;
		}
		}
 
		catch(e){
			console.log(e);
		}
		document.forms[0].action= "register";
		document.forms[0].method= 'post';
		document.forms[0].submit();
		}
 </script>
 
<body>
<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'>
<form>
	<div align="right">
		<a class="fcc-btn" href="customerLogin.jsp">Customer Login</a>
	</div>
  
 <div class="login-block">
 <h1>Employee Registration</h1>
 <p style="color:red;">${mismatch}</p>

    Name
     <input type="text" name="name" id="name"  value="${name}">
    
    
    Username
     <input type="text" name="username" id="username" value="${username}" required>
   
     Password
     <input type="password" name="password1" id="password1" required>
  
    Confirm Password
     <input type="password" name="password2" id="password2" required>

  		
 
    <input type="submit" onclick ="Register()" value="Register" />
  <a type = button class="fcc-btn" href="employeeLogin.jsp">Cancel</a>
   </div>

  </form>

</body>
</html>