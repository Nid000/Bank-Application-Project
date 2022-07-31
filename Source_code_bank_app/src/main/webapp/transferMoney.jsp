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
	function cancel() {
		document.forms[0].action = "home";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}

	function transfermoney() {

		try {
			var f_account = parseInt(document.getElementById("f_account").value);
			var t_account = document.getElementById("t_account").value;
			var amount = parseInt(document.getElementById("amount").value);
			var accamount = parseInt(document.getElementById("accamount").value);

			if (!t_account) {
				alert('Please enter recipient account number');
				return false;
			}
			if (!amount) {
				alert('Please enter the amount for transfering');
				return false;
			}
			if (amount > accamount) {
				alert('Insufficient balance. Current balance is SGD '
						+ accamount);
				return false;
			}
			if (f_account === t_account) {
				alert('Cannot transfer money to same account');
				return false;
			}

		} catch (e) {
			console.log(e);
		}
		document.forms[0].action = "transfer";
		document.forms[0].method = 'post';
		document.forms[0].submit();

	}
	function Logout(){
		document.forms[0].action = "logOut";
		document.forms[0].method = 'post';
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
	<form>
		<div class="bg-text">

		<div class="login-block">
		<h1>
			<p style="color: #F0F3F4">Transfer Money</p>
		</h1>
<h1>
			<p style="color: #F0F3F4">${error12}</p>
		</h1>

		<table>
			<tr>
				<td>From</td>
				<td>To</td>
				<td>Amount</td>
			</tr>

			<tr>
				<td><input type="text" readonly name="f_account"size="30" 
					value="${accno}" id="f_account"></td>
				<td><input type="text" name="t_account" size="30"
					id="t_account" placeholder="enter recipient's account number:"></td>
				<td><input type="text" name="amount" size="30" id="amount"
					placeholder="enter amount for transfering"></td>

			</tr>



		</table>
		<br>
		<br>

		<td><button class="button" type="button" onclick="transfermoney()">Transfer</button>
			<button class="button" type="button" onclick="cancel()">Cancel</button></td> <input
			type="hidden" id="accamount" name="accamount" value="${accamount}">

	</form>
</body>
</html>