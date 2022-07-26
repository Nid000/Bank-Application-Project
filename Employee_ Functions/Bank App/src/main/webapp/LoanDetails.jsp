<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "bankapplication";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		body
		{
		    counter-reset: Serial;          
		}


		tr td:first-child:before
		{
		  counter-increment: Serial;      
		  content: counter(Serial); 
		}
	</style>
</head>
<head>

<script>
	function Logout(){
		document.forms[0].action = "LogOutServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}	
	function cusdet(){
		document.forms[0].action = "CusDetailsServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function GoHome(){
		document.forms[0].action = "EmpHomeServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function LoanDelete( account_number, loan_acc_number, l_amount, l_paid, l_balance) {
		try {
				
			document.forms[0].ACCOUNT_NUMBER.value = account_number;
			document.forms[0].LOAN_ACC_NUMBER.value = loan_acc_number;
			document.forms[0].L_AMOUNT.value = l_amount;
			document.forms[0].L_PAID.value = l_paid;				
			document.forms[0].L_BALANCE.value = l_balance;
			
			document.forms[0].action = "LonDetDelServlet";
			document.forms[0].method = 'post';
			document.forms[0].submit();
			} catch (e) {
				console.log(e);
			}
		}
		
		function LoanUpdate( account_number, loan_acc_number, l_amount, l_paid, l_balance) {
			try {
				
			document.forms[0].ACCOUNT_NUMBER.value = account_number;
			document.forms[0].LOAN_ACC_NUMBER.value = loan_acc_number;
			document.forms[0].L_AMOUNT.value = l_amount;				
			document.forms[0].L_PAID.value = l_paid;
			document.forms[0].L_BALANCE.value = l_balance;
			
			document.forms[0].action = "LonDetUpdServlet";				
			document.forms[0].method = 'post';
			document.forms[0].submit();
			} catch (e) {
				console.log(e);
			}
		}
	
</script>
<meta charset="UTF-8">
<title>LoanDetails</title>
</head>
<body>
<div align="center">
<h1>LOAN DETAILS </h1>

<form>
<div align="right">
	<button type="button" onclick= "Logout()">Logout</button>
 </div>
 
<div align = "left">
<td><button type="button" onclick= "cusdet()">See Customer Details</button></td>
<td><button type="button" onclick= "GoHome()">Go Home</button></td><br><br>
</div>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<th><b>SN</b></<th>
<th><b>ACCOUNT NUMBER</b></th>
<th><b>LOAN ACCOUNT NUMBER</b></th>
<th><b>LOAN AMOUNT</b></th>
<th><b>PAID LOAN AMOUNT</b></th>
<th><b>LOAN BALANCE</b></th>

</tr>

<%

try{ 
	connection = DriverManager.getConnection(connectionUrl+ dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM bankapplication.loan_accounts";

	resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	%>
	<tr bgcolor="#DEB887">
	<td></td>
	<td><%=resultSet.getInt("ACCOUNT_NUMBER") %></td>
	<td><%=resultSet.getString("LOAN_ACC_NUMBER") %></td>
	<td><%=resultSet.getInt("L_AMOUNT") %></td>
	<td><%=resultSet.getInt("L_PAID") %></td>  
	<td><%=resultSet.getInt("L_BALANCE") %></td>    
	
	<td><button type="Submit" onclick="LoanUpdate(
	'<%=resultSet.getInt("ACCOUNT_NUMBER") %>',
	'<%=resultSet.getString("LOAN_ACC_NUMBER") %>',
	'<%=resultSet.getInt("L_AMOUNT") %>',
	'<%=resultSet.getInt("L_PAID") %>',
	'<%=resultSet.getInt("L_BALANCE") %>')">Update</button></td>
	
	<td><button type="Submit" onclick="LoanDelete(
	'<%=resultSet.getInt("ACCOUNT_NUMBER") %>',
	'<%=resultSet.getString("LOAN_ACC_NUMBER") %>',
	'<%=resultSet.getInt("L_AMOUNT") %>',
	'<%=resultSet.getInt("L_PAID") %>',
	'<%=resultSet.getInt("L_BALANCE") %>')">Delete Record</button></td>
</tr>
	
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>



</table>
<input type="hidden" id="ACCOUNT_NUMBER"name="ACCOUNT_NUMBER">
<input type="hidden" id="LOAN_ACC_NUMBER" name="LOAN_ACC_NUMBER"> 
<input type="hidden" id="L_AMOUNT" name="L_AMOUNT">
<input type="hidden" id="L_PAID" name="L_PAID">
<input type="hidden" id="L_BALANCE"name="L_BALANCE">

</form>
</div>
</body>
</html>