<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*,java.util.*, java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>XFactor</title>
        <style>
            body {
               margin:15px;
            }
        </style>
    </head>
    <body>
    <% try {
            String connURL = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=gottardo.joshua;password=xxx123#";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(connURL);
                    
            String IDevento = request.getParameter("IDevento");
            
            String sqlDelete = "DELETE FROM Evento WHERE ID = ?";
            
            PreparedStatement stmtDelete = connection.prepareStatement(sqlDelete);
            stmtDelete.setString(1, IDevento);
            stmtDelete.executeUpdate();
            
            response.sendRedirect("/html/Es1login.html");
                        
            connection.close();
        } catch (Exception e) {
            out.println(e);
        } %>
    </body>
</html>