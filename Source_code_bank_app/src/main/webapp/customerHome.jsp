<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.fcc-btn {
  background-color:#1B4F72    ;
  color: white;
  padding: 15px 25px;
  text-decoration: none;
}
body, html {
	height: 100%;
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

.bg-image {
	/* The image used */
	background-image: url("photographer.jpg");
	/* Add the blur effect */
	filter: blur(8px);
	-webkit-filter: blur(8px);
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

/* Position text in the middle of the page/image */
.bg-text {
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/opacity/see-through */
	color: white;
	font-weight: bold;
	border: 3px solid #f1f1f1;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 2;
	width: 80%;
	padding: 20px;
	text-align: center;
}

body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731658.jpg')
		no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}
 tr:nth-child(even) {
  background-color:#1F618D;
} 
 tr:nth-child(odd) {
  background-color:#2E86C1 ;
} 
.button {
  background-color: #A93226;
  border: none;
  color: white;
  padding: 15px 32px;
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

function transfer(acc,accamount){
	document.forms[0].acc_num.value = acc;
	document.forms[0].accamount.value = accamount;
	
 	document.forms[0].action= "customerServlet";
	document.forms[0].method= 'post';
	document.forms[0].submit(); 
	}
function thistory(acc){
	document.forms[0].acc_num.value = acc;
 	document.forms[0].action= "thistory";
	document.forms[0].method= 'post';
	document.forms[0].submit();
}

function applyloan(acc){
	document.forms[0].acc_num.value = acc;
	document.forms[0].action= "applyLoan";
	document.forms[0].method= 'post';
	document.forms[0].submit(); 
	
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br> 
<div align="right">
	<a class="fcc-btn" type="button" onclick= "Logout()">Logout</a>
 </div>

	<div class="bg-text">

		<div class="login-block">
			<!-- <form> -->
			<form>
				<h1 style="text-align: center;">Hi ${message2}, Welcome To
					Online Banking</h1>
				<p style="color:#D6DBDF">${loan}</p>
				<p style="color:#D6DBDF">${success}</p>
				<p style="color:#D6DBDF">${success3}</p>
				<h2>Account Details</h2>
				<p style="color:#D6DBDF">${success1}</p>

				<table>
					<tr>
						<th>Account Number</th>
						<th>Current Balance</th>
					</tr>
					<tr>
						<td>${accno}</td>
						<td>SGD ${accamount}</td>
					</tr>
				</table>
				<br>
				<br>
				<h2>Loan Details</h2>

				<table>
					<tr>
						<th>Loan Account Number</th>
						<th>Loan Amount</th>
						<th>Loan Paid</th>
						<th>Loan Balance</th>
					</tr>
					<tr>
						<td>${l_acc}</td>
						<td>SGD ${l_amount}</td>
						<td>SGD ${l_paid}</td>
						<td>SGD ${l_balance}</td>
					</tr>
				</table>

				<br>
				<br>
				<td><button class="button" type="button"
						onclick="transfer('${accno}','${accamount}')">Transfer
						Money</button>
					<button class="button" type="button" onclick="thistory(${accno})">Transaction
						History</button>
					<button class="button" type="button" onclick="applyloan(${accno})">Apply
						Loan</button></td> <input type="hidden" id="acc_num" name="acc_num"> <input
					type="hidden" id="accamount" name="accamount"> <input
					type="hidden" id="l_acc" name="l_acc">

			</form>
		</div>
	</div>
</body>
</html>