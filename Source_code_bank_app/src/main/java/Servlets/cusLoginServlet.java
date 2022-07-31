package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appController.appController;
import appModels.customerModel;


/**
 * Servlet implementation class cusLoginServlet
 */
@WebServlet("/cusLogin")
public class cusLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cusLoginServlet() {
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
		 * getting the required values from login page (customerLogin.jsp).
		 * Created httpSession.
		 */
		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		String submitType = request.getParameter("submit");
		HttpSession session=request.getSession();
		
		/**
		 * created an object (appc) of appcontroller.
		 * created an object (cus) of customerModel.
		 * @param username
		 * @param password
		 */
		appController cnt = new appController();
		customerModel cus = cnt.getCustomer(username, password);
		
		/**
		 * if statement for checking the credentials entered in login page
		 * if true, stored the username and password in a session and passed to home servlet (Home.java)
		 */
		if (submitType.equals("login") && cus != null && cus.getUsername() != null) {
			session.setAttribute("uname", username);
			session.setAttribute("pswd", password);
			request.getRequestDispatcher("home").forward(request, response);
		} 
		
		/**
		 * if False redirect to login page with failure message.
		 */
		else {
			request.setAttribute("message1", "* Please enter valid username and password.");
			request.getRequestDispatcher("customerLogin.jsp").forward(request, response);
		}
	}
}
