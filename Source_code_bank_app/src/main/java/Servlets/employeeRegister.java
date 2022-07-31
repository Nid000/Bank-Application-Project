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
 * Servlet implementation class employeeRegister
 */
@WebServlet("/register")
public class employeeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeeRegister() {
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
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		System.out.println(name + username + password1 + password2 + "look here");
		
		if(password1.equals(password2)) {
			EmployeeDao empd = new EmployeeDao();
			Employee employee = new Employee();
			employee.setname(name);
			employee.setUsername(username);
			employee.setPassword1(password1);
			employee.setPassword2(password2);

			
			try {
				empd.registerEmployee(employee);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("register", "* Registration successful, please Log in.");
			request.getRequestDispatcher("employeeLogin.jsp").forward(request, response);
			
		}else {
			request.setAttribute("name", name);
			request.setAttribute("username", username);
			request.setAttribute("mismatch", "* Password mismatch");
			request.getRequestDispatcher("employeeregister.jsp").forward(request, response);
		}

		
	}

}
