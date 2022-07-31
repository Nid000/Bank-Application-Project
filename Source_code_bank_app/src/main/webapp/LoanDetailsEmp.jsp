<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  padding: 7px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}

	</style>


<script>
	function Logout(){
		document.forms[0].action = "logOut";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}	
	function Delete(loan_acc_number, account_number) {
		try {
				console.log(loan_acc_number)
			document.forms[0].ACCOUNT_NUMBER.value = account_number; 
			document.forms[0].LOAN_ACC_NUMBER.value = loan_acc_number;
			
/* 			document.forms[0].L_AMOUNT.value = l_amount;
			document.forms[0].L_PAID.value = l_paid;				
			document.forms[0].L_BALANCE.value = l_balance; */
			
			document.forms[0].action = "LonDetDelServlet";
			document.forms[0].method = 'post';
			document.forms[0].submit(); 
			} catch (e) {
				console.log(e);
			}
		}
		
		function update( account_number, loan_acc_number, l_amount, l_paid, l_balance) {
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
<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'>
<form>
<div align="right">
<td><a class="fcc-btn" href="employeeHome.jsp">Home</a></td>
	<td><a class="fcc-btn" type="button" onclick= "Logout()">Logout</a></td>
 </div>
<div align="center">
<h1 style="color:#FDFEFE" align="center">LOAN DETAILS </h1>




<table>

<tr>
<th><b>SN</b></th>
<th><b>ACCOUNT NUMBER</b></th>
<th><b>LOAN ACCOUNT NUMBER</b></th>
<th><b>LOAN AMOUNT</b></th>
<th><b>PAID LOAN AMOUNT</b></th>
<th><b>LOAN BALANCE</b></th>
<th><b>EDIT</b></th>
<th><b>DELETE</b></th>

</tr>
	<tr>
	<td></td>
	<td>${acc_num}</td>
	<td>${l_acc }</td>
	<td>${l_amount}</td>
	<td>${l_paid}</td>
	<td>${l_balance}</td>
	<td><button class="button" type = "button" onclick = "update('${acc_num}','${l_acc }','${l_amount}','${l_paid}','${l_balance}')"> EDIT </button></td>
	<td><button class="button" type = "button" onclick = "Delete('${l_acc}','${acc_num}')"> Delete </button></td>
</tr>

<tr></tr>
</table>
<br>
<br>

<input type="hidden" id="ACCOUNT_NUMBER"name="ACCOUNT_NUMBER">
<input type="hidden" id="LOAN_ACC_NUMBER" name="LOAN_ACC_NUMBER"> 
<input type="hidden" id="L_AMOUNT" name="L_AMOUNT">
<input type="hidden" id="L_PAID" name="L_PAID">
<input type="hidden" id="L_BALANCE"name="L_BALANCE">
<a class="fcc-btn" href="CusDetails.jsp">Go Back</a>
</form>
</body>
</html>