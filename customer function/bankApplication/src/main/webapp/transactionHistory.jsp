<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    background: url('https://images.unsplash.com/photo-1501167786227-4cba60f6d58f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80') no-repeat fixed center center;
    background-size: cover;
    font-family: Montserrat;
}

table, th, td {
	border: 1px solid;
	border-collapse: collapse;
}


td {
	text-align: center;
}

tr:hover {
	background-color: coral;
}
/* tr:nth-child(even) {background-color: #f2f2f2;} */
th {
	background-color: #D5DBDB  ;
	color: white;
}
</style>
<script>
	function homey(){
		console.log("look here");
		document.forms[0].action= "home";
		document.forms[0].method= 'post';
		document.forms[0].submit(); 
}


</script>
<body>
<form>
<table>

<h1>Debit Transactions</h1>

<tr>
<th style="background-color:#2C3E50">Date/Time &nbsp;</th>
<th style="background-color:#2C3E50">Recipient Account Number &nbsp;</th>
<th style="background-color:#2C3E50">Amount &nbsp;</th>
</tr>

<c:forEach items="${t_trans}" var="pp">
				<tr>
					<td style="background-color:#F0F3F4"><c:out value="${pp.date}"  /></td>
					<td style="background-color:#F0F3F4"><c:out value="${pp.acc_to}" /></td>
					<td style="background-color:#F0F3F4"><c:out value="SGD ${pp.amount}" /></td>
				</tr>
			</c:forEach>

</table>

<table>
<h1><p style="color:#F0F3F4">Credit Transactions<p></h1>

<tr>
<th style="background-color:#2C3E50">Date/Time &nbsp;</th>
<th style="background-color:#2C3E50">Creditor Account Number &nbsp;</th>
<th style="background-color:#2C3E50">Amount &nbsp;</th>
</tr>

<c:forEach items="${f_trans}" var="pp">
				<tr>
					<td style="background-color:#F0F3F4"><c:out value="${pp.date}"  /></td>
					<td style="background-color:#F0F3F4"><c:out value="${pp.acc_from}" /></td>
					<td style="background-color:#F0F3F4"><c:out value="SGD ${pp.amount}" /></td>
				</tr>
			</c:forEach>
			
			<tr>
			</tr>
</table>
<br>

<button type="button" onclick="homey()">Home</button>
</form>
</body>
</html>