package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import net.javaguides.registration.model.Employee;
import net.javaguides.registration.dao.EmployeeDao;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String submitType = request.getParameter("submit");
		System.out.println("I am here " + username + password1 + submitType);
		
		Employee employee = new Employee();
		
		EmployeeDao empd = new EmployeeDao();
		
			try {
				
			employee = empd.getEmployee( username,  password1);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			System.out.println(employee.getUsername() + employee );
			if(submitType.equals("login") && employee != null && employee.getUsername() != null) {
		//		request.setAttribute("message2", cd.get_name(username));
				request.getRequestDispatcher("Home.jsp").forward(request, response);
	} 		else {
				request.setAttribute("message1", "Data not found, click on register");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
	}
}
