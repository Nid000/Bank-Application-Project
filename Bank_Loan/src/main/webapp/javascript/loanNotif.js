 function NameAndLoan(username) {
			try {
				var date = new Date();
				var day = date.getDate();
				
					if(day == "1") {
						console.log(day);
						alert('Reminder to make your payment for your loan balance.');
					}
				}
			catch (e) {
				console.log(e);
			}	
		}