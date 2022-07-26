package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.CustomerDao;
import net.javaguides.registration.dao.LoandetailsDao;
import net.javaguides.registration.model.Customer;
import net.javaguides.registration.model.LoanDetails;

/**
 * Servlet implementation class LoanDetEditServlet
 */
@WebServlet("/LoanDetEditServlet")
public class LoanDetEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoanDetEditServlet() {
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

		LoanDetails ld = new LoanDetails();
		LoandetailsDao up = new LoandetailsDao();
		
		int newloan_amt = Integer.parseInt(request.getParameter("newloan_amt"));
		int newloan_paid = Integer.parseInt(request.getParameter("newloan_paid"));
		int newloan_bal = Integer.parseInt(request.getParameter("newloan_bal"));
		int newaccnum = Integer.parseInt(request.getParameter("newaccnum"));
		System.out.print(newloan_amt +  newloan_paid + newloan_bal + newaccnum+ "++++++++table");
		
		ld.setL_amount_(newloan_amt);
		ld.setL_paid(newloan_paid);
		ld.setL_balance(newloan_bal);
		ld.setAccount_number(newaccnum);
		;
	
		up.insertUpdatedLD(ld);
		request.setAttribute("success1message", "Updation done, Thank you");
		request.getRequestDispatcher("LoanDetails.jsp").forward(request, response);
	}
}
