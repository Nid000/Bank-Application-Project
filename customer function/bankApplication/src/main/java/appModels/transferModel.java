package appModels;

public class transferModel {
	private int f_account;
	private String t_account;
	private int amount;
	
	public transferModel(int f_account, String t_account, int amount) {
		super();
		this.f_account = f_account;
		this.t_account = t_account;
		this.amount = amount;
		
	}
	public transferModel() {
		super();
	}
	
	public int getF_account() {
		return f_account;
	}
	public void setF_account(int f_account) {
		this.f_account = f_account;
	}
	public String getT_account() {
		return t_account;
	}
	public void setT_account(String t_account) {
		this.t_account = t_account;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}


}
