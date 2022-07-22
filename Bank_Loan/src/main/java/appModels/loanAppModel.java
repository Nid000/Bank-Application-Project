package appModels;

public class loanAppModel {
	
		private int acc_num;
		private String username;
		private String name;
		private int annualinc;
		private int loan_acc;
		private int loan_amt;
		private int loan_bal;
		
		public loanAppModel() {
			super();
		}


		public loanAppModel(int acc_num, String username, String name, int annualinc, int loan_acc, int loan_amt, int loan_bal) {
			super();
			this.acc_num = acc_num;
			this.username = username;
			this.name = name;
			this.annualinc = annualinc;
			this.loan_acc = loan_acc;
			this.loan_amt = loan_amt;
			this.loan_bal = loan_bal;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		
		public String getName() {
			return name;
		}
		
		public void setIncome(int annualinc) {
			this.annualinc = annualinc;
		}
		
		public int getIncome() {
			return annualinc;
		}
		
		public void setAcc(int acc_num) {
			this.acc_num = acc_num;
		}
		
		public int getAcc() {
			return acc_num;
		}
		
		public void setBalance(int loan_bal) {
			this.loan_bal = loan_bal;
		}
		
		public int getBalance() {
			return loan_bal;
		}
		
		public void setLoan(int acc_num, int loan_amt, int loan_bal, int loan_acc) {
			this.acc_num = acc_num;
			this.loan_amt = loan_amt;
			this.loan_bal = loan_bal;
			this.loan_acc = loan_acc;
		}
}
