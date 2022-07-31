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
 * Servlet implementation class loanDetailsEmp
 */
@WebServlet("/loanDetailsEmp")
public class loanDetailsEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loanDetailsEmp() {
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
		
		int acc_no = Integer.parseInt(request.getParameter("acc_num"));
		appController cnt = new appController();
		loanModel lm = cnt.get_loandetails(acc_no);
		request.setAttribute("acc_num", acc_no);
		request.setAttribute("l_acc", lm.getL_accnum());
		request.setAttribute("l_amount", lm.getL_amount());
		request.setAttribute("l_paid", lm.getL_paid());
		request.setAttribute("l_balance", lm.getL_balance());
		request.getRequestDispatcher("LoanDetailsEmp.jsp").forward(request, response);
	}

}
