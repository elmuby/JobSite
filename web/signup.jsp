<%-- 
    Document   : signup
    Created on : Jan 2, 2024, 5:29:29 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page</title>
        <link rel="stylesheet" href="assets/css/signin.css" />
    </head>
    <body>
        <main class="main">
            <div style="position: absolute; margin-left: -10cm;">
                <svg xmlns="http://www.w3.org/2000/svg" height="32" width="32" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM231 127c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-71 71L376 232c13.3 0 24 10.7 24 24s-10.7 24-24 24l-182.1 0 71 71c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L119 273c-9.4-9.4-9.4-24.6 0-33.9L231 127z"/></svg>
            </div>
            <h1>SignUp</h1>
            <form action="signup" method="POST">
                <div class="txt_feild">
                    <input name="name" type="text" required>
                    <span></span>
                    <label for="">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img" d="M512 80c8.8 0 16 7.2 16 16V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V96c0-8.8 7.2-16 16-16H512zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM208 256a64 64 0 1 0 0-128 64 64 0 1 0 0 128zm-32 32c-44.2 0-80 35.8-80 80c0 8.8 7.2 16 16 16H304c8.8 0 16-7.2 16-16c0-44.2-35.8-80-80-80H176zM376 144c-13.3 0-24 10.7-24 24s10.7 24 24 24h80c13.3 0 24-10.7 24-24s-10.7-24-24-24H376zm0 96c-13.3 0-24 10.7-24 24s10.7 24 24 24h80c13.3 0 24-10.7 24-24s-10.7-24-24-24H376z"/></svg>
                        FULLNAME</label>
                </div>
                <div class="txt_feild">
                    <input name="email" type="email" required>
                    <span></span>
                    <label for="">
                        <svg style="color:#fb246a;" xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img" d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>
                        EMAIL</label>
                </div>
                <div class="txt_feild" >
                    <label for="">
                        <svg style="color:#fb246a;" xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img" d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>
                        Role</label>
                    <select name="role" style="width: 100%; 
                            font-family: 'Barlow', sans-serif;
                            padding: 5px;
                            height: 40px;
                            font-size: 18px;
                            border: 2px solid lightgray;
                            border-radius: 4px;
                            outline: none;
                            transition: .5s;
                            " class="job_type_option" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Job Type">
                        <option>Role</option>

                        <option>Job Seeker</option>
                        <option>Employer</option>

                    </select>
                </div>

                <div class="txt_feild">
                    <input name="pass" type="password" required>
                    <span></span>
                    <label for="">
                        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path class="img"  d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
                        PASSWORD</label>
                </div>
                <input type="submit" value="Signup">
                <%
                    // Check for the presence of the error message
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                <p style="font-size: 1.2rem; font-family: barlow; text-align: center; color: #fb246a;"><%= errorMessage%></p>
                <%
                    }
                %>
                <div class="sign_up_link">
                    Already Have an account? <a href="signin.jsp">SignIn</a>
                </div>
            </form>
        </main>
        <script>
// Wait for the DOM content to load
            document.addEventListener('DOMContentLoaded', function () {
// Get the email and password input fields
                const emailInput = document.querySelector('input[type="email"]');
                const passwordInput = document.querySelector('input[type="password"]');

// Check if the fields have values (autofill)
                if (emailInput.value !== '') {
                    emailInput.parentNode.classList.add('active');
                }

                if (passwordInput.value !== '') {
                    passwordInput.parentNode.classList.add('active');
                }

// Add event listeners for input focus and blur
                [emailInput, passwordInput].forEach(input => {
                    input.addEventListener('focus', function () {
                        this.parentNode.classList.add('active');
                    });

                    input.addEventListener('blur', function () {
                        if (this.value === '') {
                            this.parentNode.classList.remove('active');
                        }
                    });
                });
            });
        </script>

    </body>
</html>
