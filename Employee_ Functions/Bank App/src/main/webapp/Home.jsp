<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function Logout(){
		document.forms[0].action = "LogOutServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function CusDet(){
		document.forms[0].action = "CusDetailsServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	function RegnewCus(){
		document.forms[0].action = "RegNewCusServlet";
		document.forms[0].method = 'post';
		document.forms[0].submit();
	}
	
</script>

<meta charset="UTF-8">
<title>Welcome Home</title>
</head>
<body>
<form>
<div align="center">
<h1>Welcome Home </h1>
<div align="right">
	<button type="button" onclick= "Logout()">Logout</button>
 </div>
 </form>
<form>
<br>

<div align="center"></div>
<td><button type="button" onclick= "CusDet()">Customer Details</button></td>
<br><br>
<td><button type="button" onclick= "RegnewCus()">Register New Customer </button></td>
</tr>
</form>
</div>
</body>
</html>