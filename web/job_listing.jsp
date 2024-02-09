<%@page import="java.sql.*"%>
<%@page import ="Project.ConnectionProvider" %>
<%@include file= "header.jsp" %>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <title>Job Details</title>

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
                        <span>${count} Jobs found</span>
                        <span>${jobID}</span>
                        <span>${employerID}</span>
                      </div>
                    </div>
                  </div>
                  <!-- Count of Job list End -->
                  
                  
                  <!-- single-job-content -->
                  
                  <!-- Retrieve the list from the request from jobListing.java -->
                  <c:forEach var="s" items="${jobList}">   
                  
                  <div class="single-job-items mb-30">
                    <div class="job-items">
                      <div class="company-img">
                          <!-- the code is to help us keep track of jobID and send it to the JobDetailsServlet -->
                        <a href="<%= request.getContextPath()%>/JobDetails?jobID=${s.jobID}&employerID=${s.employerID}"
                          ><img src='data:image/png;base64,${s.base64Image}' alt="Company Logo"
                        /></a>
                      </div>
                      <div class="job-tittle job-tittle2">
                        <a href="<%= request.getContextPath()%>/JobDetails?jobID=${s.jobID}&employerID=${s.employerID}">
                          <h4>${s.jobTitle}</h4>
                        </a>
                        <ul>
                          <li>${s.companyName}</li>
                          <li>
                            <i class="fas fa-map-marker-alt"></i>${s.location}
                          </li>
                          <li>${s.salaryRange}</li>
                        </ul>
                      </div>
                    </div>
                    <div class="items-link items-link2 f-right">
                        
                      <a href="<%= request.getContextPath()%>/JobDetails?jobID=${s.jobID}&employerID=${s.employerID}">${s.jobNature}</a>
                    </div>
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