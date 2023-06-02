package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import model.Customer;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/register")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CustomerDao customerDao = new CustomerDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/CustomerRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String answer = request.getParameter("answer");
		String password = request.getParameter("password");
		String re_passowrd = request.getParameter("re_passowrd");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String streetname = request.getParameter("streetname");
		String aptno = request.getParameter("aptno");
		String city = request.getParameter("city");
		String zipcode = request.getParameter("zipcode");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String contact = request.getParameter("contact");
		
		Customer customer = new Customer();
		customer.setUsername(username);
		customer.setEmail(email);
		customer.setAnswer(answer);
		customer.setPassword(password);
		customer.setRe_passowrd(re_passowrd);
		customer.setFirstname(firstname);
		customer.setLastname(lastname);
		customer.setStreetname(streetname);
		customer.setAptno(aptno);
		customer.setCity(city);
		customer.setZipcode(zipcode);
		customer.setState(state);
		customer.setCountry(country);
		customer.setContact(contact);
		
		try {
			customerDao.registerCustomer(customer);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/CustomerSuccess.jsp");
		dispatcher.forward(request, response);
	}

}
