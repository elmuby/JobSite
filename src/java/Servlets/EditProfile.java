/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Base64;
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
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {

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
            HttpSession session = request.getSession();
            System.out.println("this isnt" + session.getAttribute("id"));
            System.out.println("this is" + request.getParameter("EmployerID"));
            if (session.getAttribute("id").toString().equals(request.getParameter("EmployerID"))) {
                                Connection con = ConnectionProvider.getConnection();
                String EmployerID = request.getParameter("EmployerID");
                String query = "SELECT * FROM EMPLOYER WHERE EmployerID = ?";

                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, EmployerID);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
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
                    request.setAttribute("EmployerID", EmployerID);
                    request.setAttribute("base64Image", base64Image);
                    request.setAttribute("companyName", companyName);
                    request.setAttribute("company_description", company_description);
                    request.setAttribute("company_location", company_location);
                    request.setAttribute("company_email", company_email);
                    request.setAttribute("company_phoneNo", company_phoneNo);
                    request.setAttribute("company_website", company_website);
                    request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("error.jsp");
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
