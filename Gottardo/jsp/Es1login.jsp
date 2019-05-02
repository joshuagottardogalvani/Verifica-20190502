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
                    
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            String sqlUsers = "SELECT * FROM Cittadino WHERE username = ? AND password = ?";
            
            PreparedStatement stmtUsers = connection.prepareStatement(sqlUsers);
            stmtUsers.setString(1, username);
            stmtUsers.setString(2, password);
            ResultSet rsUsers = stmtUsers.executeQuery();
            
            if (rsUsers.next()) {
                String sqlEvents = "SELECT Evento.nome, Evento.ID FROM Comunicazione INNER JOIN Evento ON Comunicazione.IDE = Evento.ID INNER JOIN Cittadino ON Comunicazione.IDC = Cittadino.ID WHERE username = ?";
                
                PreparedStatement stmtEvents = connection.prepareStatement(sqlEvents);
                stmtEvents.setString(1, username);
                ResultSet rsEvents = stmtEvents.executeQuery();
                
                while(rsEvents.next()){
    				String Nome = rsEvents.getString("nome");
                    
                    out.print("<ul><li><a href=/jsp/Es1delete.jsp?IDevento=" + rsEvents.getString("ID") + ">" + Nome + "</a></li></ul>");
    	        }
       }

            rsUsers.close();
            connection.close();
        } catch (Exception e) {
            out.println(e);
        } %>
    </body>
</html>