<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Customer</title>
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
.button {
  background-color: #34495E;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
<script>
function Logout(){
	document.forms[0].action = "logOut";
	document.forms[0].method = 'post';
	document.forms[0].submit();
}
function create(){
	try{
		var account_number = document.getElementById("account_number").value;
		var name = document.getElementById("name").value;
		var username = document.getElementById("username").value;
		var annual_income = document.getElementById("annual_income").value;
		var bank_balance = document.getElementById("bank_balance").value;
		var password1 = document.getElementById("password1").value;
		var password2 = document.getElementById("password2").value;
		
		console.log(name);
		console.log(username);
		console.log(password1);
		console.log(password2);

		if(!name){
			console.log(name);
			alert('Please enter the name');
			return false;
		}
		if(!username){
			console.log(username);
			alert('Please enter the username');
			return false;
		}
		if(!annual_income){
			console.log(annual_income);
			alert('Please enter the annual_income');
			return false;
		}
		if(!bank_balance){
			console.log(username);
			alert('Please enter the bank_balance');
			return false;
		}
			
		if(!password1){
			console.log(password1);
			alert('Please enter the password');
			return false;	
		}
		if(!password2){
			console.log(password2);
			alert('Confirm the entered password');
			return false;
		}
		}
 
		catch(e){
			console.log(e);
		}
		document.forms[0].action= "cusServlet";
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


 <h1>Create Customer Account</h1>
 <br>
  <p style="color:red;">${error}</p>
 
 
 <table style="with: 80%">
     <tr>
     <td>Account Number</td>
     <td><input type="text" id="account_number" readonly name="account_number" value = "${account}" /></td>
    </tr>
	<tr>
     <td>Name</td>
     <td><input type="text" id="name" name="name" value="${name}"/></td>
    </tr>
    <tr>
     <td>Email ID</td>
     <td><input type="text" id="username" name="username" value="${username}" /></td>
    </tr>
     <tr>
     <td>Annual Income</td>
     <td><input type="text" id="annual_income" name="annual_income" value="${aincome}" /></td>
    </tr>
    <tr>
         <td>Initial Deposit</td>
     <td><input type="text" id="bank_balance" name="bank_balance" value="${bbalance}"/></td>
    </tr>
       <tr>
     <td>Password</td>
     <td><input type="password" id="password1" name="password1" /></td>
    </tr>
    <tr>
    <tr>
     <td>Re-Type Password</td>
     <td><input type="password" id="password2" name="password2" /></td>
    </tr>
    <tr>
<td><a class="button" href="employeeHome.jsp">Cancel</a></td>
<td><button class="button" type="button" onclick="create()"> Create</button></td></tr>
 </table>
 
   
 
   <br>
   
   </div>
	</form>


</body>
</html>