<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    background: url('https://images.unsplash.com/photo-1501167786227-4cba60f6d58f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80') no-repeat fixed center center;
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

function cancel() {
	document.forms[0].action= "home";
	document.forms[0].method= 'post';
	document.forms[0].submit(); 
}


 function transfermoney(){

	try {
		var f_account = parseInt(document.getElementById("f_account").value);
		var t_account = document.getElementById("t_account");
		var amount = parseInt(document.getElementById("amount").value);
		var accamount =parseInt(document.getElementById("accamount").value);
		
		
 		if(!t_account){
			console.log(t_account);
			alert('Please enter recipient account number');
			return false;
		}
		if(!amount){
			console.log(amount);
			alert('Please enter the amount for transfering');
			return false;
		}
		if(amount > accamount){
			alert('Insufficient balance. Current balance is SGD ' + accamount);
			return false;
			}
		if(f_account === t_account){
			alert('Cannot transfer money to same account');
			return false;
		}
		 

	} catch (e) {
		console.log(e);
	}
 	console.log("reached here")
	document.forms[0].action= "transfer";
	document.forms[0].method= 'post';
	document.forms[0].submit();  
 
 }

/* 	document.forms[0].action= "customersubServlet";
	document.forms[0].method= 'post';
	document.forms[0].submit(); */

</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form>
<!--  <form action = "/transfer" method = "post">  -->
<h1>Transfer Money</h1>
<h1>${error}</h1>
	 
<table>
<tr>
<td style="background-color:#F0F3F4">From</td>
<td style="background-color:#F0F3F4" >To</td>
<td style="background-color:#F0F3F4">Amount</td>
</tr>

<tr>
<td><input type = "text" readonly name="f_account" size="50" value=${accno} id="f_account"></td>
<td><input type = "text" name="t_account" size="50" id="t_account" placeholder="enter recipient's account number:"></td>
<td><input type = "text" name="amount" size="50" id="amount" placeholder="enter amount for transfering"></td>

</tr>



</table>
<br><br>

<td><button type = "button" onclick = "transfermoney()">Transfer</button>
<button type="button" onclick="cancel()">Cancel </button></td>

<input type="hidden" id="accamount" name="accamount" value= "${accamount}">

</form>
</body>
</html>