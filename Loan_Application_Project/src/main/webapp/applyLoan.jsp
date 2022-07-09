<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="../css/loanstyle.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Loan Application - Home</title>
</head>
<body>
	<h1>Welcome to the Loan Application Page!</h1>
	<h2>To apply for a loan, please fill up the form below</h2>
	<p class="legend">* Required Field</p>
	
	<form action="applyLoan" method="post">
		<label class="lbl_form" for="loanAmt">Loan Amount: </label>
			<input type="text" id="loanAmt" name="loanAmt"/>
		<label class="lbl_form" for="duration">Loan Duration: </label>
			<select id="duration" name="duration">
				<option value="none" selected disabled hidden>No. of Years</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
			</select>
		
		<label class="lbl_form" for="payout">First Pay-out In: </label>
			<select id="payout" name="payout">
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
		<input type="submit" text="Submit"/>
	</form>
</body>
</html>