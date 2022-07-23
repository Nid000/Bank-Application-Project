package net.javaguides.registration.model;

public class Customer {
	
	private String name;
	private String username;
	private String password1;
	private String password2;
	private int account_number;
	private int bank_balance;
	private int annual_income;
	private int total_loans;
	
	public Customer(String name, String username, String password1, String password2, int account_number,
			int bank_balance, int annual_income, int total_loans) {
		super();
		this.name = name;
		this.username = username;
		this.password1 = password1;
		this.password2 = password2;
		this.account_number = account_number;
		this.bank_balance = bank_balance;
		this.annual_income = annual_income;
		this.total_loans = total_loans;
	}
	
	public Customer() {
		super();
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public int getAccount_number() {
		return account_number;
	}
	public void setAccount_number(int account_number) {
		this.account_number = account_number;
	}
	public int getBank_balance() {
		return bank_balance;
	}
	public void setBank_balance(int bank_balance) {
		this.bank_balance = bank_balance;
	}
	public int getAnnual_income() {
		return annual_income;
	}
	public void setAnnual_income(int annual_income) {
		this.annual_income = annual_income;
	}
	public int gettotal_loans() {
		return total_loans;
	}
	public void settotal_loans(int total_loans) {
		this.total_loans = total_loans;
	}	
}
