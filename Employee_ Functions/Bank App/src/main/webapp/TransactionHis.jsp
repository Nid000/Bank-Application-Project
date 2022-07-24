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
		function TransDelete( date, acc_from, acc_to, amount) {
			try {
				
				document.forms[0].DATE.value = date;
				document.forms[0].ACC_FROM.value = acc_from;
				document.forms[0].ACC_TO.value = acc_to;
				document.forms[0].AMOUNT.value = amount;
				
				document.forms[0].action = "TransDeleteServlet";
				document.forms[0].method = 'post';
				document.forms[0].submit();
			} catch (e) {
				console.log(e);
			}
		}
	
</script>
<meta charset="UTF-8">
<title>Transactionhistory</title>
</head>
<body>
<div align="center">
<h1>TRANSACTION HISTORY </h1>
<form>
<div align="left">
<td><button type="button" onclick= "cusdet()">See Customer Details</button></td>
<td><button type="button" onclick= "GoHome()">Go Home</button></td><br><br>
</div>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">

<th><b>SN</b></th>
<th><b>DATE</b></th>
<th><b>FROM ACCOUNT</b></th>
<th><b>TO ACCOUNT</b></th>
<th><b>AMOUNT</b></th>
</tr>

<%

try{ 
	connection = DriverManager.getConnection(connectionUrl+ dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM bankapplication.tansaction_history";

	resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	%>
	<tr bgcolor="#DEB887">
	<td></td>
	<td><%=resultSet.getString("DATE") %></td>
	<td><%=resultSet.getInt("ACC_FROM") %></td>
	<td><%=resultSet.getInt("ACC_TO") %></td>
	<td><%=resultSet.getInt("AMOUNT") %></td>     
	
	<td><button type="Submit" onclick="TransDelete(
	'<%=resultSet.getString("DATE") %>',
	'<%=resultSet.getInt("ACC_FROM") %>',
	'<%=resultSet.getInt("ACC_TO") %>',
	'<%=resultSet.getInt("AMOUNT") %>')">Delete Record</button></td>
	
</tr>
<% 
}
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
<input type="hidden" id="DATE" name="DATE"> 
<input type="hidden" id="ACC_FROM" name="ACC_FROM">
<input type="hidden" id="ACC_TO" name="ACC_TO">
<input type="hidden" id="AMOUNT"name="AMOUNT">

</form>
</div>
</body>
</html>