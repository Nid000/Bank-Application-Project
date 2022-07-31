<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update </title>
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
	console.log("i am here update")
	try{
	var bank_bal = document.getElementById("newbank_bal").value;
	var password = document.getElementById("newpassword").value;
	var tot_lon = document.getElementById("newtot_lon").value;
	var ann_incm = document.getElementById("newann_incm").value;
	var acc_num = document.getElementById("newacc_num").value;
	
	console.log(bank_bal);
	console.log(password);
	console.log(tot_lon);
	console.log(ann_incm);
	console.log(acc_num);
	
	if(!bank_bal){
		console.log(bank_bal);
		alert('Please enter the bank balance');
		return false;
	}
	
	if(!password){
		console.log(password);
		alert('Please enter the password');
		return false;
	}
		
	if(!tot_lon){
		console.log(tot_lon);
		alert('Please enter the total income');
		return false;	
	}
	if(!ann_incm){
		console.log(ann_incm);
		alert('Please enter the annual income');
		return false;
	}
	if(!acc_num){
		console.log(ann_incm);
		return false;
	}
	}
	
	catch(e){
		console.log(e);
	}
	document.forms[0].action= "EditServlet";
	document.forms[0].method= 'post';
	document.forms[0].submit();
	} 

</script>
<body>
<br>
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700'
		rel='stylesheet' type='text/css'>
  <form >
  <div align="right">
<td><a class="fcc-btn" href="employeeHome.jsp">Home</a></td>
	<td><a class="fcc-btn" type="button" onclick= "Logout()">Logout</a></td>
 </div>

<div class="login-block">
  <h1>UPDATE DETAILS </h1>

 


	<table>
		<tr>
			<td>NAME</td><td><input type="text" readonly name="newname" value= "${name}" id="newname" required><br>
		    </td>
		</tr>
		<tr>
			<td>ACCOUNT NUMBER</td><td><input type="text" readonly name="newacc_num" value= "${acc_num}" id="newacc_num" required><br>
		    </td>
		</tr>
		<tr>
			<td>BANK BALANCE</td><td><input type="text" name="newbank_bal" value= "${bank_bal}" id="newbank_bal" required><br>
		    </td>
		</tr>
		<tr>
			<td>USERNAME</td><td><input type="text" readonly name="usrname" value = "${username}"  required><br>
			</td>
		</tr>
		<tr>
			<td>PASSWORD</td><td><input type="password" name="newpassword" value = "${password}" id="newpassword" required><br>
			</td>
		</tr>
		<tr>
			<td>TOTAL LOAN</td><td><input type="text" name="newtot_lon" value = "${tot_lon}" id="newtot_lon" required><br>
			</td>
		</tr>
		<tr>
			<td>ANNUAL INCOME</td><td><input type="text" name="newann_incm" value = "${ann_incm}" id="newann_incm" required><br>
			</td>
		</tr>
		<tr>
		<td><a class="fcc-btn" href="CusDetails.jsp">Cancel</a></td>
		<td><a class="fcc-btn" type="button" onclick="update()">Update</a></td>
		
		</tr>
	</table>
	
</div>
</form>
</body>
</html>