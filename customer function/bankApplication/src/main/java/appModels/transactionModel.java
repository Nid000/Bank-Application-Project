package appModels;

public class transactionModel {
	private int acc_from;
	private String acc_to;
	private int amount;
	private String date;
	
	
	
	public transactionModel() {
		super();
	}
	public transactionModel(int acc_from, String acc_to, int amount, String date) {
		super();
		this.acc_from = acc_from;
		this.acc_to = acc_to;
		this.amount = amount;
		this.date = date;
	}
	public int getAcc_from() {
		return acc_from;
	}
	public void setAcc_from(int acc_from) {
		this.acc_from = acc_from;
	}
	public String getAcc_to() {
		return acc_to;
	}
	public void setAcc_to(String acc_to) {
		this.acc_to = acc_to;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}	
}
