/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Project.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
@WebServlet(urlPatterns = {"/signup"})
public class signup extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {

                Connection con = ConnectionProvider.getConnection();
                System.out.println("succesfull");
                String sql = "INSERT INTO [dbo].[user] (Fullname, Email, Password, UserRole) values (?, ?, ?, ?) ";
                //extract the values from the sign up form
                String name = request.getParameter("name");
                String pass = request.getParameter("pass");
                String email = request.getParameter("email");
                String role = request.getParameter("role");

                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, pass);
                    ps.setString(4, role);

                    //executing the query
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        response.sendRedirect("signin.jsp");
                    } else {
                        request.setAttribute("errorMessage", "An Error Occured During Registration, Try again");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                        dispatcher.forward(request, response);
                    }

                } catch (Exception e) {
                    if (e.getMessage().contains("UNIQUE KEY constraint")) {
                        request.setAttribute("errorMessage", "Email Already exists!!!");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                        dispatcher.forward(request, response);
                        
                    }
                    System.out.println(e.getMessage());
//                    out.print(e);
                }

            } catch (Exception e) {
                out.print(e);
                System.out.println("nail");
            }
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
