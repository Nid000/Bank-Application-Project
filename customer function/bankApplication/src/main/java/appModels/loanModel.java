package appModels;

public class loanModel {
	private String l_accnum;
	private int l_amount;
	private int l_paid;
	private int l_balance;
	
	
	
	public loanModel() {
		super();
	}
	public loanModel(String l_accnum, int l_amount, int l_paid, int l_balance) {
		super();
		this.l_accnum = l_accnum;
		this.l_amount = l_amount;
		this.l_paid = l_paid;
		this.l_balance = l_balance;
	}
	public String getL_accnum() {
		return l_accnum;
	}
	public void setL_accnum(String l_accnum) {
		this.l_accnum = l_accnum;
	}
	public int getL_amount() {
		return l_amount;
	}
	public void setL_amount(int l_amount) {
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
	
	

}
