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
	function homey() {
		document.forms[0].action = "home";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function TransDelete(date) {
		try {
			document.forms[0].DATE.value = date;
			console.log(date)
			document.forms[0].action = "TransDeleteServlet";
			document.forms[0].method = 'post';
			document.forms[0].submit(); 
		} catch (e) {
			console.log(e);
		}}
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
<td><a class="fcc-btn" href="employeeHome.jsp">Home</a></td>
	<td><a class="fcc-btn" type="button" onclick= "Logout()">Logout</a></td>
 </div>
		<table align = "center">

			<h1 style="color:#FDFEFE" align="center">Debit Transactions</h1>

			<tr>
				<th>Date/Time &nbsp;</th>
				<th >Recipient Account Number
					&nbsp;</th>
				<th >Amount &nbsp;</th>
				<th>Delete</th>
			</tr>

			<c:forEach items="${t_trans}" var="pp">
				<tr>
					<td><c:out
							value="${pp.date}" /></td>
					<td><c:out
							value="${pp.acc_to}" /></td>
					<td><c:out
							value="SGD ${pp.amount}" /></td>
					<td> <button class ="button" type="button" onclick = "TransDelete('${pp.date}')"> Delete</button></td>
				</tr>
			</c:forEach>

		</table>

		<table align = "center">
			<h1 style="color:#FDFEFE" align="center">Credit Transactions</h1>

			<tr>
				<th>Date/Time &nbsp;</th>
				<th>Creditor Account Number
					&nbsp;</th>
				<th>Amount &nbsp;</th>
				<th>Delete</th>
			</tr>

			<c:forEach items="${f_trans}" var="pp">
				<tr>
					<td><c:out
							value="${pp.date}" /></td>
					<td><c:out
							value="${pp.acc_from}" /></td>
					<td><c:out
							value="SGD ${pp.amount}" /></td>
					<td> <button class="button" type="button" onclick = "TransDelete('${pp.date}')"> Delete</button></td>
				</tr>
			</c:forEach>

			<tr>
			</tr>
		</table>
		<br>
	 <a class="fcc-btn" href="CusDetails.jsp">Go Back</a>
	<input type="hidden" id="DATE" name="DATE"> 
	</form>
</body>
</html>