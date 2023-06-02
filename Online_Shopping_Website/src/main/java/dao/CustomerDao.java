package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.catalina.connector.Response;

import model.Customer;

public class CustomerDao {

	public int registerCustomer(Customer customer) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO online_shop.customer" +
            "  (username, email,security_question, password, re_password, firstname, lastname, streetname, aptno, city, zipcode, state, country, contact) VALUES " +
            " (?, ?, ?, ?,?, ?,?,?,?,?,?,?,?,?);";

        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, customer.getUsername());
            preparedStatement.setString(2, customer.getEmail());
            preparedStatement.setString(3, customer.getAnswer());
            preparedStatement.setString(4, customer.getPassword());
            preparedStatement.setString(5, customer.getRe_passowrd());
            preparedStatement.setString(6, customer.getFirstname());
            preparedStatement.setString(7, customer.getLastname());
            preparedStatement.setString(8, customer.getStreetname());
            preparedStatement.setString(9, customer.getAptno());
            preparedStatement.setString(10, customer.getCity());
            preparedStatement.setString(11, customer.getZipcode());
            preparedStatement.setString(12, customer.getState());
            preparedStatement.setString(13, customer.getCountry());
            preparedStatement.setString(14, customer.getContact());
            
            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
            
            

        } catch (SQLException e) {
            
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
