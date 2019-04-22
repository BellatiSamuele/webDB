<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Elenco giudici XFactor</title>
    </head>
    <body>
        <h1>Elenco dei giudici di XFactor</h1>
        <p><a href=../html/home.html>Torna indietro</a>
        <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

			String sql = "SELECT * FROM Giudice order by Cognome";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			out.print("<table>");
			
			out.print("<tr><th align=left>Cognome</th><th align=left>Nome</th></tr>");
			
    		while(rs.next()){

				String Nome = rs.getString("Nome");
				String Cognome = rs.getString("Cognome");
                
                out.print("<tr style='border: 1px solid black;'><td style='border: 1px solid black;'>" + Cognome + "</td><td style='border: 1px solid black;'>" + Nome + "</td></tr>");

	        }
	        
	        
	        
	        rs.close();
	        
	        connection.close();
        
        %>
    </body>
</html>