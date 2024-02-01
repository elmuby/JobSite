/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import Project.EmployerBean;
import Project.UserBean;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "admin", urlPatterns = {"/admin"})
public class admin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            Connection connection = ConnectionProvider.getConnection();
            String sQuery = "SELECT * FROM [User] WHERE UserID = ?";

            HttpSession session = request.getSession(false);
            if (session.getAttribute("adminId") != null) {
                String id = session.getAttribute("adminId").toString();
                PreparedStatement ps = connection.prepareStatement(sQuery);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    request.setAttribute("name", rs.getString("FullName"));
                    System.out.println(rs.getString("FullName"));

                    //for all users
                    String userQuery = "SELECT * FROM [USER] WHERE UserRole = 'Employer' OR UserRole = 'Job Seeker'";
                    Statement stmnt = connection.createStatement();
                    ResultSet rs1 = stmnt.executeQuery(userQuery);
                    //creating a list for the bean
                    List<UserBean> userList = new ArrayList<>();
                    while (rs1.next()) {
                        //creating object of the bean class
                        UserBean userBean = new UserBean();
                        userBean.setUserId(rs1.getString("userId"));
                        userBean.setRole(rs1.getString("UserRole"));
                        userBean.setUserName(rs1.getString("FullName"));

                        //adding the userBean to the list 
                        userList.add(userBean);
                        

                    }
                    request.setAttribute("userList", userList);
                    System.out.println(userList);

                    //for all employers
                    String employerQuery = "SELECT employerId, FORMAT(DateRegistered, 'd, MMMM yyyy') AS 'Date', CompanyName FROM [user]\n"
                            + "JOIN Employer ON UserID = EmployerID";
                    Statement stmt = connection.createStatement();
                    ResultSet rs2 = stmt.executeQuery(employerQuery);

                    //Creating list for the bean
                    List<UserBean> employerList = new ArrayList<>();
                    while (rs2.next()) {
                        UserBean empBean = new UserBean();

                        empBean.setEmployerId(rs2.getString("employerId"));
                        empBean.setEmployeName(rs2.getString("CompanyName"));
                        empBean.setDate(rs2.getString("Date"));

                        employerList.add(empBean);
                    }
                    request.setAttribute("employerList", employerList);


                    //for job seekers
                    String jQuery = "SELECT userId, FullName, FORMAT(DateRegistered, 'd, MMMM yyyy') AS 'Date'"
                            + " From [User] WHERE UserRole = 'Job Seeker' ";
                    Statement statement = connection.createStatement();
                    ResultSet rs3 = statement.executeQuery(jQuery);

                    //creating list for job seekers
                    List<UserBean> jobSeeker = new ArrayList<>();
                    while (rs3.next()) {
                        UserBean jobSeekerBean = new UserBean();
                        jobSeekerBean.setUserId(rs3.getString("UserId"));
                        jobSeekerBean.setUserName(rs3.getString("FullName"));
                        jobSeekerBean.setDate(rs3.getString("Date"));

                        jobSeeker.add(jobSeekerBean);
                    }
                    request.setAttribute("jobSeekerList", jobSeeker);
                    
                    //for messages
                    
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp");
                }

                //List<UsersList> userList = new ArrayList<>();
            } else {
                request.setAttribute("errorMessage", "OOps sign in first");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
                dispatcher.forward(request, response);

            }
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
