<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update </title>
</head>
<script>
function Logout(){
	document.forms[0].action = "LogOutServlet";
	document.forms[0].method = 'post';
	document.forms[0].submit();
}

function cancel(){
	document.forms[0].action = "CusDetailsServlet";
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

<div align="center">
  <h1>UPDATE DETAILS </h1>
  <div align="right">
	<button type="button" onclick= "Logout()">Logout</button>
 </div>
 
  <form >

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
		<td><button type="button" onclick= "cancel()">Cancel</button></td>
		<td><button type="button" onclick="update()">Update</button></td>
			
		
	</table>
	</form>
</div>
</body>
</html>