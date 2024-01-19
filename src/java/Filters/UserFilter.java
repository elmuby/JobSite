/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebFilter(filterName = "UserFilter", urlPatterns = {"/JobDetails", "/"})
public class UserFilter implements Filter {

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        System.out.println("in filter");
        HttpSession session = req.getSession(false);

        if (session != null) {
            if (session.getAttribute("id") != null) {
                chain.doFilter(request, response);
            }
            else{
                req.setAttribute("errorMessage", "Login first");
                req.getRequestDispatcher("signin.jsp").include(request, response);
            }

        } else {
            if (session == null) {
                req.setAttribute("errorMessage", "Loggin first");
                req.getRequestDispatcher("signin.jsp").include(request, response);
            }
            req.setAttribute("errorMessage", "Loggin first");
            req.getRequestDispatcher("signin.jsp").include(request, response);
        }

    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {

    }

}
