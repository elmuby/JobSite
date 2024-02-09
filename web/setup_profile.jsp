
<%@include file= "header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Ubuntu', sans-serif;
        }

        .my-header {
            position: relative;
            width: 100%;
            padding-top: 50px;
            padding-bottom: 150px;
            padding-left: 100px;
            background: url(assets/img/van-tay-media-hv6CJFGQtS0-unsplash.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            color: white;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .my-header p {
            font-size: 3rem;
            z-index: 1;
        }

        .my-header p>a {
            color: lightcoral;
            text-decoration: none;
        }

        .my-header p>a:hover {
            color: white;
            text-decoration: underline;
            transition: .5s;
        }

        .main-div {
            padding: 50px;
        }

        .post_job_header {
            font-family: 'Barlow', sans-serif;
            font-size: 2rem;
        }

        .inner_div {
            margin-top: 40px;
            border: 2px solid lightgray;
            border-radius: 5px;
            width: 100%;
            /* height: 70vh; */
        }

        form {
            padding: 20px;
        }

        .form_heading_name {
            font-size: 2rem;
            color: lightgray;
        }

        .txt_feild {
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin: 40px 0;
            padding-bottom: 10px;
            /* margin-bottom: 20px; */
        }

        .txt_feild input,
        .txt_feild textarea,
        .job_type_option {
            font-family: 'Barlow', sans-serif;
            width: 100%;
            padding: 5px;
            height: 40px;
            font-size: 18px;
            border: 2px solid lightgray;
            border-radius: 4px;
            outline: none;
            transition: .5s;
        }

        .job_type_option {
            width: 29%;
        }

        .txt_feild textarea {
            height: 200px;
        }

        .txt_feild input:focus,
        .job_type_option:focus,
        .txt_feild textarea:focus {
            border: 2px solid #fb246a;
        }

        .txt_feild label {
            font-family: 'Barlow', sans-serif;
            font-size: 20px;
            display: flex;
            align-items: center;
            gap: .4rem;
            color: black;
            position: absolute;
            top: -25px;
            transform: translateY(-50%);
            transition: .5s;
        }

        .job_type_option:focus .nail {
            color: #fb246a;
        }

        .txt_feild input:focus~label,
        .txt_feild textarea:focus~label {
            color: #fb246a;
        }

        .txt_feild input:focus~label>svg>path,
        .txt_feild textarea:focus~label>svg>path {
            fill: #fb246a;
        }

        .file-input-container {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        /* Style for the visible button */
        .file-input-button {
            background-color: #fb246a;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style for the hidden file input */
        .hidden-file-input {
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;
            cursor: pointer;
        }

        .profile_img {
            width: 200px;
            height: 200px;
            overflow: hidden;
            border-radius: 7px;
            border: 3px solid #fb246a;
            padding-bottom: 10px;
        }

        .profile_img>img {
            width: 100%;
            object-fit: cover;
            object-position: center;

        }
    </style>
    </head>
    <body>
        <header class="my-header">
        <div class="overlay"></div>
        <div style="position: relative; z-index: 1;">
            <p>Company Profile</p>
            <br>
            <p style="font-size: 1.3rem;"><a href="">Home</a> / <a href="">Company Profile</a> / Setup Profile</p>
        </div>
    </header>
    <main>
        <!--to retrieve the id from the session..-->
        <% 
            String id = "";
            if(request.getAttribute("id") != null){
               id = request.getAttribute("id").toString();
            }else{
                request.setAttribute("errorMessage", "Sign In first");
                request.getRequestDispatcher("signin.jsp").forward(request, response);
            }
           
        %>
        <section class="main-div">
            <h2 class="post_job_header">Setup Your Company Profile</h2>
            <div class="inner_div">
                <form action="Setup_Profile" method="post" enctype="multipart/form-data">
                    <!--to send the id to Setup_profile servlet-->
                    <input type="hidden" name="id" value="<%=id%>">
                    
                    <p class="form_heading_name">Company Details</p>
                    <hr style="margin-top: 20px;">

                    <div class="txt_feild">
                        <div class="profile_img">
                            <img src='' alt="">
                        </div>
                        <div class="file-input-container">
                            <button class="file-input-button">Add Image</button>
                            <input class="hidden-file-input" type="file" accept="image/*" name="company_logo">
                        </div>
                    </div>




                        <div class="txt_feild">
                            <input name="companyName" placeholder="Enter Company Name" type="text" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18"
                                     viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" />
                                </svg>
                                Company Name
                            </label>
                        </div>
                        
                        <div class="txt_feild">

                            <textarea name="company_description" placeholder="Enter Company Description here..." name="company_description" id=""
                                      cols="30" rows="10"></textarea>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                     viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM112 256H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z" />
                                </svg>
                                Company Description
                            </label>
                        </div>

                        <div class="txt_feild">
                            <input name="company_location" placeholder="eg: No 5, Kanta Road EK House, Kaduna..." type="text" value=""
                                   required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                     viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                                </svg>
                                Company Location
                            </label>
                        </div>


                        <div class="txt_feild">
                            <input name="company_website" placeholder="Direct Link to Website eg: https://niitkaduna.ng.com..."
                                   type="text" value="" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="20"
                                     viewBox="0 0 640 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M579.8 267.7c56.5-56.5 56.5-148 0-204.5c-50-50-128.8-56.5-186.3-15.4l-1.6 1.1c-14.4 10.3-17.7 30.3-7.4 44.6s30.3 17.7 44.6 7.4l1.6-1.1c32.1-22.9 76-19.3 103.8 8.6c31.5 31.5 31.5 82.5 0 114L422.3 334.8c-31.5 31.5-82.5 31.5-114 0c-27.9-27.9-31.5-71.8-8.6-103.8l1.1-1.6c10.3-14.4 6.9-34.4-7.4-44.6s-34.4-6.9-44.6 7.4l-1.1 1.6C206.5 251.2 213 330 263 380c56.5 56.5 148 56.5 204.5 0L579.8 267.7zM60.2 244.3c-56.5 56.5-56.5 148 0 204.5c50 50 128.8 56.5 186.3 15.4l1.6-1.1c14.4-10.3 17.7-30.3 7.4-44.6s-30.3-17.7-44.6-7.4l-1.6 1.1c-32.1 22.9-76 19.3-103.8-8.6C74 372 74 321 105.5 289.5L217.7 177.2c31.5-31.5 82.5-31.5 114 0c27.9 27.9 31.5 71.8 8.6 103.9l-1.1 1.6c-10.3 14.4-6.9 34.4 7.4 44.6s34.4 6.9 44.6-7.4l1.1-1.6C433.5 260.8 427 182 377 132c-56.5-56.5-148-56.5-204.5 0L60.2 244.3z" />
                                </svg>
                                Website
                            </label>
                        </div>
                        
                        <div class="txt_feild">
                            <input name="company_email" placeholder="abc@gmail.com"
                                   type="email" value="" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16"
                                     viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path 
                                    d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z" />
                                </svg>
                                Email
                            </label>
                        </div>

                        <div class="txt_feild">
                            <input name="companyPhoneNo" placeholder="+234 91 6122 230"
                                   type="number" value="" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16"
                                     viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path 
                                    d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z" />
                                </svg>
                                Phone No
                            </label>
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
                    <button
                        style=" display: block; font-family: ubuntu; font-size: 20px; padding: 10px 20px; background-color: #fb246a; border: none; border-radius: 4px; color: white;"
                        type="submit"> Submit </button>
                </form>
            </div>
        </section>
    </main>
    </body>
</html>
<%@include file= "footer.jsp" %>