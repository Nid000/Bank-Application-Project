package appModels;

public class customerDetails {
	
	private String name;
	private int acc_num;
	private char username;
	private char password;
	private int bbalance;
	private int anualinc;
	private int tloans;
	
	
	
	public customerDetails() {
		super();
	}
	
	public customerDetails(String name, int acc_num, char username, char password, int bbalance, int anualinc,
			int tloans) {
		super();
		this.name = name;
		this.acc_num = acc_num;
		this.username = username;
		this.password = password;
		this.bbalance = bbalance;
		this.anualinc = anualinc;
		this.tloans = tloans;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(int acc_num) {
		this.acc_num = acc_num;
	}
	public char getUsername() {
		return username;
	}
	public void setUsername(char username) {
		this.username = username;
	}
	public char getPassword() {
		return password;
	}
	public void setPassword(char password) {
		this.password = password;
	}
	public int getBbalance() {
		return bbalance;
	}
	public void setBbalance(int bbalance) {
		this.bbalance = bbalance;
	}
	public int getAnualinc() {
		return anualinc;
	}
	public void setAnualinc(int anualinc) {
		this.anualinc = anualinc;
	}
	public int getTloans() {
		return tloans;
	}
	public void setTloans(int tloans) {
		this.tloans = tloans;
	}
	
	
	

}
