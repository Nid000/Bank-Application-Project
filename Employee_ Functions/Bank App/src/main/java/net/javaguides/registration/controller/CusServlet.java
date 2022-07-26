package net.javaguides.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.CustomerDao;
import net.javaguides.registration.model.Customer;
import net.javaguides.registration.model.Employee;


/**
 * Servlet implementation class CusServlet
 */
@WebServlet("/CusServlet")
public class CusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CustomerDao customerDao = new CustomerDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		
		Customer customer = new Customer();
		customer.setName(name);
		customer.setUsername(username);
		customer.setPassword1(password1);
		customer.setPassword2(password2);
		customer.setAccount_number(account_number);
		customer.setBank_balance(bank_balance);
		customer.setAnnual_income(annual_income);
		
		try {
			customerDao.registerCustomer(customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
	}

}
