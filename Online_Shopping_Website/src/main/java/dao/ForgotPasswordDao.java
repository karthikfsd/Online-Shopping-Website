package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ForgotPassword;

public class ForgotPasswordDao {
    public boolean update(ForgotPassword forgotPassword) throws ClassNotFoundException {
        boolean status = true;
        String email = forgotPassword.getEmail();
        String answer = forgotPassword.getAnswer();
        String password = forgotPassword.getPassword();  
        

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/online_shop?useSSL=true", "root", "admin");

            PreparedStatement preparedStatement = connection
            .prepareStatement("update customer set password = '"+password+"' where email = '"+email+"' and security_question = '"+answer+"'")) {


            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
          

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
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
