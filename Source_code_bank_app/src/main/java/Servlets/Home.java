package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appController.appController;
import appModels.customerDetails;
import appModels.customerModel;
import appModels.loanModel;

/**
 * Servlet implementation class Home
 */
@WebServlet(name = "homeServlet", urlPatterns = { "/home" })
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
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
		 * Created a httpsession.
		 * retrieved the value stored in http session.
		 * created an object (appc) of appcontroller.
		 * created an object (cus) of customerModel.
		 * stored the result from function in controller.
		 * created variable of integer type ()acc_num to store the result of function in controller.
		 * created variable of loanModel type (lm) to store the result of function in controller.
		 */
		HttpSession session=request.getSession();
		String usrname = (String) session. getAttribute( "uname" );
		appController cnt = new appController();
		customerDetails cd = new customerDetails();
		cd = cnt.get_cusdetails(usrname);
		int acc_num = cd.getAcc_num();
		loanModel lm = cnt.get_loandetails(acc_num);
		
		/**
		 * passed all customer details and loan details values as messages to customer home page (customerHome.jsp).
		 */
		request.setAttribute("message2",cd.getName());
		request.setAttribute("accno", cd.getAcc_num());
		request.setAttribute("accamount", cd.getBbalance());
		request.setAttribute("l_acc", lm.getL_accnum());
		request.setAttribute("l_amount", lm.getL_amount());
		request.setAttribute("l_paid", lm.getL_paid());
		request.setAttribute("l_balance", lm.getL_balance());
		request.getRequestDispatcher("customerHome.jsp").forward(request, response);
	}
}
