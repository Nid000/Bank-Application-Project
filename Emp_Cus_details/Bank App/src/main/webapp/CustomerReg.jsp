<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Customer</title>
</head>
<body>
<div align="center">
	<form action="<%= request.getContextPath() %>/CusServlet" method="post">
 <h1>Register New Account  </h1>
 
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
    <tr>
     <td>Re-Type Password</td>
     <td><input type="password" name="password2" /></td>
    </tr>
    <tr>
     <td>Account Number</td>
     <td><input type="text" name="account_number" /></td>
    </tr>
    <tr>
     <td>Initial Deposit</td>
     <td><input type="text" name="bank_balance" /></td>
    </tr>
    <tr>
     <td>Annual Income</td>
     <td><input type="text" name="annual_income" /></td>
    </tr>
 
 
 
 </table>
 
   <input type="submit" value="Cancel" />
   <input type="submit" value="Register" />
   
	</form>
</div>

</body>
</html>