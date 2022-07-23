<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@page import = "net.javaguides.registration.model.Customer" %>
<%@page import = "java.util.ArrayList" %>


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

<!DOCTYPE html  >
<html>
<head>

<script>
//	function cancel(){
//	window.open("Home.jsp")
//	}
	
	function Transaction_History(){
		document.forms[0].action = "TransactionHisServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	
	function Loan_Details(){
	window.open("LoanDetails.jsp")
	}
	
	function Update(id, name, acc_num, bank_bal, username, password, tot_lon, ann_incm) {
		try {
			document.forms[0].ID.value = id;
			document.forms[0].NAME.value = name;
			document.forms[0].ACCOUNT_NUMBER.value = acc_num;
			document.forms[0].BANK_BALANCE.value = bank_bal;
			document.forms[0].USERNAME.value = username;
			document.forms[0].PASSWORD.value = password;
			document.forms[0].TOTAL_LOANS.value = tot_lon;
			document.forms[0].ANNUAL_INCOME.value = ann_incm;
			
			document.forms[0].action = "UpdateServlet";
			document.forms[0].method = 'post';
			document.forms[0].submit();
		} catch (e) {
			console.log(e);
		}
	}
		
		function Delete(id, name, acc_num, bank_bal, username, password, tot_lon, ann_incm) {
			try {
				document.forms[0].ID.value = id;
				document.forms[0].NAME.value = name;
				document.forms[0].ACCOUNT_NUMBER.value = acc_num;
				document.forms[0].BANK_BALANCE.value = bank_bal;
				document.forms[0].USERNAME.value = username;
				document.forms[0].PASSWORD.value = password;
				document.forms[0].TOTAL_LOANS.value = tot_lon;
				document.forms[0].ANNUAL_INCOME.value = ann_incm;
				
				document.forms[0].action = "DeleteServlet";
				document.forms[0].method = 'post';
				document.forms[0].submit();
			} catch (e) {
				console.log(e);
			}
		}
	
</script>

<meta charset="UTF-8">
<title> Customer Details</title>
</head>
<body>
<form>
<h1 align="center"><font><strong>Customer Details</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>ID</b></td>
<td><b>NAME</b></td>
<td><b>ACCOUNT NUMBER</b></td>
<td><b>BANK BALANCE</b></td>
<td><b>USERNAME</b></td>
<td><b>PASSWORD</b></td>
<td><b>TOTAL LOANS</b></td>
<td><b>ANNUAL INCOME</b></td>
<td><b>TRANSACTION HISTORY</b></td>
<td><b>LOAN DETAILS</b></td>
<td><b>UPDATE DETAILS</b></td>
<td><b>DELETE</b></td>

</tr>

<%

try{ 
	connection = DriverManager.getConnection(connectionUrl+ dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM bankapplication.bank_customers";

	resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	%>
	<tr bgcolor="#DEB887">
	<td><%=resultSet.getString("ID") %></td>
	<td><%=resultSet.getString("NAME") %></td>
	<td><%=resultSet.getString("ACCOUNT_NUMBER") %></td>
	<td><%=resultSet.getString("BANK_BALANCE") %></td>
	<td><%=resultSet.getString("USERNAME") %></td>
	<td><%=resultSet.getString("PASSWORD") %></td>
	<td><%=resultSet.getString("TOTAL_LOANS") %></td>
	<td><%=resultSet.getString("ANNUAL_INCOME") %></td>
	<td><button type="button" onclick="Transaction_History()">Transaction History</button></td>
	<td><button type="button" onclick= "Loan_Details()">Loan Details</button></td>
	
	<td><button type="button" onclick="Update('<%=resultSet.getString("ID") %>',
	'<%=resultSet.getString("NAME") %>',
	'<%=resultSet.getString("ACCOUNT_NUMBER") %>',
	'<%=resultSet.getString("BANK_BALANCE") %>',
	'<%=resultSet.getString("USERNAME") %>',
	'<%=resultSet.getString("PASSWORD") %>',
	'<%=resultSet.getString("TOTAL_LOANS") %>',
	'<%=resultSet.getString("ANNUAL_INCOME") %>')">Update</button></td>
	
	<td><button type="Submit" onclick="Delete('<%=resultSet.getString("ID") %>',
	'<%=resultSet.getString("NAME") %>',
	'<%=resultSet.getString("ACCOUNT_NUMBER") %>',
	'<%=resultSet.getString("BANK_BALANCE") %>',
	'<%=resultSet.getString("USERNAME") %>',
	'<%=resultSet.getString("PASSWORD") %>',
	'<%=resultSet.getString("TOTAL_LOANS") %>',
	'<%=resultSet.getString("ANNUAL_INCOME") %>')"
	>Delete</button></td>
	
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

<input type="hidden" id="ID" name="ID"> 
<input type="hidden" id="NAME" name="NAME">
<input type="hidden" id="ACCOUNT_NUMBER" name="ACCOUNT_NUMBER">
<input type="hidden" id="BANK_BALANCE"name="BANK_BALANCE">
<input type="hidden" id="USERNAME" name="USERNAME"> 
<input type="hidden" id="PASSWORD" name="PASSWORD">
<input type="hidden" id="TOTAL_LOANS" name="TOTAL_LOANS">
<input type="hidden" id="ANNUAL_INCOME"name="ANNUAL_INCOME">
</form>
</body>
</html>