/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Project;

import java.sql.*;

public class ConnectionProvider {
    

    public static Connection getConnection(){
        try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con =DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=JobPortal;user=sa;password=123;encrypt=true;trustServerCertificate=true");
        return con;
        }
        catch(Exception e){
            System.out.println(e);
            return null;
        }
        
    }
}
