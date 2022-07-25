package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appController.appController1;

/**
 * Servlet implementation class applyLoan
 */
@WebServlet("/applyLoan")
public class applyLoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public applyLoan() {
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
		 * getting the required values from customer home page (customerHome.jsp)
		 */
		int acc_num = Integer.parseInt(request.getParameter("acc_num"));
		
		/**
		 * created an object (appc) of appcontroller1
		 * created variable of type integer (num) for storing the result from function in controller (automatically generating random number for loan account number).
		 * created variable of type string (loanacc) to add characters 'L-' to the result from previous method.
		 * created variable of type string (result) for storing the result from function in controller (to get the loan account number from loan database).
		 */
		appController1 appc = new appController1();
		int num = appc.getRandomNumberString();
		String loanacc = "L-"+num;
		String result = appc.getLoannum(loanacc);
		
		/**
		 * while statement to check the generated random number is already existed in the database.
		 * if the statement is true add 1 to the random number.
		 * add characters "L-" to the random number.
		 * this continues until we get a unique account number which doesn't exist in database,
		 */
		while(loanacc == result) {
			num = num + 1;
			loanacc = "L-"+num;
			result = appc.getLoannum(loanacc);
		}
		
		/**
		 * if the statement is false
		 * pass the random and unique loan account number to loan applying page (index.jsp).
		 */
		request.setAttribute("acc_num", acc_num);
		request.setAttribute("loanacc", loanacc);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
