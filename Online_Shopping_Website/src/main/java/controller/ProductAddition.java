package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SellerDao;
import model.Seller;

/**
 * Servlet implementation class ProductAddition
 */
@WebServlet("/ProductAddition")
public class ProductAddition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private SellerDao sellerDao = new SellerDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductAddition() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/SellerLogin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String product_name = request.getParameter("product_name");
		String category = request.getParameter("category");
		String seller_id = request.getParameter("seller_id");
		String seller_name = request.getParameter("seller_name");
		String price = request.getParameter("price");
		String stock = request.getParameter("stock");
		String weight = request.getParameter("weight");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String date = request.getParameter("date");

		

		Seller seller = new Seller();
		seller.setProduct_name(product_name);
		seller.setCategory(category);
		seller.setSeller_id(seller_id);
		seller.setSeller_name(seller_name);
		seller.setPrice(price);
		seller.setStock(stock);
		seller.setWeight(weight);
		seller.setColor(color);
		seller.setSize(size);
		seller.setDate(date);
		
		try {
			sellerDao.registerProduct(seller);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/ProductAddSuccess.jsp");
		dispatcher.forward(request, response);
	}

}
