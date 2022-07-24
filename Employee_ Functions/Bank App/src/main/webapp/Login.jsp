<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
 <div align="center">
  <h1>Employee Login </h1>
  <form action="LoginServlet" method="post">
  
  
   <table style="with: 80%">
  
	<tr>
     <td>Username</td>
     <td><input type="text" name="username" /></td>
	</tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password1" /></td>
    </tr>
	
	<tr>
	 <td><input type="submit" name="submit" value="login"></td>
	 <td><a href="employeeregister.jsp">Registration</a>
	</tr>
	
	</table>
  </form>
 </div>
</body>
</html>