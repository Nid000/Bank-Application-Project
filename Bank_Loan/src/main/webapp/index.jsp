<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="css/loanstyle.css" rel="stylesheet" type="text/css">
	<script src="javascript/loanNotif.js"></script>
	<script>
		function applyLoan(loanAmt, duration, payout){
		try {
			var loanAmt = document.getElementById("loanAmt").value;
			var duration = document.getElementById("duration").value;
			var payout = document.getElementById("payout").value;
			
			if(!loanAmt){
				console.log(loanAmt);
				alert('Please Enter a Loan Amount.');
				return false;
			}
			if(duration == "0"){
				console.log(duration);
				alert('Please Select a Loan Duration.');
				return false;
			}
			if(payout == "0"){
				console.log(payout);
				alert('Please Select Your First Payout Month.');
				return false;
			}
		} catch (e) {
			console.log(e);
		}
			document.forms[0].action= "applicationServlet";
			document.forms[0].method= 'post';
			document.forms[0].submit();
	}
	</script>

<meta charset="UTF-8">
<title>Loan Application - Home</title>
</head>
<body onLoad = "NameAndLoan()">
	<h1>Welcome ${name}, to the Loan Application Page!</h1>
	<h1>${message1}</h1>
	<h2>To apply for a loan, please fill up the form below</h2>
	<p class="legend">* Required Field</p>
	
	<form action="applyLoan" method="post" id="applyForm">
		<label class="lbl_form" for="loanAmt">Loan Amount: </label>
			<input type="text" id="loanAmt" name="loanAmt" class="input"/>
		<br/>
		<label class="lbl_form" for="duration">Loan Duration: </label>
			<select id="duration" name="duration" class="input">
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
		<br/>
		<label class="lbl_form" for="payout">First Pay-out In: </label>
			<select id="payout" name="payout" class="input">
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
			<br/><br/>
		<button type="button" onClick="applyLoan('${loanAmt}','${duration}','${payout}')">Apply Loan</button>
	</form>
</body>
</html>