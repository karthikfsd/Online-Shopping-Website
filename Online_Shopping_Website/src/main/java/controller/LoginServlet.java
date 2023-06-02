package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import dao.LoginDao;
import model.LoginBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private LoginDao loginDao;
	
	 public void init() {
	        loginDao = new LoginDao();
	    }
	 
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			response.getWriter().append("Served at: ").append(request.getContextPath());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Login.jsp");
			dispatcher.forward(request, response);
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {

		        String username = request.getParameter("username");
		        String password = request.getParameter("password");
		        LoginBean loginBean = new LoginBean();
		        loginBean.setUsername(username);
		        loginBean.setPassword(password);

		        try {
		            if (loginDao.validate(loginBean)) {
		                HttpSession session = request.getSession();
		                session.setAttribute("username",username);
		            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Home.jsp");
		        		dispatcher.forward(request, response);
		            } else {
		                //HttpSession session = request.getSession();
		                //session.setAttribute("user", username);
		            	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/Login.jsp");
		        		dispatcher.forward(request, response);
		            }
		        } catch (ClassNotFoundException e) {
		            e.printStackTrace();
		        }
		    }
}
