package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appController.appController;
import appModels.loanModel;

/**
 * Servlet implementation class transferServlet
 */
@WebServlet("/transfer")
public class transferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		/**
		 * getting the required values from money transfer page (transferMoney.jsp).
		 * created an object (appc) of appcontroller.
		 * created variable of type string (t_cusacc) for storing the result from function in controller
		 * created variable of type string (t_loanacc) for storing the result from function in controller
		 */
		int f_account =  Integer.parseInt(request.getParameter("f_account"));
		String t_account = request.getParameter("t_account");
		int amount = Integer.parseInt(request.getParameter("amount"));
		appController ac = new appController();
		String t_cusacc = ac.gett_account(t_account) ;
		String t_loanacc = ac.gett_loanacc(t_account);
		
		/**
		 * if statement to validate the account number is a customer account number.
		 * if true, execute the function in controller. 
		 * then pass the success message with necessary details to customer home page.
		 */
		if(t_cusacc.equals(t_account)){
			try {
				ac.update_balance(f_account,t_account,amount);
				ac.transaction_his(f_account, t_account,amount);
				request.setAttribute("success", "Transaction of SGD" + amount + " to the account "+ t_account +" is Successful");
				request.getRequestDispatcher("home").forward(request, response);
				} catch (Exception e) {
					System.out.println(e);
				}
		}
		
		/**
		 * if the above statement is not satisfied, the program will try to find the entered account number in loan account number
		 * if true, execute the function in controller. 
		 * created variable of type loanModel (lm) for storing the result from function in app controller.
		 */
		else if(t_loanacc.equals(t_account)) {
			ac.update_loanbalance(f_account, t_account, amount);
			ac.transaction_his(f_account, t_account,amount);
			loanModel lm = ac.check_loan(t_account);
			
			/**
			 * loan details are stored in below created variable.
			 * difference of loan amount and loan paid is stored inside variable called balance.
			 */
			int loan_amt = lm.getL_amount();
			int loan_paid = lm.getL_paid();
			int balance = loan_amt-loan_paid;
			
			/**
			 * if balance is 0, customer settled the loan fully
			 * execute the function in controller
			 * pass the loan completion message to customer home page
			 */
			if(balance == 0) {
				ac.delete_loan(t_account, f_account);
				try {
					request.setAttribute("success1", "Congratulations, your loan is fully paid");
					request.getRequestDispatcher("home").forward(request, response);
					} catch (Exception e) {
						System.out.println(e);
					}
				
			}
			
			/**
			 * if balance is not zero, customer just made a normal payment of loan
			 * passed the transaction successfull mesage to customer home page.
			 * nested if statement finished.
			 */
			else {
			try {
				request.setAttribute("success", "Transaction of SGD" + amount + " to the loan account "+ t_account +" is Successful");
				request.getRequestDispatcher("home").forward(request, response);
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}
		
		/**
		 * if the code reached below lines, the application unable to find the entered account number in any database.
		 * invalid account number
		 * retry message passed to the money transfer web page  
		 */
		else {
			request.setAttribute("accno", f_account);
			request.setAttribute("error12", "Please enter a valid account number.");
			request.getRequestDispatcher("transferMoney.jsp").forward(request, response);
		}	
	}
}
