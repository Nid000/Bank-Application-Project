package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appController.EmployeeDao;
import appModels.Employee;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		System.out.println("reached emp login");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String submitType = request.getParameter("submitb");
		
		Employee employee = new Employee();
		
		EmployeeDao empd = new EmployeeDao();
		
			try {
				
			employee = empd.getEmployee( username,  password1);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		
		System.out.println(employee.getUsername() + employee );
		if(submitType.equals("Login") && employee != null && employee.getUsername() != null){
			request.getRequestDispatcher("employeeHome.jsp").forward(request, response);
			} 		
		else {
			request.setAttribute("message1", "* Please enter valid username and password.");
			request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
			}
		}
	}
	


