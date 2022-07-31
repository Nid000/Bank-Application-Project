package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appController.appController1;

/**
 * Servlet implementation class cusAccnum
 */
@WebServlet("/cusAccnum")
public class cusAccnum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cusAccnum() {
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
		HttpSession session=request.getSession();
		appController1 appc = new appController1();
		int account = appc.getRandomNumberString();
		int result = appc.getcusAccnum(account);
		
		while(account == result) {
			account = account + 1;
			result = appc.getcusAccnum(account);
		}
		request.setAttribute("account", account);
		request.setAttribute("name", session. getAttribute( "name" ));
		request.setAttribute("username", session. getAttribute( "username" ));
		request.setAttribute("bbalance", session. getAttribute( "bbalance" ));
		request.setAttribute("aincome", session. getAttribute( "aincome" ));
		request.setAttribute("error", session. getAttribute( "error" ));
		request.getRequestDispatcher("CustomerReg.jsp").forward(request, response);
	}

}
