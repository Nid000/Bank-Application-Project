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
			String username = null;
			request.getSession().setAttribute("username", username);
			int loanAmt = Integer.parseInt(request.getParameter("loanAmt"));
			int duration = Integer.parseInt(request.getParameter("duration"));
			String payout = request.getParameter("payout");
			String submitType = request.getParameter("submit");
			
			appController cnt = new appController();
			loanAppModel setter = new loanAppModel();
			loanAppModel getter = new loanAppModel();
			
			int annualIncome = getter.getIncome();
			int loanBalance = getter.getBalance();
			double loanCheck = (annualIncome * 1.5) - loanBalance;

			if (submitType.equals("submit") && loanCheck > 0) {
				//request.getAttribute("l_acc", setter.setLoan(accNum, loanAmt, ));
				request.getRequestDispatcher("customerHome.jsp").forward(request, response);
			} else {
				request.setAttribute("message1", "You have too much loan on hand. Your application was denied.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
}
