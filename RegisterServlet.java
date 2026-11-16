
package murach.fv;

import java.io.IOException;
import java.security.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage",
                    "Passwords do not match.");
            request.getRequestDispatcher("registration.jsp")
                    .forward(request, response);
            return;
        }
        
        try{
            String hashedPassword = hashPassword(password);
            
            String sql = "INSERT INTO customers "
                    + "(username, email, password) VALUES (?, ?, ?)";
            try(Connection connection = DBConnection.getConnection();
                    PreparedStatement statement =
                            connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2,email);
                statement.setString(3, hashedPassword);
                
                statement.executeUpdate();
            }
            
            request.setAttribute("successMessage",
                    "Your account has been created successfully.");
            request.getRequestDispatcher("login.jsp")
                    .forward(request, response);
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                request.setAttribute("errorMessage",
                        "Username or email already exists.");
                request.getRequestDispatcher("registration.jsp")
                        .forward(request, response);
            } else {
                throw new ServletException(
                "Unable to register customer.", e);
            }
        } catch (Exception e) {
            throw new ServletException(
                    "Unable to process password.", e);
        }
    }
    
    private String hashPassword(String password) 
        throws Exception {
            byte[] salt = new byte[16];
            SecureRandom random = new SecureRandom();
            random.nextBytes(salt);

            MessageDigest digest
                    = MessageDigest.getInstance("SHA-256");
            digest.update(salt);
            byte[] hashedPassword
                    = digest.digest(password.getBytes("UTF-8"));

            return Base64.getEncoder().encodeToString(salt)
                    + ":"
                    + Base64.getEncoder().encodeToString(hashedPassword);
        }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request,response);
    }
}