package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class customerServlet
 */
@WebServlet("/customerServlet")
public class customerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerServlet() {
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
		 * getting the required values from customer home page (customerHome.jsp).
		 */
		int acc = Integer.parseInt(request.getParameter("acc_num"));
		int accamount = Integer.parseInt(request.getParameter("accamount"));
		
		/**
		 * passed the captured values as messages to money transfer page (transfermoney.jsp).
		 */
		request.setAttribute("accno", acc);
		request.setAttribute("accamount", accamount);
		request.getRequestDispatcher("transferMoney.jsp").forward(request, response);
	}
}
