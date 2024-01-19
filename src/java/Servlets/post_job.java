/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import javax.servlet.RequestDispatcher;
import Project.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
@WebServlet(name = "post_job", urlPatterns = {"/post_job"})
public class post_job extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Connection con = ConnectionProvider.getConnection();
            // retrieving the values from the jsp page
            String employerID = request.getParameter("employerID");
            String title = request.getParameter("job_name");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String Requirements = request.getParameter("Requirements");
            String vacancy = request.getParameter("vacancy");

            // to check currency
            String sal_currency;
            String salary;
            if ("Naira (N)".equals(request.getParameter("sal_currency"))) {
                sal_currency = "N";
                salary = request.getParameter("salary");
            } else if ("Dollars ($)".equals(request.getParameter("sal_currency"))) {
                sal_currency = "$";
                salary = request.getParameter("salary");
            } else {
                sal_currency = "Check Description";
                salary ="";
            }

            
            
           
            String nature;
            if (request.getParameter("nature").equals("Others : Specify in Description Section")) {
                nature = "Check Description";
            } else if (request.getParameter("nature").equals("Onsite")) {
                nature = "Onsite";
            } else {
                nature = "Remote";
            }
            String date = request.getParameter("date");

            // sql statement 
            String sql = "INSERT INTO [dbo].[Job] "
                    + "([EmployerID],[JobTitle],[JobDescription],[JobLocation],"
                    + "[jobRequirement],[Salary],[vacancy],[JobNature],[DeadlineDate]) "
                    + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, employerID);
                ps.setString(2, title);
                ps.setString(3, description);
                ps.setString(4, location);
                ps.setString(5, Requirements);
                ps.setString(6, sal_currency + salary);
                ps.setString(7, vacancy);
                ps.setString(8, nature);
                ps.setString(9, date);

                int jobins = ps.executeUpdate();
                if (jobins > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id", employerID);
                    response.sendRedirect("Profile?EmployerID=" + employerID);
                    System.out.println("mail");
                } else {
                    request.setAttribute("errorMessage", "An Error While Posting A Job");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (Exception e) {
                System.out.println(e);
            }

////            System.out.println(title);
////            System.out.println(description);
////            System.out.println(location);
////            System.out.println(Requirements);
////            System.out.println(salary);
////            System.out.println(sal_currency);
////            System.out.println(nature);
////            System.out.println(date);
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
