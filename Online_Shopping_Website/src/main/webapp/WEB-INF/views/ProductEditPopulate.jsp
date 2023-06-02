<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@include file ="SellerHeader.jsp" %>
    <%@page import=" java.sql.*"%>
    <%
    String product_id = request.getParameter("product_id");
    String product_name = request.getParameter("product_name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String stock = request.getParameter("stock");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

            PreparedStatement preparedStatement = 
           connection.prepareStatement("update products set product_id='"+product_id+"', product_name='"+product_name+"', category='"+category+"', price='"+price+"', stock='"+stock+"' where product_id ='"+product_id+"'")) {


            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
            %>
            
            <form action="<%= request.getContextPath() %>/ProductEditSuccess" method="get"><i class='fas fa-pen-fancy'></i></form>
    <%
        }
        catch(Exception e)
        {
        	System.out.println(e);
        	
        }
        %>