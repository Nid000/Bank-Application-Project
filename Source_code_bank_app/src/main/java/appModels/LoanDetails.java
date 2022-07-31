package appModels;

public class LoanDetails {
	private String loan_acc_number;
	private int l_amount;
	private int l_paid;
	private int l_balance;
	private int account_number;
	public String getLoan_acc_number() {
		return loan_acc_number;
	}
	public void setLoan_acc_number(String loan_acc_number) {
		this.loan_acc_number = loan_acc_number;
	}
	public int getL_amount() {
		return l_amount;
	}
	public void setL_amount_(int l_amount) {
		this.l_amount = l_amount;
	}
	public int getL_paid() {
		return l_paid;
	}
	public void setL_paid(int l_paid) {
		this.l_paid = l_paid;
	}
	public int getL_balance() {
		return l_balance;
	}
	public void setL_balance(int l_balance) {
		this.l_balance = l_balance;
	}
	public int getAccount_number() {
		return account_number;
	}
	public void setAccount_number(int account_number) {
		this.account_number = account_number;
	}
	
}
