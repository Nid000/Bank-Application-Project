package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appController.LoandetailsDao;

/**
 * Servlet implementation class loanDeleteEmp
 */
@WebServlet("/LonDetDelServlet")
public class loanDeleteEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loanDeleteEmp() {
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
		System.out.println("reached delte");
		String loan_acc_number = request.getParameter("LOAN_ACC_NUMBER");
		int acc_num = Integer.parseInt(request.getParameter("ACCOUNT_NUMBER"));
		System.out.println(loan_acc_number);
		LoandetailsDao  ld = new LoandetailsDao();
		ld.delete(loan_acc_number,acc_num);
		request.setAttribute("success2", "Loan deleted successfully");
		request.getRequestDispatcher("CusDetails.jsp").forward(request, response);
	}

}
