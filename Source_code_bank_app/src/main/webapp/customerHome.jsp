<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
		url('https://c4.wallpaperflare.com/wallpaper/718/734/522/reflection-sea-hong-kong-night-vector-hd-wallpaper-preview.jpg')
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
	background-color: #dddddd;
}
</style>
<script>

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
	<div class="bg-image"></div>
	<div class="bg-text">
		<div class="logo"></div>
		<div class="login-block">
			<!-- <form> -->
			<form>
				<h1 style="text-align: center;">Hi ${message2}, Welcome To
					Online Banking</h1>
				<h2>${success}</h2>
				<h2>${success3}</h2>
				<h2>Account Details</h2>
				<table>
					<tr>
						<th style="background-color: #717D7E">Account Number</th>
						<th style="background-color: #717D7E">Current Balance</th>
					</tr>
					<tr>
						<td style="background-color: #BDC3C7">${accno}</td>
						<td style="background-color: #BDC3C7">SGD ${accamount}</td>
					</tr>
				</table>
				<br>
				<br>
				<h2>Loan Details</h2>

				<table>
					<tr>
						<th style="background-color: #717D7E">Loan Account Number</th>
						<th style="background-color: #717D7E">Loan Amount</th>
						<th style="background-color: #717D7E">Loan Paid</th>
						<th style="background-color: #717D7E">Loan Balance</th>
					</tr>
					<tr>
						<td style="background-color: #BDC3C7">${l_acc}</td>
						<td style="background-color: #BDC3C7">SGD ${l_amount}</td>
						<td style="background-color: #BDC3C7">SGD ${l_paid}</td>
						<td style="background-color: #BDC3C7">SGD ${l_balance}</td>
					</tr>
				</table>

				<br>
				<br>
				<td><button type="button"
						onclick="transfer('${accno}','${accamount}')">Transfer
						Money</button>
					<button type="button" onclick="thistory(${accno})">Transaction
						History</button>
					<button type="button" onclick="applyloan(${accno})">Apply
						Loan</button></td> <input type="hidden" id="acc_num" name="acc_num"> <input
					type="hidden" id="accamount" name="accamount"> <input
					type="hidden" id="l_acc" name="l_acc">

			</form>
		</div>
	</div>
</body>
</html>