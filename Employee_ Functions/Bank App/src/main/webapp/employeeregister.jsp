<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
  <h1>Employee Registration</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
  

   <table style="with: 80%">
   
	<tr>
     <td>Name</td>
     <td><input type="text" name="name" /></td>
    </tr>
    <tr>
     <td>Username</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password1" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password2" /></td>
    </tr>
    
	
  
   </table>
   <input type="submit" value="Register" />
  </form>
 </div>
</body>
</html>