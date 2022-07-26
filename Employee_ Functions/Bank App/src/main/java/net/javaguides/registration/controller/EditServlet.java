package net.javaguides.registration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.CustomerDao;
import net.javaguides.registration.model.Customer;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		

			Customer cus = new Customer();
			CustomerDao up = new CustomerDao();

			int newbank_bal = Integer.parseInt(request.getParameter("newbank_bal"));
			String pwsd = request.getParameter("newpassword");
			int newtot_lon = Integer.parseInt(request.getParameter("newtot_lon"));
			int newann_incm = Integer.parseInt(request.getParameter("newann_incm"));
			int newacc_num = Integer.parseInt(request.getParameter("newacc_num"));
			
			cus.setBank_balance(newbank_bal);
			cus.setPassword1(pwsd);
			cus.settotal_loans(newtot_lon);
			cus.setAnnual_income(newann_incm);
			cus.setAccount_number(newacc_num);
			
			System.out.print(newbank_bal + "   "+ pwsd+ "   " +newtot_lon+ "    "+newann_incm+"    "+ newacc_num+"    "+  "pool");
			try {
			up.insertUpdatedCus(cus);
			}
			catch(Exception e) {
				System.out.println(e);
			}

			request.setAttribute("success1message", "Updation done, Thank you");
			request.getRequestDispatcher("CusDetails.jsp").forward(request, response);
	}
}
