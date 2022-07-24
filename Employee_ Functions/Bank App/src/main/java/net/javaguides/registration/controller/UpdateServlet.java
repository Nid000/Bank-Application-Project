package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		String name = request.getParameter("NAME");
		int acc_num = Integer.parseInt(request.getParameter("ACCOUNT_NUMBER"));
		int bank_bal = Integer.parseInt(request.getParameter("BANK_BALANCE"));
		String username = request.getParameter("USERNAME");
		String password = request.getParameter("PASSWORD");
		int tot_lon = Integer.parseInt(request.getParameter("TOTAL_LOANS"));
		int ann_incm = Integer.parseInt(request.getParameter("ANNUAL_INCOME"));


		request.setAttribute("name", name);
		request.setAttribute("acc_num", acc_num);
		request.setAttribute("bank_bal", bank_bal);
		request.setAttribute("username", username);
		request.setAttribute("password", password);
		request.setAttribute("tot_lon", tot_lon);
		request.setAttribute("ann_incm", ann_incm);
		request.setAttribute("success1message", "Deletion done, Thank you");
		request.getRequestDispatcher("Update.jsp").forward(request, response);
	}

}
