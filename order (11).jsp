
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="murach.fv.CartItem"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FOODE - My Order</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>

    <body>

        <%@include file="header.jsp"%>

        <main>

            <h2>Shopping Cart</h2>

            <p>Review the food and drink you want to order.</p>
  
            <section>
                <h3>Items in your order</h3>

                <%
                    ArrayList<CartItem> cart
                            = (ArrayList<CartItem>) session.getAttribute("cart");
                    if (cart == null || cart.isEmpty()) {
                %>  

                <p>Your cart is empty.</p>
                <%
                } else {
                    for (CartItem item : cart) {
                %>               
                <div class="menu-item">
                    <div class="food-info">

                        <h3><%= item.getName()%></h3>

                        <p>Price: $<%= String.format("%.2f", item.getPrice())%></p>

                        <p>Quantity: <%= item.getQuantity()%></p>

                        <p>Subtotal: $<%= String.format("%.2f", item.getSubtotal())%></p>

                    </div>
                </div>


                <%
                        }

                    }
                %>


            </section>

            <p>
                <a href="menu.jsp">Continue Shopping</a>
            </p>

            <p>
                <a href="checkout.jsp">Proceed to Checkout</a>
            </p>
        </main>
        <%@include file="footer.jsp"%>
    </body>
</html>
