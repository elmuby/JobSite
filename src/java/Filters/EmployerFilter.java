/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import Project.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebFilter(filterName = "EmployerFilter", urlPatterns = {"/Profile"})
public class EmployerFilter implements Filter {

    /**
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        PrintWriter out = response.getWriter();
        if (session != null) {
            try {
                if (session.getAttribute("id")!= null) {
                    String id = session.getAttribute("id").toString();
                    Connection con = ConnectionProvider.getConnection();
                    String query = "SELECT * FROM Employer WHERE EmployerID = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        chain.doFilter(request, response);
                    } else {
                        out.print("OOPS Something went wrong");

                    }
                } else {
                    res.sendRedirect("index.jsp");
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            req.setAttribute("errorMessage", "Please Log In first");
            req.getRequestDispatcher("signin.jsp").include(request, response);
        }

    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

}
