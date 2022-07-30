package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class applyLoanServlet
 */
@WebServlet("/applyLoanServlet")
public class applyLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyLoanServlet() {
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
		// TODO Auto-generated method stub
		String name = request.getParameter("message2");
		int acc = Integer.parseInt(request.getParameter("acc_num"));
		int lacc = Integer.parseInt(request.getParameter("l_acc"));
		int lbal = Integer.parseInt(request.getParameter("l_bal"));
		System.out.println(name + " this person has this " + lacc + " loan account num, " + lbal + " loan balance.");
		request.setAttribute("name", name);
		request.setAttribute("accno", acc);
		request.setAttribute("l_acc", lacc);
		request.setAttribute("l_bal", lbal);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
