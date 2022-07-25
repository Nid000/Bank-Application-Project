package appModels;

/**
 * Customer Loan model
 */
public class loanModel {
	
	/**
	 * fields for loan model
	 */
	private String l_accnum;
	private int l_amount;
	private int l_paid;
	private int l_balance;
	private int acc_num;
	
	/**
	 * empty constructor
	 */
	public loanModel() {
		super();
	}
	
	/**
	 * constructor
	 * @param l_accnum
	 * @param l_amount
	 * @param l_paid
	 * @param l_balance
	 * @param acc_num
	 */
	public loanModel(String l_accnum, int l_amount, int l_paid, int l_balance, int acc_num) {
		super();
		this.l_accnum = l_accnum;
		this.l_amount = l_amount;
		this.l_paid = l_paid;
		this.l_balance = l_balance;
		this.acc_num = acc_num;
	}
	
	/**
	 * getters and setters for the fields.
	 * @return
	 */
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
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
}
