package net.javaguides.registration.model;

public class TransactionHistory {
	
	private String  date;
	private int acc_from;
	private int acc_to;
	private int amount;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAcc_from() {
		return acc_from;
	}
	public void setAcc_from(int acc_from) {
		this.acc_from = acc_from;
	}
	public int getAcc_to() {
		return acc_to;
	}
	public void setAcc_to(int acc_to) {
		this.acc_to = acc_to;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
