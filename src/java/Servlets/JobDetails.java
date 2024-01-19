/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import java.io.IOException;
import java.sql.*;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "JobDetails", urlPatterns = {"/JobDetails"})
public class JobDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = ConnectionProvider.getConnection();
            //retrieving the jobID and EmployerId from job_listing.jsp 
            String jobId = request.getParameter("jobID");
            String employerId = request.getParameter("employerID");
            String joinQuery = "select JobID, A.EmployerID, JobTitle, JobLocation,JobDescription, jobRequirement, "
                    + "Salary, JobNature, CompanyName, company_description, company_email,company_website, "
                    + "vacancy, FORMAT(postedDate, 'd, MMMM yyyy') AS 'Date', DeadlineDate, company_logo, JobNature from Job A\n"
                    + "join Employer B ON A.EmployerID = B.EmployerID WHERE JobID = ? and A.EmployerID = ?";
            PreparedStatement preparedStatement = con.prepareStatement(joinQuery);
            preparedStatement.setString(1, jobId);
            preparedStatement.setString(2, employerId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // Retrieving image data as bytes
                byte[] imageData = rs.getBytes("company_logo");
                // Converting image data to Base64
                String base64Image = Base64.getEncoder().encodeToString(imageData);

                //to keep track of jobID and EmployerID
                request.setAttribute("JobID", rs.getString("JobID"));
                request.setAttribute("EmployerID", rs.getString("EmployerID"));

                // Setting attributes to the columns requested in the query so we can retrive them from jobDetails.jsp
                request.setAttribute("jobTitle", rs.getString("JobTitle"));
                request.setAttribute("employerName", rs.getString("companyName"));
                //request.setAttribute("Location", rs.getString("Location"));
                request.setAttribute("jobDescription", rs.getString("JobDescription"));

                request.setAttribute("base64Image", base64Image);
                request.setAttribute("requiredKnowledge", rs.getString("jobRequirement"));
                //request.setAttribute("educationNExperience", rs.getString("EducationNExperience"));
                request.setAttribute("postedDate", rs.getString("Date"));

                request.setAttribute("location", rs.getString("jobLocation"));
                request.setAttribute("vacancy", rs.getString("vacancy"));
                request.setAttribute("jobNature", rs.getString("JobNature"));
                request.setAttribute("companyDescription", rs.getString("company_description"));
                request.setAttribute("salaryRange", rs.getString("Salary"));
                request.setAttribute("applicationDate", rs.getString("DeadlineDate"));
                request.setAttribute("website", rs.getString("company_website"));
                request.setAttribute("email", rs.getString("company_email"));

            }

            // Forwarding the request to the JSP
            request.getRequestDispatcher("/job_details.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
