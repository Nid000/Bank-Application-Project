package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LonDetUpdServlet
 */
@WebServlet("/LonDetUpdServlet")
public class LonDetUpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LonDetUpdServlet() {
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
		int account_number = Integer.parseInt(request.getParameter("ACCOUNT_NUMBER"));
		String loan_acc_number = request.getParameter("LOAN_ACC_NUMBER");
		int l_amount = Integer.parseInt(request.getParameter("L_AMOUNT"));
		int l_paid = Integer.parseInt(request.getParameter("L_PAID"));
		int l_balance = Integer.parseInt(request.getParameter("L_BALANCE"));
		

		request.setAttribute("account_number", account_number);
		request.setAttribute("loan_acc_number", loan_acc_number);
		request.setAttribute("l_amount", l_amount);
		request.setAttribute("l_paid", l_paid);
		request.setAttribute("l_balance", l_balance);
		request.getRequestDispatcher("LoanDetUpd.jsp").forward(request, response);
	}

}
