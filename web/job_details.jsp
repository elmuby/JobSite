<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="Project.ConnectionProvider" %>
<%@include file= "header.jsp" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <title>Job Details </title>

    </head>

    <body>
        <main>
            <!-- To keep track of the jobID and EmployerID-->
            <input type="hidden" value='${EmployerID}' name='EmployerID'>
            <input type="hidden" value='${JobID}' name='JobID'>
            
            <!-- Hero Area Start-->
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="assets/img/img4.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2> ${jobTitle} </h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Area End -->



            <!-- job post company Start -->
            <div class="job-post-company pt-120 pb-120">
                <div class="container">
                    <div class="row justify-content-between">
                        <!-- Left Content -->
                        <div class="col-xl-7 col-lg-8">
                            <!-- job single -->
                            <div class="single-job-items mb-50">
                                <div class="job-items">
                                    <div class="company-img company-img-details">
                                        <img src= 'data:image/png;base64,${base64Image}' alt="Company Logo">
                                             <!---->
                                    </div>
                                    <div class="job-tittle">
                                       
                                            <h4>${jobTitle}</h4>
                                        
                                        <ul>
                                            <li> ${employerName} </li>
                                            <li>${location} <i class="fas fa-map-marker-alt"></i></li>
                                            <li> ${salaryRange} </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- job single End -->

                            <div class="job-post-details">
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Job Description</h4>
                                    </div>
                                    <ul>
                                        <li>${jobDescription}</li>
                                    </ul>
                                    
                                </div>
                                <div class="post-details2  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Required Knowledge, Skills, and Abilities</h4>
                                    </div>
                                    <ul>
                                        <li>${requiredKnowledge}</li>
                                    </ul>
                                </div>
                                <div class="post-details2  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Education + Experience</h4>
                                    </div>
                                    <ul>
                                        <li>{educationNExperience} </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <!-- Right Content -->
                        <div class="col-xl-4 col-lg-4">
                            <div class="post-details3  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Job Overview</h4>
                                </div>
                                <ul>
                                    <li>Posted date : <span> ${postedDate} </span></li>
                                    <li>Location : <span>  ${location} </span></li>
                                    <li>Vacancy : <span>  ${vacancy}</span></li>
                                    <li>Job nature : <span> ${jobNature} </span></li>
                                    <li>Salary :  <span> ${salaryRange} </span></li>
                                    <li>Application date : <span> ${applicationDate} </span></li>
                                </ul>
                                <div class="apply-btn2">
                                    <a href="<%= request.getContextPath()%>/ApplicationPage?jobID=${JobID}&employerID=${EmployerID}" class="btn">Apply Now</a>
                                </div>
                            </div>
                            <div class="post-details4  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Company Information</h4>
                                </div>
                                <p></p>
                                <ul>
                                    <li>Name: <span>  ${employerName} </span></li>
                                    <li>Web : <span> ${website} </span></li>
                                    <li>Email: <span> ${email} </span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- job post company End -->

        </main>


    </body>
</html>
<%@include file= "footer.jsp" %>