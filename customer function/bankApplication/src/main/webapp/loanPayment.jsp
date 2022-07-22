<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td>Account Number</td>
<td>Loan Account Number</td>
<td>Amount</td>
</tr>

<tr>
<td><input type = "text" readonly name="f_account" size="50" value=${accno} id="f_account"></td>
<td><input type = "text" readonly name="t_account" size="50" id="t_account" value=${lacc}></td>
<td><input type = "text" name="amount" size="50" id="amount" placeholder="enter amount for transfering"></td>

</tr>



</table>

<button type="button" onclick ="transfer()">Transfer</button>
<button type="button" onclick ="home()"> Cancel</button>

</body>
</html>