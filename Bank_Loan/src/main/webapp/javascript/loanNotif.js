 function loanNotif(l_bal) {
			try {
				var date = new Date();
				var day = date.getDate();
				var l_bal = document.getElementById("l_bal").value;
				
					if(day == "1" && l_bal != null) {
						console.log("try if loan balance: " + l_bal);
						console.log(day);
						alert('Reminder to make your payment for your loan balance.');
					}
					else {
						console.log("try else loan balance: " + l_bal);
						console.log("It is day "+ day + " of the month, not the time to remind loan payment.")
					}
				}
			catch (e) {
				console.log(e);
			}	
		}