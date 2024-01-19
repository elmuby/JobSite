<%@page import="java.sql.*"%>
<%@page import ="Project.ConnectionProvider" %>
<%@include file= "header.jsp" %>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <title>Job Details</title>
        <style>
            *{
                margin: 0;
                margin-bottom: 0;
                padding: 0;
                box-sizing: border-box;
            }
            .image_div{
                width: 200px;
                /* height: 200px; */
                overflow: hidden;
                /* border: 3px solid #fb246a; */
                padding-bottom: 10px;
            }
            .image_div > a > img {
                width: 100%;
                object-fit: cover;
                object-position: center;
            }
            .CompanyName{
                font-size: 1.7rem;
                font-family: "muli", sans-serif;
                margin-bottom: 0px; margin: 0; 
            }
            .mybtncpy{
                background: #fb246a;


                color: #fff;
                cursor: pointer;

                font-size: 18px;
                font-weight: 500;
                letter-spacing: 1px;



                padding: 7px 20px;

                cursor: pointer;
                transition: color 0.4s linear;
                border-radius: 4px;
                z-index: 1;
                border: 0;
                overflow: hidden;
                margin: 0;
            }
        </style>
    <body>
        <main>
            <!-- Hero Area Start-->
            <div class="slider-area">
                <div
                    class="single-slider section-overly slider-height2 d-flex align-items-center"
                    data-background="assets/img/img4.jpg"
                    >
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>Get your job</h2>

                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
            <!-- Hero Area End -->

            <!-- Job List Area Start -->
            <div class="job-listing-area pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <!-- Right content -->
                        <div class="col-xl-9 col-lg-9 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <!-- Count of Job list Start -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="count-job mb-35">
                                                <span>${comp} Companies Found</span>
                                                <span>${jobID}</span>
                                                <span>${employerID}</span>
                                                <!-- Select job items start -->
                                                <div class="select-job-items">
                                                    <span>Sort by</span>
                                                    <select name="select">
                                                        <option value="">Latest</option>
                                                        <option value="">Oldest</option>

                                                    </select>
                                                    <button>Sort</button>
                                                </div>
                                                <!--  Select job items End-->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Count of Job list End -->


                                    <!-- single-job-content -->

                                    <c:forEach var="row" items="${resultList}">
                                        `
                                        <!-- Retrieve the list from the request from jobListing.java -->

                                        <div style="display: flex; align-items: center; gap: 1rem; width: 1000px ; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .2); ">


                                            <div class="company-img image_div">
                                                <!-- the code is to help us keep track of jobID and send it to the JobDetailsServlet -->
                                                <a href="<%= request.getContextPath()%>/JobDetails?jobID=${row.JobID}&employerID=${row.EmployerID}">
                                                    <img src='data:image/png;base64,${row.base64Image}' alt="Company Logo" />
                                                </a>
                                            </div>
                                            <div style="width: 600px; display: flex; flex-direction: column; gap: .1rem;">
                                                <div style="display: flex;  align-items: center;">
                                                    <h2 class="CompanyName">${row.CompanyName}</h2>
                                                </div>
                                                <div style="display: flex;  gap:1rem; margin-bottom: 0px; margin: 0; ">
                                                    <p style=" margin-bottom: 0px; margin: 0; display: flex; align-items: center; gap: .5rem; font-size: 1.3rem;
                                                       color: #969595; font-family:system-ui">

                                                        ${row.company_Location}</p>
                                                    <a style="color: coral; font-family: 'muli', sans-serif; font-size: 1.3rem;" href="">${row.company_website}</a>
                                                </div>
                                                <div>
                                                    <p style=" font-size: 1rem; font-family: system-ui; color: #969595;">${row.company_description} </p>
                                                </div>
                                            </div>
                                            <div><button class="mybtncpy"> <a href="/kkmk">Profile</a> </button></div>
                                        </div>               
                                    </c:forEach>
                                </div>
                            </section>
                            <!-- Featured_job_end -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Job List Area End -->
        </main>
    </body>
</html>
<%@include file= "footer.jsp" %>