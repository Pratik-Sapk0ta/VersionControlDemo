<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="styles/main.css">
    </head>
    
    <body>
        <%@include file="header.jsp"%>
        
        <main>
            <h2>Create an Account</h2>
            
            <p>Register for a FOODE customer account.</p>
            
            <form action="register" method="post" onsubmit="return validateForm()">
                <p>
                    <label for ="username">Username:</label><br>
                    <input type="text" id="username" name="username" required>
                </p>

                <p>
                    <label for="email">Email:</label><br>
                    <input type="email" id="email" name="email" required>
                </p>

                <p>
                    <label for ="password">Password:</label><br>
                    <input type="password" id="password" name="password" required>
                </p>
                
                <p>
                    <label for ="confirmPassword">Confirm Password:</label><br>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </p>

                <p id="errorMessage" style="color: red;"></p>
                <button type="submit">Register</button>
            </form>
             <script>
                function validateForm() {
                    var password = document.getElementById("password").value;
                    var confirmPassword =
                            document.getElementById("confirmPassword").value;
                    
                    if(password !== confirmPassword) {
                        document.getElementById("errorMessage").textContent =
                                "Passwords do not match.";
                        return false;
                    }
                    alert("Registered");
                    return true;
                }
            </script>
            
            <p>
                Already have an account?
                <a href="login.jsp">Login</a> 
            </p>
        </main>
        
        <%@include file="footer.jsp"%>
        
    </body>
</html>
