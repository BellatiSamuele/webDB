<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update giudici XFactor</title>
    </head>
    <body>
     <% 
     if(request.getParameter("nome")==null || request.getParameter("nome").isEmpty()){
      %>
       <h1>Non hai inserito nessun giudice</h1>
       <p><a href=../html/home.html>Torna indietro</a>
      <%
        return;
      } 
      %>

      <h1>Giudice Modificato</h1>
      <p><a href=../html/home.html>Torna alla Home</a>
        <% 
            try{
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//Statement stmt = connection.createStatement();
			
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String data = request.getParameter("data");
            
			// ' or 1=1 --
			//String sql = "INSERT INTO Giudice VALUES ( ' " +  nome + " ')" ;
			
			//preparedStatement
			String sql = "UPDATE Giudice SET DataDiNascita = ? WHERE Nome = ? AND Cognome = ?;";

			PreparedStatement ps1 = connection.prepareStatement(sql);
			
			ps1.setString(1, nome);
			ps1.setString(2, cognome);
			ps1.setDate(3, java.sql.Date.valueOf(data));
			
			ps1.executeUpdate();
	        
	        connection.close();
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>