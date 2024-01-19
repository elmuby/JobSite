<%-- 
    Document   : post_a_job
    Created on : Jan 4, 2024, 10:49:04 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
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
                background: url(assets/img/andrew-neel-cckf4TsHAuw-unsplash.jpg);
                background-repeat: no-repeat;
                background-size: cover;
                color: white;
                object-position: center;
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
        <link rel="stylesheet" href="assets/css/fonts.css" />
    </head>
    <body>
        <header class="my-header">
            <div class="overlay"></div>
            <div style="position: relative; z-index: 1;">
                <p>Post A Job</p>
                <br>
                <p style="font-size: 1.3rem;"><a href="">Home</a> / <a href="">job</a> / post a job</p>
            </div>
        </header>
        <main>
            <section class="main-div">
                <h2 class="post_job_header">Post A Job</h2>
                <div class="inner_div">
                    <form action="post_job" method="post">
                        <p class="form_heading_name">Job Details</p>
                        <hr style="margin-top: 20px;">
                        <br>
                        <!--to keep track of employerID-->
                        <input type="hidden" name="employerID" value="${EmployerID}"/>
                        
                        <div class="txt_feild">
                            <input name="job_name" placeholder="Job Name" type="text" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">
                                <path style="color:#fb246a;"
                                      d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z" />
                                </svg>
                                Job title
                            </label>
                        </div>
                        <div class="txt_feild">

                            <textarea name="description" placeholder="Enter Job Description here..." name="" id="" cols="30"
                                      rows="10"></textarea>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                     viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM112 256H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z" />
                                </svg>
                                Description
                            </label>
                        </div>

                        <div class="txt_feild">
                            <input name="location" placeholder="eg: No 5, Kanta Road EK House, Kaduna..." type="text" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                     viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                                </svg>
                                Location
                            </label>
                        </div>
                        <div class="txt_feild">
                            <textarea name="Requirements" placeholder="Enter Job Requirements (Age, Experience, Knowledge e.t.c)" name="" id=""
                                      cols="30" rows="10"></textarea>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="12"
                                     viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M64 0C28.7 0 0 28.7 0 64V448c0 35.3 28.7 64 64 64H320c35.3 0 64-28.7 64-64V160H256c-17.7 0-32-14.3-32-32V0H64zM256 0V128H384L256 0zM112 256H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z" />
                                </svg>
                                Requirements
                            </label>
                        </div>
                        
                        <div class="txt_feild">
                            <input name="vacancy" placeholder="Number of Slots Available..." type="number" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="20" viewBox="0 0 640 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM609.3 512H471.4c5.4-9.4 8.6-20.3 8.6-32v-8c0-60.7-27.1-115.2-69.8-151.8c2.4-.1 4.7-.2 7.1-.2h61.4C567.8 320 640 392.2 640 481.3c0 17-13.8 30.7-30.7 30.7zM432 256c-31 0-59-12.6-79.3-32.9C372.4 196.5 384 163.6 384 128c0-26.8-6.6-52.1-18.3-74.3C384.3 40.1 407.2 32 432 32c61.9 0 112 50.1 112 112s-50.1 112-112 112z"/></svg>
                                Vacancy
                            </label>
                        </div>
                        
                        <div class="txt_feild share">
                            <div>
                                <input name="salary" class="job_type_input" style="width: 70%;" placeholder="eg: 2000" type="number" required>
                                <select name="sal_currency" class="job_type_option" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Job Type">
                                    <option>Naira (N)</option>
                                    <option>Dollars ($)</option>
                                    <option>Others : Specify in Description Section </option>
                                </select>
                            </div>

                            <label class="nail" for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18"
                                     viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path class="jail"
                                      d="M64 64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H64zM272 192H496c8.8 0 16 7.2 16 16s-7.2 16-16 16H272c-8.8 0-16-7.2-16-16s7.2-16 16-16zM256 304c0-8.8 7.2-16 16-16H496c8.8 0 16 7.2 16 16s-7.2 16-16 16H272c-8.8 0-16-7.2-16-16zM164 152v13.9c7.5 1.2 14.6 2.9 21.1 4.7c10.7 2.8 17 13.8 14.2 24.5s-13.8 17-24.5 14.2c-11-2.9-21.6-5-31.2-5.2c-7.9-.1-16 1.8-21.5 5c-4.8 2.8-6.2 5.6-6.2 9.3c0 1.8 .1 3.5 5.3 6.7c6.3 3.8 15.5 6.7 28.3 10.5l.7 .2c11.2 3.4 25.6 7.7 37.1 15c12.9 8.1 24.3 21.3 24.6 41.6c.3 20.9-10.5 36.1-24.8 45c-7.2 4.5-15.2 7.3-23.2 9V360c0 11-9 20-20 20s-20-9-20-20V345.4c-10.3-2.2-20-5.5-28.2-8.4l0 0 0 0c-2.1-.7-4.1-1.4-6.1-2.1c-10.5-3.5-16.1-14.8-12.6-25.3s14.8-16.1 25.3-12.6c2.5 .8 4.9 1.7 7.2 2.4c13.6 4.6 24 8.1 35.1 8.5c8.6 .3 16.5-1.6 21.4-4.7c4.1-2.5 6-5.5 5.9-10.5c0-2.9-.8-5-5.9-8.2c-6.3-4-15.4-6.9-28-10.7l-1.7-.5c-10.9-3.3-24.6-7.4-35.6-14c-12.7-7.7-24.6-20.5-24.7-40.7c-.1-21.1 11.8-35.7 25.8-43.9c6.9-4.1 14.5-6.8 22.2-8.5V152c0-11 9-20 20-20s20 9 20 20z" />
                                </svg>
                                Salary
                            </label>
                        </div>
                        <div class="txt_feild">
                            <select name="nature" class="job_type_option job_nature" style="width: 100%;" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Job Type">
                                <option>Remote ( Online )</option>
                                <option>Onsite</option>
                                <option>Others : Specify in Description Section </option>
                            </select>
                            <label class="ahil" for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="18"
                                     viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path class="nahil"
                                      d="M576 128c0-35.3-28.7-64-64-64H64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64l352 0 0-128c0-17.7 14.3-32 32-32H576V128zM448 448L576 320H448l0 128zM96 128a32 32 0 1 1 0 64 32 32 0 1 1 0-64z" />
                                </svg>
                                nature
                            </label>
                        </div>
                        <div class="txt_feild">
                            <input name="date" type="date" required>
                            <label for="">
                                <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14"
                                     viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path
                                    d="M152 24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H64C28.7 64 0 92.7 0 128v16 48V448c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V192 144 128c0-35.3-28.7-64-64-64H344V24c0-13.3-10.7-24-24-24s-24 10.7-24 24V64H152V24zM48 192h80v56H48V192zm0 104h80v64H48V296zm128 0h96v64H176V296zm144 0h80v64H320V296zm80-48H320V192h80v56zm0 160v40c0 8.8-7.2 16-16 16H320V408h80zm-128 0v56H176V408h96zm-144 0v56H64c-8.8 0-16-7.2-16-16V408h80zM272 248H176V192h96v56z" />
                                </svg>
                                Deadline
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
                        <button style=" display: block; font-family: ubuntu; font-size: 20px; padding: 10px 20px; background-color: #fb246a; border: none; border-radius: 4px; color: white;" type="submit"> Submit </button>
                    </form>
                </div>
            </section>
        </main>
        <script>
            document.querySelector(".job_type_option").addEventListener("mouseenter", e => {
                document.querySelector(".nail").style.color = '#fb246a'
                document.querySelector(".jail").style.fill = '#fb246a'
            })
            document.querySelector(".job_type_option").addEventListener("mouseleave", e => {
                document.querySelector(".nail").style.color = 'black'
                document.querySelector(".jail").style.fill = 'black'
            })


            document.querySelector(".job_type_input").addEventListener("mouseenter", e => {
                document.querySelector(".nail").style.color = '#fb246a'
                document.querySelector(".jail").style.fill = '#fb246a'
            })
            document.querySelector(".job_type_input").addEventListener("mouseleave", e => {
                document.querySelector(".nail").style.color = 'black'
                document.querySelector(".jail").style.fill = 'black'
            })


            document.querySelector(".job_nature").addEventListener("mouseenter", e => {
                document.querySelector(".ahil").style.color = '#fb246a'
                document.querySelector(".nahil").style.fill = '#fb246a'
            })
            document.querySelector(".job_nature").addEventListener("mouseleave", e => {
                document.querySelector(".ahil").style.color = 'black'
                document.querySelector(".nahil").style.fill = 'black'
            })

        </script>
    </body>
</html>
<%@include file= "footer.jsp" %>