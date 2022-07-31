<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@page import = "appModels.Customer" %>
<%@page import = "java.util.ArrayList" %>


<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://127.0.0.1:3306/?user=root";
String dbName = "bankapplication";
String userId = "root";
String password = "podapatti99";

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
.fcc-btn {
  background-color:#34495E;
  color: white;
  padding: 15px 25px;
  text-decoration: none;
}

table, th, td {
    border: 2px solid white;
    border-collapse: collapse;
}
th, td {
    padding:9px;
    text-align: right;
}
table#table {
    width: 100%;    
    background-color:#AEB6BF;
}
 tr:nth-child(even) {
  background-color:#7FB3D5 ;
} 
 tr:nth-child(odd) {
  background-color:#85C1E9 ;
} 
.button {
  background-color: #1B2631; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
	
</head>
<script>
	function Logout(){
		document.forms[0].action = "logOut";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	
	function Update( name, acc_num, bank_bal, username, password, tot_lon, ann_incm) {
		try {
			
			document.forms[0].NAME.value = name;
			document.forms[0].ACCOUNT_NUMBER.value = acc_num;
			document.forms[0].BANK_BALANCE.value = bank_bal;
			document.forms[0].USERNAME.value = username;
			document.forms[0].PASSWORD.value = password;
			document.forms[0].TOTAL_LOANS.value = tot_lon;
			document.forms[0].ANNUAL_INCOME.value = ann_incm;
			
			document.forms[0].action = "cusUpdate";
			document.forms[0].method = 'post';
			document.forms[0].submit();
		} catch (e) {
			console.log(e);
		}
	}
		
		function Delete( name, acc_num, bank_bal, username, password, tot_lon, ann_incm) {
			try {
				
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
		function transHistory(acc_num){
			console.log(acc_num)
			document.forms[0].acc_num.value = acc_num;
  			document.forms[0].action = "transHisfromEmp";
			document.forms[0].method = 'post';
			document.forms[0].submit();  
		}
		function loanDetails(acc_num){
			document.forms[0].acc_num.value = acc_num;
  			document.forms[0].action = "loanDetailsEmp";
			document.forms[0].method = 'post';
			document.forms[0].submit(); 
		}
	
</script>

<meta charset="UTF-8">
<title> Customer Details</title>
</head>

<body>
<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'> 
	<form>
<div align="right">
<td><a class="fcc-btn" href="employeeHome.jsp">Home</a></td>
	<td><a class="fcc-btn" type="button" onclick= "Logout()">Logout</a></td>
 </div>

<h1 style="color:#FDFEFE" align="center">Customer Details</h1>
<p style="color:#F7F9F9">${success}</p>
<p style="color:#F7F9F9">${success1message}</p>
<p style="color:#F7F9F9">${success2}</p>

<br><br>
 
<table >
<tr>

<th><b>SN</b></th>
<th><b>NAME</b></th>
<th><b>ACCOUNT NUMBER</b></th>
<th><b>BANK BALANCE</b></th>
<th><b>USERNAME</b></th>
<th><b>PASSWORD</b></th>
<th><b>TOTAL LOANS</b></th>
<th><b>ANNUAL INCOME</b></th>
<!-- <th>OPERATIONS</th> -->
<th><b>TRANSACTION HISTORY</b></th>
<th><b>LOAN DETAILS</b></th>
<th><b>UPDATE DETAILS</b></th>
<th><b>DELETE</b></th>

</tr>

<%

try{ 
	connection = DriverManager.getConnection(connectionUrl+ dbName, userId, password);
	statement=connection.createStatement();
	String sql ="SELECT * FROM bankapplication.bank_customers";

	resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	%>
	<tr>
	<td></td>
	<td><%=resultSet.getString("NAME") %></td>
	<td><%=resultSet.getString("ACCOUNT_NUMBER") %></td>
	<td><%=resultSet.getString("BANK_BALANCE") %></td>
	<td><%=resultSet.getString("USERNAME") %></td>
	<td><%=resultSet.getString("PASSWORD") %></td>
	<td><%=resultSet.getString("TOTAL_LOANS") %></td>
	<td><%=resultSet.getString("ANNUAL_INCOME") %></td>
	
	
	
	<td><button class="button" type ="button" onclick = "transHistory('<%=resultSet.getString("ACCOUNT_NUMBER") %>')">Transaction History</button></td>
	<td><button class="button" type ="button" onclick = "loanDetails('<%=resultSet.getString("ACCOUNT_NUMBER") %>')">Loan Details</button></td>
	
	
	
	<td><button class="button" type="button" onclick="Update(
	'<%=resultSet.getString("NAME") %>',
	'<%=resultSet.getString("ACCOUNT_NUMBER") %>',
	'<%=resultSet.getString("BANK_BALANCE") %>',
	'<%=resultSet.getString("USERNAME") %>',
	'<%=resultSet.getString("PASSWORD") %>',
	'<%=resultSet.getString("TOTAL_LOANS") %>',
	'<%=resultSet.getString("ANNUAL_INCOME") %>')">Update</button></td>
	
	<td><button class="button" type="Submit" onclick="Delete(
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


<input type="hidden" id="NAME" name="NAME">
<input type="hidden" id="acc_num" name="acc_num">
<input type="hidden" id="ACCOUNT_NUMBER" name="ACCOUNT_NUMBER">
<input type="hidden" id="BANK_BALANCE"name="BANK_BALANCE">
<input type="hidden" id="USERNAME" name="USERNAME"> 
<input type="hidden" id="PASSWORD" name="PASSWORD">
<input type="hidden" id="TOTAL_LOANS" name="TOTAL_LOANS">
<input type="hidden" id="ANNUAL_INCOME"name="ANNUAL_INCOME">
</form>
</body>
</html>