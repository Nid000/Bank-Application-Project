<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Loan Details </title>
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
	width: 400px;
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
  padding: 15px 25px;
  text-decoration: none;
}
</style>
<script>
function Logout(){
	document.forms[0].action = "logOut";
	document.forms[0].method = 'post';
	document.forms[0].submit();
}
	
function update(){
	try{
	var newloan_amt = document.getElementById("newloan_amt").value;
	var newloan_paid = document.getElementById("newloan_paid").value;
	var newloan_bal = document.getElementById("newloan_bal").value;
	var newaccnum = document.getElementById("newaccnum").value;
	
	console.log(newloan_amt);
	console.log(newloan_paid);
	console.log(newloan_bal);
	console.log(newaccnum);
	if(!newloan_amt){
		console.log(newloan_amt);
		alert('Please enter the loan amount');
		return false;
	}	
	if(!newloan_paid){
		console.log(newloan_paid);
		alert('Please enter paid loan amount');
		return false;	
	}
	if(!newloan_bal){
		console.log(newloan_bal);
		alert('Please enter loan balance amount');
		return false;
	}
	if(!newaccnum){
		console.log(newaccnum);
		return false;
	}
	}
	catch(e){
		console.log(e);
	}
	document.forms[0].action= "LoanDetEditServlet";
	document.forms[0].method= 'post';
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
  <div class="login-block">
  <h1>UPDATE LOAN DETAILS </h1>

	
	<table>
		<tr>
			<td>Account Number</td><td><input type="text" readonly name="newaccnum" value= "${account_number}" id="newaccnum" required><br>
		    </td>
		</tr>
		<tr>
			<td> Loan Account Number</td><td><input type="text" readonly name="newloan_acc_num" value= "${loan_acc_number}" id="newloan_acc_num" required><br>
		    </td>
		</tr>
		<tr>
			<td>Loan Amount</td><td><input type="text" name="newloan_amt" value= "${l_amount}" id="newloan_amt" required><br>
		    </td>
		</tr>
		<tr>
			<td>Loan Paid Amount</td><td><input type="text"  name="newloan_paid" value = "${l_paid}" id="newloan_paid" required><br>
			</td>
		</tr>
		<tr>
			<td>Loan Balance Amount</td><td><input type="text" name="newloan_bal" value = "${l_balance}" id="newloan_bal" required><br>
			</td>
		</tr>

	<div align= "right"><tr><td>
		<a class="fcc-btn" type="button" onclick="update()">Update</a>
		</td></tr></div>
	
</table>	
</div>
</form>
</body>
</html>