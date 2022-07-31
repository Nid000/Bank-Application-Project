package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appModels.Customer;
import appController.CustomerDao;

/**
 * Servlet implementation class cusCreateServlet
 */
@WebServlet("/cusServlet")
public class cusCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cusCreateServlet() {
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
		System.out.println("I reached here Customer servlet.............");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		int account_number = Integer.parseInt(request.getParameter("account_number"));
		int bank_balance = Integer.parseInt(request.getParameter("bank_balance"));
		int annual_income = Integer.parseInt(request.getParameter("annual_income"));
		System.out.println(name + username + password1 + password2 + account_number + bank_balance + annual_income +"look here");
		HttpSession session=request.getSession();
		if(password1.equals(password2)) {
		
		Customer customer = new Customer();
		CustomerDao cd = new CustomerDao();
		customer.setName(name);
		customer.setUsername(username);
		customer.setPassword1(password1);
		customer.setPassword2(password2);
		customer.setAccount_number(account_number);
		customer.setBank_balance(bank_balance);
		customer.setAnnual_income(annual_income);
		
		try {
			cd.registerCustomer(customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("success1", "* Customer account created successfully.");
		request.getRequestDispatcher("employeeHome.jsp").forward(request, response);
		}else {
			session.setAttribute("name", name);
			session.setAttribute("username", username);
			session.setAttribute("bbalance", bank_balance);
			session.setAttribute("aincome", annual_income);
			session.setAttribute("error", "Password mismatch" );
			request.getRequestDispatcher("cusAccnum").forward(request, response);
		}
		}

}
