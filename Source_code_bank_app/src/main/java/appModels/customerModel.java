package appModels;

/**
 * Customer login model
 */
public class customerModel {
	
	/**
	 * Created login fields.
	 */
	private String username;
	private String password1;
	
	/**
	 * empty constructor
	 */
	public customerModel() {
		super();
	}

	/**
	 * constructor
	 */
	public customerModel(String username, String password1) {
		super();
		this.username = username;
		this.password1 = password1;
	}
	
	/**
	 * getters and setter for the fields
	 */
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
}
