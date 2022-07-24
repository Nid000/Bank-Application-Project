<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Loan Details </title>
</head>
<script>
function cancel(){
	document.forms[0].action = "LoanDetCxlServelet";
	document.forms[0].method = 'post';
	document.forms[0].submit();
	}
	
function update(){
	console.log("i am here update")
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

<div align="center">
  <h1>UPDATE LOAN DETAILS </h1>
  <form action=LoanDetEditServlet method="post">
	
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
		
		<td><button type="button" onclick= "cancel()">Cancel</button></td>
		<td><button type="button" onclick="update()">Update</button></td>
			
		
	</table>
	
	</form>
</div>
</body>
</html>