<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		console.log("i am here lol")
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
 <div align="center">
  <h1>Employee Login </h1>
<form>  

   <table style="with: 80%">
  
	<tr>
     <td>Username</td>
     <td><input type="text" name="username" id="username" required/></td>
	</tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password1" id="password1" required/></td>
    </tr>
	
	</table>
	 ${message1 }
	 <br>
	  <button type="submitb"  name = "submitb" onclick = "Login()" value="Login" >Login</button>
	 <input type="submit" onclick = "Register()" value="Registration" />
 
  </form>
 </div>
</body>
</html>