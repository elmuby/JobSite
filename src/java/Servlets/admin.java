/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
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
                    request.setAttribute(id, rs.getString("FullName"));

                    //for all users
                    String userQuery = "SELECT * FROM [USER] WHERE UserRole = 'Employer' OR UserRole = 'Job Seeker'";
                    Statement stmnt = connection.createStatement();
                    ResultSet rs1 = stmnt.executeQuery(userQuery);
                    while (rs1.next()) {
                        request.setAttribute("userId", rs1.getString("userId"));
                        request.setAttribute("name", rs1.getString("FullName"));
                        request.setAttribute("role", rs1.getString("UserRole"));
                        System.out.println(rs1.getString("userId"));

                    }

                } else {
                    response.sendRedirect("error.jsp");
                }

                //List<UsersList> userList = new ArrayList<>();

            } else {
                request.setAttribute("errorMessage", "OOps");
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
