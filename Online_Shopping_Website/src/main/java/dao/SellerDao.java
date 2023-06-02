package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Seller;
public class SellerDao {
	public int registerProduct(Seller seller) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO online_shop.products" +
            "  (product_name, category, seller_id, seller_name, price, stock, weight, color, size, date) VALUES " +
            " (?, ?, ?, ?, ?,?,?,?,?,?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, seller.getProduct_name());
            preparedStatement.setString(2, seller.getCategory());
            preparedStatement.setString(3, seller.getSeller_id());
            preparedStatement.setString(4, seller.getSeller_name());
            preparedStatement.setString(5, seller.getPrice());
            preparedStatement.setString(6, seller.getStock());
            preparedStatement.setString(7, seller.getWeight());
            preparedStatement.setString(8, seller.getColor());
            preparedStatement.setString(9, seller.getSize());
            preparedStatement.setString(10, seller.getDate());
            

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
