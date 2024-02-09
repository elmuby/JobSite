/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import Project.ConnectionProvider;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "Application", urlPatterns = {"/Application"})
public class Application extends HttpServlet {

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
            String jobId = request.getParameter("jobId");
            String userID = request.getParameter("userId");
            String employerId = request.getParameter("employerID");
            String seekerEmail = request.getParameter("email");

            //code for cv
            Part file = request.getPart("file");
            String fileName = getSubmittedFileName(file);


            InputStream fileContent = file.getInputStream();
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                byteArrayOutputStream.write(buffer, 0, bytesRead);
            }
            byte[] fileBytes = byteArrayOutputStream.toByteArray();

            String employerEmail = "";
            Connection con = ConnectionProvider.getConnection();
            try (PreparedStatement ps = con.prepareStatement("SELECT * FROM Employer WHERE EmployerID = ?")) {
                ps.setString(1, employerId);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    employerEmail = rs.getString("company_email");

                } else {
                    response.sendRedirect("error.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            // Sender's email address
            String from = "mubylearntocode@gmail.com";

            // Recipient's email address
            String to = "akinniyishola07@gmail.com";

            // SMTP server information
            String host = "smtp.gmail.com";
            String port = "587"; // Port for TLS

            // Email credentials
            String username = ""; //ur email
            String password = ""; //password 

            // Set properties and create the Session
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", port);

            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
                @Override
                protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                    return new javax.mail.PasswordAuthentication(username, password);
                }
            });

            try {
                // Add these lines to enable debugging
                properties.put("mail.debug", "true");
                session.setDebug(true);
                // Create a default MimeMessage object
                MimeMessage message = new MimeMessage(session);

                // Set From: header field
                message.setFrom(new InternetAddress(from));

                // Set To: header field
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                // Set Subject: header field
                message.setSubject("Resume");

                // Create the message body part
                BodyPart messageBodyPart = new MimeBodyPart();
                messageBodyPart.setText("Please find attached document.");
                BodyPart jobSeekerEmail = new MimeBodyPart();
                jobSeekerEmail.setText("Job Seeker email is: " + seekerEmail);

                // Create the attachment body part
                MimeBodyPart attachmentBodyPart = new MimeBodyPart();

                // Create the attachment
                attachmentBodyPart.setFileName(fileName);
                attachmentBodyPart.setContent(fileBytes, "application/octet-stream");
                // Create a multipart message and add the parts to it
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(messageBodyPart);
                multipart.addBodyPart(attachmentBodyPart);
                multipart.addBodyPart(jobSeekerEmail);

                // Set the multipart message as the email's content
                message.setContent(multipart);

                // Send message
//                Transport.send(message);
//                fileContent.close();
                request.setAttribute("errorMessage", "Application succesfull");
                RequestDispatcher dispatcher = request.getRequestDispatcher("ApplicationPage.jsp");
                dispatcher.forward(request, response);

            } catch (MessagingException mex) {
                mex.printStackTrace();
                request.setAttribute("errorMessage", "Unable to send email");
                request.getRequestDispatcher("Application.jsp").forward(request, response);
                System.out.println("Error: Unable to send email.");
            }

        }
    }

    //method for getting file name
    private String getSubmittedFileName(Part file) {
        for (String contentDisposition : file.getHeader("content-disposition").split(";")) {
            if (contentDisposition.trim().startsWith("filename")) {
                return contentDisposition.substring(contentDisposition.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown";  // You might handle the case when the file name is not found
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
