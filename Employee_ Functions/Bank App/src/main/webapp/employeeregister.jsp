<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>EmpReg</title>
</head>
 <script>
 function cancel(){
		document.forms[0].action = "LogOutServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
 
 function Register(){
		console.log("i am here lol")
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

 <div align="center">
  <h1>Employee Registration</h1>
  <form>
 
   <table style="with: 80%">
   
	<tr>
     <td>Name</td>
     <td><input type="text" name="name" id="name" required></td>
    </tr>
    <tr>
     <td>Username</td>
     <td><input type="text" name="username" id="username" required></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password1" id="password1" required></td>
    </tr>
    <tr>
     <td>Confirm Password</td>
     <td><input type="password" name="password2" id="password2" required></td>
    </tr>
  		
   </table>
   <input type="submit" onclick ="cancel()" value="Cancel" />
   <input type="submit" onclick ="Register()" value="Register" />

  </form>
 </div>
</body>
</html>