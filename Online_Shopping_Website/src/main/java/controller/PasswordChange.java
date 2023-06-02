package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ForgotPasswordDao;
import dao.LoginDao;
import model.ForgotPassword;
import model.LoginBean;

/**
 * Servlet implementation class PasswordChange
 */
@WebServlet("/PasswordChange")
public class PasswordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ForgotPasswordDao forgotPasswordDao;
	
	 public void init() {
		 forgotPasswordDao = new ForgotPasswordDao();
	    }
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Forgotpassword.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  	String email = request.getParameter("email");
	        String answer = request.getParameter("answer");
	        String password = request.getParameter("password");
	        ForgotPassword forgotPassword = new ForgotPassword();
	        forgotPassword.setEmail(email);
	        forgotPassword.setAnswer(answer);
	        forgotPassword.setPassword(password);

	        try {
	            forgotPasswordDao.update(forgotPassword);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/PasswordChangeSuccess.jsp");
    		dispatcher.forward(request, response);
	}

}
