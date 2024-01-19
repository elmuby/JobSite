<%@page import="java.sql.*"%>
<%@page import="Project.ConnectionProvider"%>
<%@page import="java.util.Base64"%>

<%--<%@page errorPage="error.jsp" %>--%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="manifest" href="site.webmanifest" />
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="assets/img/favicon.ico"
    />

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/css/flaticon.css" />
    <link rel="stylesheet" href="assets/css/price_rangs.css" />
    <link rel="stylesheet" href="assets/css/slicknav.css" />
    <link rel="stylesheet" href="assets/css/animate.min.css" />
    <link rel="stylesheet" href="assets/css/magnific-popup.css" />
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css" />
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/slick.css" />
    <link rel="stylesheet" href="assets/css/nice-select.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
    <link rel="stylesheet" href="assets/css/personalcss.css" />
    <link rel="stylesheet" href="assets/css/fonts.css" />
  </head>

  <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
      <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
          <div class="preloader-circle"></div>
          <div class="preloader-img pere-text">
            <img src="assets/img/logo/logo.png" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- Preloader Start -->
    <header>
      <!-- Header Start -->
      <div class="header-area header-transparrent">
        <div class="headder-top header-sticky">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-lg-3 col-md-2">
                  
               

        <!-- Logo -->
        <%
            Connection connection = ConnectionProvider.getConnection();
            String sQuery = "SELECT * FROM Employer WHERE EmployerID = ?";
            session = request.getSession(false);
            if (session.getAttribute("id") != null) {
                try {
                    String id = session.getAttribute("id").toString();
                    PreparedStatement ps = connection.prepareStatement(sQuery);
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        // Retrieving image data as bytes
                        byte[] imageData = rs.getBytes("company_logo");
                        // Converting image data to Base64
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
        %>          
                    <div class="logo" style="overflow: hidden; width: 100px; height: 100px; right:10px; top: 10px; display:flex; align-items: center; ">
                                    <a style="width:100%; object-position: center;  " href="<%= request.getContextPath()%>/Profile?EmployerID=<%= rs.getString("EmployerID")%>"
                                       ><img style="width:100%; object-position: center;  " src='data:image/png;base64, <%= base64Image%>' alt=""
                                          /></a>

                                </div>

                                <a href="<%= request.getContextPath()%>/JobPostPage?employerID=<%= rs.getString("EmployerID")%>" style="margin-top: -80px;
                                   position: absolute;
                                   margin-left: 50rem;" class="btn post-btn">Post a job</a>
                  
        <%  } else{ %>
                <div class="logo">
                    <a href="index.jsp"
                       ><img src="assets/img/logo/logo.png" alt=""
                          /></a>
                    </div>
                   <%   }

            } catch (Exception e) {
                e.printStackTrace();
          }
      } else { %>
        <div class="logo">
            <a href="index.jsp"
               ><img src="assets/img/logo/logo.png" alt=""
                  /></a>
        </div>
        <% }%>    
                
                
                
              </div>
              <div class="col-lg-9 col-md-9">
                <div class="menu-wrapper">
                  <!-- Main-menu -->
                  <div class="main-menu">
                    <nav class="d-none d-lg-block">
                      <ul id="navigation">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="<%= request.getContextPath()%>/JobListing">Find a Jobs </a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                      </ul>
                    </nav>
                  </div>
                  <!-- Header-btn -->
                  <%
                      if(session.getAttribute("id") == null){
                          
                  %>
                  <div class="header-btn d-none f-right d-lg-block">
                    <a href="signup.jsp" class="btn head-btn1">Register</a>
                    <a href="signin.jsp" class="btn head-btn2">Login</a>
                  </div>
                  <% } else{%>
                  <div class="header-btn d-none f-right d-lg-block">
                    <a href="<%= request.getContextPath()%>/signout" class="btn head-btn1">Sign Out</a>
                  </div>
                  <% }%>
                </div>
              </div>
              <!-- Mobile Menu -->
              <div class="col-12">
                <div class="mobile_menu d-block d-lg-none"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Header End -->
    </header>
    
  </body>
</html>
