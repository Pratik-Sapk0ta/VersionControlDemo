package murach.fv;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceText = request.getParameter("price");

        double price = Double.parseDouble(priceText);

        HttpSession session = request.getSession();

        ArrayList<CartItem> cart
                = (ArrayList<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean itemExists = false;

        for (CartItem item : cart) {
            if (item.getName().equals(name)) {
                item.increaseQuantity();
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            cart.add(new CartItem(name, price));
        }
        session.setAttribute("cart", cart);

        response.sendRedirect("order.jsp");
    }

}
