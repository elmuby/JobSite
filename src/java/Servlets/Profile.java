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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Connection con = ConnectionProvider.getConnection();
            String EmployerID = request.getParameter("EmployerID");
            String query = "SELECT * FROM EMPLOYER WHERE EmployerID = ?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, EmployerID);

            ResultSet rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                
                // Retrieving image data as bytes
                byte[] imageData = rs.getBytes("company_logo");
                // Converting image data to Base64
                String base64Image = Base64.getEncoder().encodeToString(imageData);
                //retrieving other column
                String companyName = rs.getString("CompanyName");
                String company_description = rs.getString("company_description");
                String company_location = rs.getString("company_location");
                String company_email = rs.getString("Company_email");
                String company_phoneNo = rs.getString("CompanyPhoneNo");
                String company_website = rs.getString("company_website");

                //sending the as attribute to profile.jsp
                request.setAttribute("base64Image", base64Image);
                request.setAttribute("companyName", companyName);
                request.setAttribute("company_description", company_description);
                request.setAttribute("company_location", company_location);
                request.setAttribute("company_email", company_email);
                request.setAttribute("company_phoneNo", company_phoneNo);
                request.setAttribute("company_website", company_website);
                request.setAttribute("EmployerID", EmployerID);

                //for displaying jobs on the job website
                String jobQuery = "select JobID, A.EmployerID, JobTitle, JobLocation, Salary,"
                                + " CompanyName, company_logo, JobNature from Job A join Employer B "
                                + "ON A.EmployerID = B.EmployerID WHERE A.EmployerID = ? order by A.PostedDate desc";
                System.out.println(EmployerID);
                List<JobListBean> jobList = new ArrayList<>();
                try (PreparedStatement ps2 = con.prepareStatement(jobQuery)) {
                    ps2.setString(1, EmployerID);
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
                        count++;
                        String jobID = rs2.getString("JobID");
                        String employerID = rs2.getString("EmployerID");
                        String jobLocation = rs2.getString("JobLocation");
                        String salaryRange = rs2.getString("Salary");
                        companyName = rs2.getString("CompanyName");
                        String jobTitle = rs2.getString("JobTitle");
                        String jobNature = rs2.getString("JobNature");

                        imageData = rs2.getBytes("company_logo");
                        // Converting image data to Base64
                        base64Image = Base64.getEncoder().encodeToString(imageData);

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
                        jobList.add(jobListBean);
                        System.out.println(employerID);
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                request.setAttribute("jobList", jobList);
                request.setAttribute("count", count);

            }

            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
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
