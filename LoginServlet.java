/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String sql = "SELECT customer_id, password "
                + "FROM customers WHERE username = ?";

        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement
                = connection.prepareStatement(sql)) {
            statement.setString(1, username);

            try (ResultSet result = statement.executeQuery()) {
                if (result.next()) {
                    int customerID = result.getInt("customer_id");
                    String storedPassword = result.getString("password");

                    String[] parts = storedPassword.split(":", 2);

                    byte[] salt = Base64.getDecoder().decode(parts[0]);
                    byte[] storedHash
                            = Base64.getDecoder().decode(parts[1]);

                    MessageDigest digest
                            = MessageDigest.getInstance("SHA-256");
                    digest.update(salt);

                    byte[] enteredHash
                            = digest.digest(password.getBytes("UFT-8"));

                    if (MessageDigest.isEqual(storedHash, enteredHash)) {
                        HttpSession session = request.getSession();

                        session.setAttribute("customerId", customerID);
                        session.setAttribute("username", username);

                        response.sendRedirect("menu.jsp");
                    } else {
                        request.setAttribute("errorMessage",
                                "Incorrect username or password.");

                        request.getRequestDispatcher("login.jsp")
                                .forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage",
                            "Incorrect username or password.");

                    request.getRequestDispatcher("login.jsp")
                            .forward(request, response);
                }
            }
        } catch (Exception e) {
            throw new ServletException("Unable to login.", e);
        }
    }
}
