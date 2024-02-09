<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="Project.ConnectionProvider" %>
<%@include file= "header.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <title>Contact</title>
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
            background: url(./andrew-neel-cckf4TsHAuw-unsplash.jpg);
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
        .txt_feild textarea, .job_type_option {
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
        .job_type_option{
            width: 29%;
        }
        .txt_feild textarea {
            height: 200px;
        }

        .txt_feild input:focus, .job_type_option:focus,
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
    </style>

<body>


    <!-- Hero Area Start-->
    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Contact us</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Hero Area End -->
    <!-- ================ contact section start ================= -->
<main>
        <section class="main-div">
            
            <div class="inner_div">
                <form action="ContactAction" method="post">
                    <br>
                    <div class="txt_feild">
                        <input name="name" placeholder="your name" type="text" required>
                        <label for="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                                <path style="color:#fb246a;"
                                    d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z" />
                            </svg>
                            Full name
                        </label>
                    </div>
                    <div class="txt_feild">
                        <input name="email" placeholder="xyz@gamil.com" type="email" required>
                        <label for="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                            viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path
                                d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM112 256H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z" />
                        </svg>
                            Email
                        </label>
                    </div>
                    <div class="txt_feild">
                        
                        <textarea name="message" placeholder="Enter message here..." id="" cols="30"
                            rows="10"></textarea>
                        <label for="">
                            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM112 256H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z" />
                            </svg>
                            Message
                        </label>
                    </div>
                 
             
           
                    <button style=" display: block; font-family: ubuntu; font-size: 20px; padding: 10px 20px; background-color: #fb246a; border: none; border-radius: 4px; color: white;" type="submit"> Submit </button>
                </form>
            </div>
        </section>
    </main>
    <!-- ================ contact section end ================= -->

    </body>
    
    </html>
    <%@include file= "footer.jsp" %>