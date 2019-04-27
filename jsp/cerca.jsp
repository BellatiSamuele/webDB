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
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bellati.samuele;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);

			String text = request.getParameter("text");
            
            String sqlRicerca = "SELECT * FROM Utente WHERE " + request.getParameter("tag") + " LIKE ?";
            
            PreparedStatement stmtRicerca = connection.prepareStatement(sqlRicerca);
            stmtRicerca.setString(1, ricerca + "%");
            ResultSet rsRicerca = stmtRicerca.executeQuery();
			
			%>
			
			<table>
                <thead>
                  <tr>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                <% while(rsRicerca.next()){ %>
                <tr>
                    <td> <%= rsRicerca.getString("Nome") %> </td>
                    <td> <%= rsRicerca.getString("Cognome") %> </td>
                    <td> <%= rsRicerca.getString("Email") %> </td>
                    <td> <%= rsRicerca.getString("Username") %> </td>
                  </tr>
                  <% }%>
                </tbody>
              </table>
              
              <%
	        
	        rsRicerca.close();
	        
	        connection.close();
        
        %>
    </body>
</html>