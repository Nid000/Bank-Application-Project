 function NameAndLoan(username) {
			try {
				var date = new Date();
				var day = date.getDate();
				
					if(day == "1") {
						console.log(day);
						alert('Reminder to make your payment for your loan balance.');
					}
					else {
						console.log("It is day "+ day + " of the month, not the time to remind loan payment.")
					}
				}
			catch (e) {
				console.log(e);
			}	
		}