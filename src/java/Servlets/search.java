/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Project.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

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
            String searchparam = request.getParameter("serach_text");
            String searchtype = request.getParameter("select");

            if ("Jobs".equals(searchtype)) {

                List<Map<String, Object>> resultList = new ArrayList<>();

                try {
                    Connection con = ConnectionProvider.getConnection();
                    String sql = "select JobID, A.EmployerID, JobTitle, JobLocation, "
                            + "Salary, CompanyName, company_logo, JobNature from Job A "
                            + "join Employer B ON A.EmployerID = B.EmployerID where A.JobTitle like ?";

                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + searchparam + "%");
                    int size = 0;
                    try (ResultSet rs = ps.executeQuery()) {
                        ResultSetMetaData metaData = rs.getMetaData();

                        while (rs.next()) {
                            size++;

                            System.out.println(rs);
                            Map<String, Object> row = new HashMap<>();
                            String companyName = metaData.getColumnName(6);
                            Object cn = rs.getObject(companyName);
                            row.put(companyName, cn);

                            String EmployerID = metaData.getColumnName(2);
                            Object ei = rs.getObject(EmployerID);
                            row.put(EmployerID, ei);

                            String JobNature = metaData.getColumnName(8);
                            Object jn = rs.getObject(JobNature);
                            row.put(JobNature, jn);

                            byte[] imageData = rs.getBytes("company_logo");
                            // Converting image data to Base64
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            row.put("base64Image", base64Image);

                            String JobTitle = metaData.getColumnName(3);
                            Object jt = rs.getObject(JobTitle);
                            row.put(JobTitle, jt);

                            String JobID = metaData.getColumnName(1);
                            Object ji = rs.getObject(JobID);
                            row.put(JobID, ji);

                            String JobLocation = metaData.getColumnName(4);
                            Object jl = rs.getObject(JobLocation);
                            row.put(JobLocation, jl);

                            String Salary = metaData.getColumnName(5);
                            Object s = rs.getObject(Salary);
                            row.put(Salary, s);

                            resultList.add(row);

                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    request.setAttribute("count", size);
                    request.setAttribute("resultList", resultList);
                    request.getRequestDispatcher("/job_search_page.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if ("Companies".equals(searchtype)) {
                int size = 0;
                try {

                    Connection con = ConnectionProvider.getConnection();
                    String sql = "select * from employer where companyname like ?";

                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + searchparam + "%");
                    List<Map<String, Object>> resultList = new ArrayList<>();

                    try (ResultSet rs = ps.executeQuery()) {
                        ResultSetMetaData metaData = rs.getMetaData();

                        while (rs.next()) {
                            size++;
                            Map<String, Object> row = new HashMap<>();

                            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                                String columnName = metaData.getColumnName(i);
                                Object value = rs.getObject(columnName);
                                row.put(columnName, value);
                            }

                            resultList.add(row);

                            byte[] imageData = rs.getBytes("company_logo");
                            // Converting image data to Base64
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            row.put("base64Image", base64Image);

                        }
                    }

                    request.setAttribute("resultList", resultList);
                    request.setAttribute("comp", size);
//                    request.getRequestDispatcher("yourJspPage.jsp").forward(request, response);

                    request.getRequestDispatcher("/company_search_page.jsp").forward(request, response);
                } catch (Exception e) {
                }
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
