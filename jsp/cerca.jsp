<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Risultati ricerca</title>
    </head>
    <body>
        <% 
            String text = request.getParameter("text");
            String tag = request.getParameter("tag");
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bellati.samuele;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			Statement stmt = connection.createStatement();

			String sql = "SELECT * FROM dbo.Utente WHERE Username = '" + request.getParameter("text") + "' ORDER BY " + request.getParameter("tag") + "";
			ResultSet rs = stmt.executeQuery(sql);
			
			out.print("<table>");
			
			out.print("<tr><th align=left>Username</th>);
			
    		while(rs.next()){

				String Nome = rs.getString("Nome");
                
                out.print("<tr style='border: 1px solid black;'><td style='border: 1px solid black;'>" + Nome + "</td></tr>");
                
	        }
	        
	        out.print(sql);
	        
	        rs.close();
	        
	        connection.close();
        
        %>
    </body>
</html>