package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/AddToCarts.jsp");
		dispatcher.forward(request, response);
		String username = request.getParameter("username");
		String product_id = request.getParameter("product_id");
		HttpSession session = request.getSession();
        session.setAttribute("username",username);
        session.setAttribute("product_id",product_id);
	}



}
