<%-- 
    Document   : profile
    Created on : Jan 4, 2024, 2:45:29 PM
    Author     : DELL
--%>
<%@include file= "header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Document</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            .profile_img {
                width: 200px;
                height: 200px;
                overflow: hidden;
                border-radius: 7px;
                padding-bottom: 10px;
            }

            .profile_img>img {
                width: 100%;
                object-fit: cover;
                object-position: center;

            }

            .section_1 {
                display: flex;
                align-items: center;
                justify-content: space-evenly;
                background-color: ghostwhite;
                padding: 10px 0;
            }

            .comp_info {
                display: flex;
                /* align-items: center; */
                justify-content: space-evenly;
                flex-direction: column;
                gap: .5rem;
            }

            .comp_info>h2 {
                font-family: exo;
            }

            .edit_profile {
                font-family: ubuntu;
                font-size: 20px;
                padding: 10px 20px;
                background-color: #fb246a;
                border: none;
                border-radius: 4px;
                color: white;
            }

            .location {
                display: flex;
                align-items: center;
                gap: .5rem;
                font-size: 1.5rem;
                color: #969595;
                font-family: barlow;
            }
            .location > a {
                text-decoration: none;
                color: lightcoral;
                transition: .7s;
            }
            .location > a:hover{
                text-decoration: underline;
                color: black;
            }
            .section_2{
                padding: 20px;
            }
            .jobs_posted{
                padding: 5px;
                /* background-color:bisque; */
                border-bottom: 4px solid #fb246a;
                font-family: system-ui;
                font-size: 2rem;
            }
        </style>
    </head> 
    <body>
        <!-- <h6 style="background-color: blanchedalmond; padding: 30px; font-size: 6rem;">header right here</h6> -->
        <br>
        <section class="section_1">
            <div class="comp_info">
                <div class="profile_img">
                    <img src='data:image/png;base64, ${base64Image}'alt="Logo">
                </div>
                <h2>${companyName}</h2>
                <p style="width: 400px; font-family: Barlow; font-size: 20px; color: #969595;">${company_description}</p>
                <p class="location">
                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="16"
                         viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#969595"
                          d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                    </svg>
                    ${company_location}
                </p>
                <div class="location">
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16"
                         viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#969595"
                          d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z" />
                    </svg>
                    <p>${company_phoneNo}</p>
                </div>

                <div class="location">
                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="20"
                         viewBox="0 0 640 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#969595"
                          d="M579.8 267.7c56.5-56.5 56.5-148 0-204.5c-50-50-128.8-56.5-186.3-15.4l-1.6 1.1c-14.4 10.3-17.7 30.3-7.4 44.6s30.3 17.7 44.6 7.4l1.6-1.1c32.1-22.9 76-19.3 103.8 8.6c31.5 31.5 31.5 82.5 0 114L422.3 334.8c-31.5 31.5-82.5 31.5-114 0c-27.9-27.9-31.5-71.8-8.6-103.8l1.1-1.6c10.3-14.4 6.9-34.4-7.4-44.6s-34.4-6.9-44.6 7.4l-1.1 1.6C206.5 251.2 213 330 263 380c56.5 56.5 148 56.5 204.5 0L579.8 267.7zM60.2 244.3c-56.5 56.5-56.5 148 0 204.5c50 50 128.8 56.5 186.3 15.4l1.6-1.1c14.4-10.3 17.7-30.3 7.4-44.6s-30.3-17.7-44.6-7.4l-1.6 1.1c-32.1 22.9-76 19.3-103.8-8.6C74 372 74 321 105.5 289.5L217.7 177.2c31.5-31.5 82.5-31.5 114 0c27.9 27.9 31.5 71.8 8.6 103.9l-1.1 1.6c-10.3 14.4-6.9 34.4 7.4 44.6s34.4 6.9 44.6-7.4l1.1-1.6C433.5 260.8 427 182 377 132c-56.5-56.5-148-56.5-204.5 0L60.2 244.3z" />
                    </svg>
                    <a href="${company_website}">${company_website}</a>
                </div>
            </div>
            <a href="<%= request.getContextPath()%>/EditProfile?EmployerID=${EmployerID}">
                <button class="edit_profile">
                    Edit Profile
                </button>
            </a>
        </section>
        <section class="section_2">
            <div class="jobs_posted">${count} Jobs Posted </div>

            <div>
                <!-- Retrieve the list from the request from jobListing.java -->
                <c:forEach var="s" items="${jobList}">
                <div class="single-job-items mb-30">
                    <div class="job-items">
                        <div class="company-img">
                            
                            <a href=""><img src='data:image/png;base64,${s.base64Image}' alt="logo"></a>
                        </div>
                        <div class="job-tittle">
                            <a href=""><h4>${s.jobTitle}</h4></a>
                            <ul>
                                <li>${s.companyName}</li>
                                <li><i class="fas fa-map-marker-alt"></i>${s.location}</li>
                                <li>${s.salaryRange}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="items-link f-right">
                        <a href="">${s.jobNature}</a>
                        <a href="<%= request.getContextPath()%>/edit_job?jobID=${s.jobID}&employerID=${s.employerID}">Edit</a>
                        <a href="<%= request.getContextPath()%>/DeleteJob?jobID=${s.jobID}&employerID=${s.employerID}">Delete</a>
<!--                        <span>7 hours ago</span>-->
                    </div>
                </div>
              </c:forEach>
            </div>

        </section>
    </body>
</html>
<%@include file= "footer.jsp" %>