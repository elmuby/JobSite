/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import Project.JobListBean;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "JobListing", urlPatterns = {"/JobListing"})
public class JobListing extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Connection con = ConnectionProvider.getConnection();
            Statement statement = con.createStatement();
            Statement countStatement = con.createStatement();
            String countQuery = "SELECT COUNT(*) As 'count' FROM Job";
            String query = "select JobID, A.EmployerID, JobTitle, JobLocation, Salary, CompanyName, company_logo, JobNature from Job A join Employer B ON A.EmployerID = B.EmployerID";
            ResultSet rs = statement.executeQuery(query);
            ResultSet countResult = countStatement.executeQuery(countQuery);

            //creating arraylist to store the object of joblistbean class
            List<JobListBean> jobList = new ArrayList<>();
            while (countResult.next()) {
                request.setAttribute("count", countResult.getString("count"));
            }
            while (rs.next()) {

                //retrieving from the database
                String jobID = rs.getString("JobID");
                String employerID = rs.getString("EmployerID");
                String jobLocation = rs.getString("JobLocation");
                String salaryRange = rs.getString("Salary");
                String companyName = rs.getString("CompanyName");
                String jobTitle = rs.getString("JobTitle");
                String jobNature = rs.getString("JobNature");

                byte[] imageData = rs.getBytes("company_logo");
                // Converting image data to Base64
                String base64Image = Base64.getEncoder().encodeToString(imageData);

                //creating an object of JobListBean Class
                JobListBean jobListBean = new JobListBean();
                //setting the setters fields in the JoblistBean Class
                jobListBean.setBase64Image(base64Image);
                jobListBean.setJobID(jobID);
                jobListBean.setCompanyName(companyName);
                jobListBean.setJobNature(jobNature);
                jobListBean.setJobTitle(jobTitle);
                jobListBean.setLocation(jobLocation);
                jobListBean.setSalaryRange(salaryRange);
                jobListBean.setEmployerID(employerID);

                //adding the JobListBean object to the List jobList
                jobList.add(jobListBean);
            }
           
            request.setAttribute("jobList", jobList);
            request.getRequestDispatcher("job_listing.jsp").forward(request, response);

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
