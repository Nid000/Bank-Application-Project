package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import appController.appController;
import appModels.customerDetails;
import appModels.loanModel;

/**
 * Servlet implementation class applicationServlet
 */
@WebServlet("/application")
	public class applicationServlet extends HttpServlet {
	
	/**
	 * ignore the code below.
	 */
		private static final long serialVersionUID = 1L;    
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public applicationServlet() {
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
			 * getting the loan details from apply loan web page (index.jsp)
			 */
	 		int	acc_num = Integer.parseInt(request.getParameter("acc_num"));
			String loanacc = request.getParameter("loanNum");
			int loanAmt = Integer.parseInt(request.getParameter("loanAmt"));
			
			/**
			 * created an object (lm) of loanModel and stored the above values inside it.
			 */
			loanModel lm = new loanModel();
			lm.setL_accnum(loanacc);
			lm.setL_amount(loanAmt);
			lm.setL_balance(loanAmt);
			lm.setAcc_num(acc_num);
			
			/**
			 * created an abject (ap) of appController.
			 */
			appController ap = new appController();
			/**
			 * created variable cd of type customerDetails for storing the result from the function in controller. 
			 * created new variable of type double for storing the result from annual income multiplied by 1.5.
			 * created new variable of integer type for storing the result from function in controller.
			 * @param acc_num
			 */
			customerDetails cd = ap.get_newcusdetails(acc_num);
			double aincome = cd.getAnualinc() * 1.5;
			int tloans = cd.getTloans();
			
			/**
			 * if statement for loan approval
			 * 1st condition is applied loan amount must be less than annual income * 1.5.
			 * 2nd condition is total number of loan must be zero before applying loan
			 * if both conditions are satisfied then execute function in controller
			 * redirect to customer home page with success message of loan approval 
			 */
			if(loanAmt <= aincome && tloans == 0) {
				ap.update_Loan(lm);
				ap.update_total_Loan(acc_num);
				request.setAttribute("success3", "Loan application of SGD" + loanAmt + " was successful.");
				request.getRequestDispatcher("home").forward(request, response);
			}
			
			/**
			 * if both conditions are not satisfied, redirect to same page with the failed message.
			 */
			else {
				request.setAttribute("success4", "You currently have a loan on hand or you are not eligible to get this loan. Your application was denied.");
				request.getRequestDispatcher("applyLoan").forward(request, response);
			}
		}
}


