<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background:
		url('https://wallpapers-hub.art/wallpaper-images/731612.jpg')
		no-repeat fixed center center;
	background-size: cover;
	font-family: Montserrat;
}
.fcc-btn3 {
  background-color: #1D8348;
  color: white;
  padding: 50px 50px;
  text-decoration: none;
}
.fcc-btn2 {
  background-color: #633974;
  color: white;
  padding: 50px 50px;
  text-decoration: none;
}
.fcc-btn1 {
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
	function create(){
		document.forms[0].action = "cusAccnum";
		document.forms[0].method = 'post';
		document.forms[0].submit();
		
	}
</script>

<meta charset="UTF-8">
<title>Employee Home</title>
</head>
<body>
<br>
  	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'> 
<form>
<div align="right">
	<a class="fcc-btn1" type="button" onclick= "Logout()">Logout</a>
 </div>
<div align="center">
<h1 style="color:#FDFEFE">Employee Home </h1>
<p style="color:red;"> ${success1}</p>
<br>
<br>
<br>

 </form>
<form>
<br>
<tr>
<div align="center"></div>
<td><a class="fcc-btn2" href="CusDetails.jsp">Customer Details</a></td>


<a class="fcc-btn3" type="button" onclick = "create()">Create New Customer</a>
<!-- <td><a class="fcc-btn" ="/cusAccnum">Create New Customer </a></td> -->
</tr>
</form>
</div>
</body>
</html>