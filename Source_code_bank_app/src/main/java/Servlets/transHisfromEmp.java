package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appController.appController;
import appModels.transactionModel;

/**
 * Servlet implementation class transHisfromEmp
 */
@WebServlet("/transHisfromEmp")
public class transHisfromEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transHisfromEmp() {
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
		appController ac = new appController();
		ArrayList<transactionModel> t_transaction = ac.get_thistory(acc_no);
		ArrayList<transactionModel> f_transaction = ac.get_fhistory(String.valueOf(acc_no));
		request.setAttribute("t_trans", t_transaction);
		request.setAttribute("f_trans", f_transaction);
		request.setAttribute("acc_num", acc_no);
		request.getRequestDispatcher("transHistoryfromEmp.jsp").forward(request, response);
	}

}
