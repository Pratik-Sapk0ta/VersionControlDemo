

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FOODE - Login</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    <body>
        <%@include file="header.jsp"%>
        
        <main>
            <h2>Customer Login</h2>
            <p>Login to your account.</p>
            
            <form action="login" method="post">
                <p>
                    <label for="username">Username:</label><br>
                    <input type="text" id="username" name="username" required>
                </p>

                <p>
                    <label for="password">Password:</label><br>
                    <input type="password" id="password" name="password" required>
                </p>

                <button type="submit">Login</button>
            </form>   
            <p>
                Don't have an account?
                <a href="registration.jsp">Register</a>
            </p>
        </main>
        <%@include file="footer.jsp"%>
    </body>
</html>
