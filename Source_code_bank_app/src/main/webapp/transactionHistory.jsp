<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.fcc-btn {
  background-color:#1B4F72    ;
  color: white;
  padding: 15px 25px;
  text-decoration: none;
}
body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731658.jpg')
		no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}

.fcc-btn {
  background-color:#1B4F72    ;
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
  background-color:#1F618D ;
} 
 tr:nth-child(odd) {
  background-color:#2E86C1 ;
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
.bg-text {
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/opacity/see-through */ 
	color: white;
	font-weight: bold;
	/*  border: 3px solid #f1f1f1; 
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 2;
	width: 80%; */
	padding: 20px;
	text-align: center;
}
</style>
<script>
	function homey() {
		document.forms[0].action = "home";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function Logout(){
		document.forms[0].action = "logOut";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
</script>
<body>

<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'> 
	<form>
		<div align="right">
	<a class="fcc-btn" type="button" onclick= "Logout()">Logout</a>
 </div>
 	

		
 <table class="bg-text" align = "center">

		
<tr>
		<h1 style="color:#FDFEFE" align="center">Debit Transactions</h1>
</tr>
			<tr>
				<th>Date/Time &nbsp;</th>
				<th>Recipient Account Number
					&nbsp;</th>
				<th>Amount &nbsp;</th>
			</tr>

			<c:forEach items="${t_trans}" var="pp">
				<tr>
					<td><c:out
							value="${pp.date}" /></td>
					<td><c:out
							value="${pp.acc_to}" /></td>
					<td><c:out
							value="SGD ${pp.amount}" /></td>
				</tr>
			</c:forEach>

		</table >

		<table class="bg-text" align="center">
			<h1 style="color:#FDFEFE" align="center">Credit Transactions</h1>

			<tr>
				<th>Date/Time &nbsp;</th>
				<th>Creditor Account Number
					&nbsp;</th>
				<th>Amount &nbsp;</th>
			</tr>

			<c:forEach items="${f_trans}" var="pp">
				<tr>
					<td><c:out
							value="${pp.date}" /></td>
					<td><c:out
							value="${pp.acc_from}" /></td>
					<td><c:out
							value="SGD ${pp.amount}" /></td>
				</tr>
			</c:forEach>

			<tr>
			</tr>
			
		</table>
		<br>

	
	</form>
	<a class="fcc-btn" type="button" onclick="homey()">Home</a>
</body>
</html>