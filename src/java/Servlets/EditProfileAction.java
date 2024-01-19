/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author DELL
 */
@MultipartConfig
@WebServlet(name = "EditProfileAction", urlPatterns = {"/EditProfileAction"})
public class EditProfileAction extends HttpServlet {

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
            try {
                String query = "Update Employer SET CompanyName = ?, company_description = ?, company_Location = ?,  "
                        + "company_logo = ?, company_email =?, CompanyPhoneNo = ?, company_website = ? WHERE EmployerID = ?";
                Connection con = ConnectionProvider.getConnection();

                String companyName = request.getParameter("companyName");
                String company_description = request.getParameter("company_description");
                String company_location = request.getParameter("company_location");
                String company_email = request.getParameter("company_email");
                String company_phoneNo = request.getParameter("companyPhoneNo");
                String company_website = request.getParameter("company_website");
                String employerID = request.getParameter("EmployerID");

                try (PreparedStatement ps = con.prepareStatement(query)) {
                    
                    ps.setString(1, companyName);
                    ps.setString(2, company_description);
                    ps.setString(3, company_location);

                    // company logo section
                    //retrieving image from the setup page as part
                    InputStream inputStream = null;
                    Part filepart = request.getPart("company_logo");
                    if (filepart != null && filepart.getSize() > 0) {
                        inputStream = filepart.getInputStream();
                        ps.setBlob(4, inputStream);
                    } else {
                        String existing_logo = request.getParameter("existing_logo");
                        byte[] existingLogoBytes = Base64.getDecoder().decode(existing_logo);
                        inputStream = new ByteArrayInputStream(existingLogoBytes);
                        ps.setBlob(4, inputStream);
                    }
                    

                    ps.setString(5, company_email);
                    ps.setString(6, company_phoneNo);
                    ps.setString(7, company_website);
                    
                    //where to set the EmployerID
                    ps.setString(8, employerID);
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        //response.sendRedirect("Profile");
                        request.setAttribute("EmployerID", employerID);
                        javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("Profile");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "An Error Occured During Registration, Try again");
                        javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
                        dispatcher.forward(request, response);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
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
