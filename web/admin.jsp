

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="./admincss/thestyle.css">
        <style>
            button{
                background-color: lightcoral;
                color: white;
                border: none;
                padding: 5px 15px;
            }
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#"></a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarText"
                    aria-controls="navbarText"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#"
                               >Home <span class="sr-only">(current)</span></a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Users">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Employer">Employers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Seekers">Job Seekers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Jobs">Jobs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#Messages">Messages</a>
                        </li>
                    </ul>
                    <span class="navbar-text"> Welcome, ${name} </span>
                </div>
            </nav>
        </header>

        <!-- user section --> 

        <section id="Users">
            <h1 style="text-align: center;" >Total Users</h1>
            <div id="userSection">
                <table class="table">

                    <thead>
                        <tr>
                            <th scope="col">S/N</th>
                            <th scope="col">Users</th>
                            <th scope="col">Role</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="s" items="${userList}"> 
                            <tr>
                        <input type="hidden" name="useId" value="${s.userId}">
                        <th scope="row"> ${s.userId}</th>
                        <td>${s.userName}</td>
                        <td>${s.role}</td>
                        <th>
                            <button> <a href="<%= request.getContextPath()%>/DeleteUser?userId=${s.userId}">Delete </a> </button>
                           
                        </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </section>

        <!-- Employer section -->
        <section id="Employer">
            <h1 style="text-align: center;">Employer</h1>
            <div id="employerSection">
                <table style="padding: 20px;" class="table">
                    <thead>
                        <tr>
                            <th scope="col">S/N</th>
                            <th scope="col">Company Name</th>
                            <th scope="col">Date Joined</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${employerList}">
                        <tr>
                    <input type="hidden" name="employerId" value="">
                    <th scope="row">${s.employerId}</th>
                    <td>${s.employeName}</td>
                    <td>${s.date}</td>
                    <th>
                        <button><a href="<%= request.getContextPath()%>/DeleteUser?userId=${s.userId}">Delete </a></button>
                    </th>
                    </tr>
                        </c:forEach> 
                    </tbody>
                </table>
        </section>
        <!-- Job Seeker section --> 
        <section id="Seekers">
            <h1 style="text-align: center;">Job Seekers</h1>
            <div id="jobSeekerSection">
                <table class="table">
                    <thead>
                        
                        <tr>
                    <input type="hidden" name="jobSeekerId" value="">
                    <th scope="col">S/N</th>
                    <th scope="col">Job Seeker's Name</th>
                    <th scope="col">Date Joined</th>
                    <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${jobSeekerList}">
                        <tr>
                            <th scope="row">1</th>
                            <td>${s.userName}</td>
                            <td>${s.date}</td>
                            <th>
                                <button>Delete</button>
                            </th>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
        </section>
        <!-- Job Section --> <section id="Jobs">
            <h1 style="text-align: center;">Jobs</h1>
            <div id="jobSection">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">S/N</th>
                            <th scope="col">Title</th>
                            <th scope="col">Employer</th>
                            <th scope="col">Action</th>
                            <th scope="col">Date Posted</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${jobs}">
                            
                        <tr>
                    <input type="hidden" name="jobId" value="">
                    <th scope="row">${s.jobID}</th>
                    <td>${s.jobTitle}</td>
                    <td>${s.companyName}</td>
                    <td>${s.date}</td>
                    <th>
                        <button>Delete</button>
                    </th>
                    </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- Messages section --> <section id="Messages">
            <h1 style="text-align: center;">Messages</h1>
            <div id="messageSection">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">S/N</th>
                            <th scope="col">Message by</th>
                            <th scope="col">Date posted</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${messages}">      
                        <tr>
                            <th scope="row">${s.messageId}</th>
                            <td>${s.userName}</td>
                            <td>${s.date}</td>
                            <th>
                                <button>Delete</button>
                            </th>
                        </c:forEach>
                        </tr>
                    </tbody>
                </table>
        </section>

        <script src="./adminjs/bootstrap.min.js"></script>
    </body>
</html>

