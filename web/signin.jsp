<%-- 
    Document   : signin
    Created on : Jan 2, 2024, 2:18:33 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/signin.css" />
    </head>
    <body>
        <main class="main">
            <h1 id="your_email" >LOGIN</h1>
            <form action="signin" method="POST" >
                <div class="txt_feild">
                    <input name="your_email" type="email" required>
                    <span></span>
                    <label for=""><svg style="color:#fb246a;" xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img" d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg> EMAIL</label>
                </div>
                <div class="txt_feild">
                    <input name="your_pass" type="password" required>
                    <span></span>
                    <label for=""> <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img"  d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg> PASSWORD</label>
                </div>
                <%
                    // Check for the presence of the error message
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <p style="font-size: 1.2rem; font-family: barlow; text-align: center; color: #fb246a;"><%= errorMessage%></p>
                <%
                    }
                %>
                <div class="pass">FORGOT PASSWORD?
                </div>
                <input type="submit" value="login">
                <div class="sign_up_link">
                    Not a Member? <a href="signup.jsp">signup</a>
                </div>
            </form>
        </main>
    </body>
</html>
