<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <style>
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

table.center {
	margin-left: auto;
	margin-right: auto;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 60%;
}

td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}
/* :nth-child(even) */
tr, th {
	background-color: #dddddd;
}

h1, h3 {
	text-align: center;
}
</style> -->
<!-- <link href="css/loanstyle.css" rel="stylesheet" type="text/css"> -->
<style>
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
body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731658.jpg')
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

.login-block input {
	width: 100%;
	height: 42px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
	font-size: 14px;
	font-family: Montserrat;
	outline: none;

}

.fcc-btn {
  background-color:#34495E;
  color: white;
  padding: 20px 30px;
  text-decoration: none;
}
</style>
<script>
function Logout(){
	document.forms[0].action = "logOut";
	document.forms[0].method = 'post';
	document.forms[0].submit();
}
	function cancel() {
		document.forms[0].action = "home";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}

	function applyLoan() {
		try {
			var loanNum = document.getElementById("loanNum").value;
			var loanAmt = document.getElementById("loanAmt").value;
			var duration = document.getElementById("duration").value;
			var payout = document.getElementById("payout").value;
			var acc_num = parseInt(document.getElementById("acc_num").value);

			if (!loanAmt) {
				alert('Please Enter a Loan Amount.');
				return false;
			}
			if (duration == "0") {
				alert('Please Select a Loan Duration.');
				return false;
			}
			if (payout == "0") {
				alert('Please Select Your First Payout Month.');
				return false;
			}
		} catch (e) {
			console.log(e);
		}
		document.forms[0].action = "application";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	
</script>

<meta charset="UTF-8">
<title>Loan Application - Home</title>
</head>
<body>
<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'>
<form>
	<div align="right">
		<a class="fcc-btn" onclick= "Logout()" >Log out</a>
	</div>
  
 <div class="login-block">

	<!-- 	<p style="color:#D5DBDB" class="legend">* Required Field</p> -->
		<h1>Loan Application Page</h1>
		<h2>${success4}</h2>
		<p style="color:red;"> * Fill up the form below</p>


		

		
				Loan Account Number:
				<input type="text" readonly id="loanNum" name="loanNum"
					value="${loanacc}" class="input" />
				<br>

				Loan Amount:
				<input type="text" id="loanAmt" name="loanAmt" placeholder ="enter the loan amount."
					class="input" />
				Loan Duration:
				<select class= "button" id="duration" name="duration" class="input">
						<option value="0" selected disabled hidden>No. of Years</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
				</select>
				<br>
				<br>
				First Pay-out In:
				<select class= "button" id="payout" name="payout" class="input">
						<option value="0" selected disabled hidden>Please Select</option>
						<option value="1">January</option>
						<option value="2">February</option>
						<option value="3">March</option>
						<option value="4">April</option>
						<option value="5">May</option>
						<option value="6">June</option>
						<option value="7">July</option>
						<option value="8">August</option>
						<option value="9">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
				</select>
			
			<br>
			<br>
			
				<button class="button" type="button" onclick="cancel()">Cancel</button>
				<button class="button" type="button" onclick="applyLoan()">Apply
						Loan</button>
		
	
		<input  type="hidden" id="acc_num" name="acc_num" value="${acc_num}">
</div>
	</form>
</body>
</html>