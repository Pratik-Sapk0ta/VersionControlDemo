<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Restaurant POS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/main.css">
    </head>
    
    <body>
        
        <%@include file="header.jsp"%>
        
        <main>
            <h2>Welcome to FOODE</h2>
            
            <p>Enjoy delicious food and drinks at a affordable prices.</p>
            
            <h2>Popular Food</h2>
            
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Cheeseburger</h3>
                    <p>A burger with cheese, lettuce, and tomato.</p>
                    <p>Price: $8.99</p>
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
                </div>
            </section>
            
            <h2>Popular Drinks</h2>
            <section class="menu-item">
                <div class="food-picture">
                    Coming soon
                </div>
                
                <div class="food-info">
                    <h3>Lemonade</h3>
                    <p>Fresh lemonade served cold.</p>
                    <p>Price: $2.99</p>
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
                </div>
            </section>
            
            <p>
                <a href="menu.jsp">View Full Menu</a>
            </p>
           
            <p>
                <a href="order.jsp">Place an Order</a>
            </p>
        </main>
        <%@ include file="footer.jsp"%>
    </body>
</html>
