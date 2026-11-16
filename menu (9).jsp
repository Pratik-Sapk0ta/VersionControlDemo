

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FOODE - Menu</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    
    <body>
        <%@include file="header.jsp"%>
        
        <main>
            <h2>Menu</h2>
            
            <p>Choose from our food and drinks.</p>
            
            <h2>Food</h2>
            
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Cheese burger</h3>
                    <p>A burger with cheese, lettuce, and tomato.</p>
                    <p>Price: $8.99</p>
                    
                    <form action="cart" method="post">
                        <input type="hidden" name="name" value="Cheese burger">
                        <input type="hidden" name="price" value="8.99">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </section>
            
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Cheese Pizza</h3>
                    <p>Pizza with cheese and tomato sauce.</p>
                    <p>Price: $12.99</p>
                    
                    <form action="cart" method="post">
                        <input type="hidden" name="name" value="Cheese Pizza">
                        <input type="hidden" name="price" value="12.99">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </section>
            
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Lemonade</h3>
                    <p>Fresh lemonade served cold.</p>
                    <p>Price: $2.99</p>
                    
                    <form action="cart" method="post">
                        <input type="hidden" name="name" value="Lemonade">
                        <input type="hidden" name="price" value="2.99">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </section> 
            
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Soda</h3>
                    <p>Cold and refreshing soda of your choice.</p>
                    <p>Price: $1.99</p>
                    
                    <form action="cart" method="post">
                        <input type="hidden" name="name" value="Soda">
                        <input type="hidden" name="price" value="1.99">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </section>
            
            <p>
                <a href="order.jsp">Order</a>
            </p>
        </main>
        <%@include file="footer.jsp"%>
    </body>
</html>
