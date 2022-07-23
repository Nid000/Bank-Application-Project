package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appController.appController;
import appModels.loanAppModel;


/**
 * Servlet implementation class applicationServlet
 */
@WebServlet("/application")
	public class applicationServlet extends HttpServlet {
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
			//To get values from the input fields. Values to be pumped into loan accounts table in DB.
			int loanAmt = Integer.parseInt(request.getParameter("loanAmt"));
			int duration = Integer.parseInt(request.getParameter("duration"));
			String payout = request.getParameter("payout");
			String submitType = request.getParameter("submit");
			
			//Initialise controller, getter and setter.
			appController cnt = new appController();
			loanAppModel setter = new loanAppModel();
			loanAppModel getter = cnt.get_details("ltest");
			
			//To get loan account number from bank_customers table if any.
			String loanAcc = getter.getLoanAcc();			
			
			//Upon submit and if no loan account exists. Insert loan application
			if (submitType.equals("submit") && loanAcc == null) {
				int annualIncome = getter.getIncome();
				int loanBalance = getter.getBalance();
				double loanCheck = (annualIncome * 1.5) - loanBalance;
				request.setAttribute("message1", "Loan application of " + loanAmt + "was successful.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.setAttribute("message1", "You currently have a loan on hand. Your application was denied.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
}
