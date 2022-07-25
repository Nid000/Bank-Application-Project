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
</style>
<!-- <link href="css/loanstyle.css" rel="stylesheet" type="text/css"> -->

<script>
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

	<!-- 	<p style="color:#D5DBDB" class="legend">* Required Field</p> -->
	<form>
		<h1 style="color: #D5DBDB">Loan Application Page</h1>
		<h2 style="color: #D5DBDB">${success4}</h2>
		<h3 style="color: #D5DBDB">Fill up the form below</h3>

		<table class="center">

			<!-- 	<form action="/application" method="post" id="applyForm"> -->
			<tr>
				<td><label class="lbl_form" for="loanAmt">Loan Account
						Number: </label></td>
				<td><input type="text" readonly id="loanNum" name="loanNum"
					value="${loanacc}" class="input" /></td>
				<br>
			<tr>
				<td><label class="lbl_form" for="loanAmt">Loan Amount:
				</label></td>
				<td><input type="text" id="loanAmt" name="loanAmt"
					class="input" /></td>
			</tr>
			<tr>
				<td><label class="lbl_form" for="duration">Loan
						Duration: </label></td>
				<td><select id="duration" name="duration" class="input">
						<option value="0" selected disabled hidden>No. of Years</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
				</select></td>
			<tr>
				<br>
			<tr>
				<td><label class="lbl_form" for="payout">First Pay-out
						In: </label></td>
				<td><select id="payout" name="payout" class="input">
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
				</select></td>
			</tr>
			<br>
			<tr>
				<td><button type="button" onclick="cancel()">Cancel</button></td>
				<td><button type="button" onclick="applyLoan()">Apply
						Loan</button></td>
			</tr>
		</table>
		<input type="hidden" id="acc_num" name="acc_num" value="${acc_num}">

	</form>
</body>
</html>