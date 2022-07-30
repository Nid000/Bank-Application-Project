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

function transfer(acc,accamount){
	console.log(accamount)
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
function payloan(acc, lacc){
	document.forms[0].acc_num.value = acc;
	document.forms[0].l_acc.value = lacc;
 	document.forms[0].action= "loanPayment";
	document.forms[0].method= 'post';
	document.forms[0].submit();
	
}

function applyloan(name, acc, lacc, lbalance) {
	document.forms[0].message2.value = name;
	document.forms[0].acc_num.value = acc;
	document.form[0].l_acc.value = lacc;
	document.form[0].l_bal = lbalance;
	document.forms[0].method = "post";
	document.forms[0].action = "applyLoanServlet";
	document.forms[0].submit();
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="logo"></div>
<div class="login-block">
<form>
<!-- <form action="/customerServlet" method="post"> -->
<h1 style="text-align:center;">Hi ${message2}, Welcome To Online Banking</h1>
<h2>${success}</h2>
<h2>${success}</h2>
<h2>Account Details</h2>
<table>
  <tr>
    <th style="background-color:#F0F3F4">Account Number</th>
    <th style="background-color:#F0F3F4">Current Balance</th>
  </tr>
  <tr>
  <td>${accno}</td>
  <td>SGD ${accamount}</td>
  </tr>
  </table>
<br><br>
<h2>Loan Details</h2>

<table>
  <tr>
    <th style="background-color:#F0F3F4">Loan Account Number</th>
    <th style="background-color:#F0F3F4">Loan Amount</th>
    <th style="background-color:#F0F3F4">Loan Paid</th>
    <th style="background-color:#F0F3F4">Loan Balance</th>
  </tr>
  <tr>
  <td>${l_acc}</td>
  <td>SGD ${l_amount}</td>
  <td>SGD ${l_paid}</td>
  <td>SGD ${l_balance}</td>
  </tr>
  </table>

<br><br>
<td><button type = "button" onclick = "transfer('${accno}','${accamount}')">Transfer Money</button>
<button type ="button" onclick = "thistory(${accno})">Transaction History</button>
<button type ="button" onclick = "applyloan('${accno}','${l_acc},'${l_balance}')">Apply Loan</button></td>


<input type="hidden" id="acc_num" name="acc_num">
<input type="hidden" id="accamount" name="accamount">
<input type="hidden" id="l_acc" name="l_acc">

</form>
</div>
</body>
</html>