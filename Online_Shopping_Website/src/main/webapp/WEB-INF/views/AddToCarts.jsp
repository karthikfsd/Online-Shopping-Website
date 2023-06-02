<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import=" java.sql.*"%>
        <link rel="stylesheet" href="css/signup-style.css">
        <%
    String username = "karthik";
    int product_id = 1;
    int quantity =1;
    int product_price =0;
    int product_total=0;
    int cart_total=0;
    int z=0;
    
	Class.forName("com.mysql.cj.jdbc.Driver");
try (Connection connection = DriverManager
        .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

        PreparedStatement preparedStatement = connection
        .prepareStatement("select product_id, product_name, category, price,stock  from products where product_id ='"+product_id+"'")) {


        System.out.println(preparedStatement);
        ResultSet rs =preparedStatement.executeQuery();
    while(rs.next())
    {
    	product_price =rs.getInt(4);
    	product_total =product_price;
    }
    ResultSet rs1 = preparedStatement.executeQuery("Select * from cart where product_id = '"+product_id+"' and username='"+username+"'");
    while(rs1.next())
    {
    	cart_total=rs1.getInt(5);
    	cart_total=cart_total+product_total;
    	quantity=rs1.getInt(3);
    	quantity=quantity+1;
    	z=1;
    }
    if(z==1)
    {
    	preparedStatement.executeUpdate("update cart set total ='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and username='"+username+"' ");
    	%>
        
               <form action="<%= request.getContextPath() %>/HomeServlet" method="get"><i class='fas fa-pen-fancy'></i>
        <h1>Product Successfully Added to Cart</h1>
        <input type ="submit" value="Back"></form>
<%
    }
    
    	PreparedStatement preparedStatement1 = connection
    	        .prepareStatement("insert into cart(username,product_id,quantity,price,total) values(?,?,?,?,?)");
    	preparedStatement1.setString(1, username);
    	preparedStatement1.setInt(2, product_id);
    	preparedStatement1.setInt(3, quantity);
    	preparedStatement1.setInt(4, product_price);
    	preparedStatement1.setInt(5, product_total);
    	preparedStatement1.executeUpdate();
%>
        
        <form action="<%= request.getContextPath() %>/HomeServlet" method="get"><i class='fas fa-pen-fancy'></i>
        <h1>Product Successfully Added to Cart</h1>
        <input type ="submit" value="Back"></form>
<%
    
}
        catch(Exception e)
        {
        	System.out.println(e);
        	
        }
        %>