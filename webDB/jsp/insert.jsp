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
        <title>Insert giudici XFactor</title>
    </head>
    <body>
     <% 
     String nome = request.getParameter("nome");
     String cognome = request.getParameter("cognome");
     String luogo = request.getParameter("luogo");
     String data = request.getParameter("data");
     String soprannome = request.getParameter("soprannome");
     String nazione = request.getParameter("nazione");
     String bio = request.getParameter("bio");
     int edizione = Integer.parseInt(request.getParameter("edizione"));
     
     %>

      <h1>Giudice Inserito</h1>
      <p><a href=../html/home.html>Torna alla Home</a>
        <% 
            try{
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//Statement stmt = connection.createStatement();
            
			// ' or 1=1 --
			//String sql = "INSERT INTO Giudice VALUES ( ' " +  nome + " ')" ;
			
			//preparedStatement
			String sql = "INSERT INTO Giudice (Nome, Cognome, LuogoDiNascita, DataDiNascita, Soprannome, NazioneDiNascita, Biografia, PrimaEdizione) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps1 = connection.prepareStatement(sql);
			
			ps1.setString(1, nome);
			ps1.setString(2, cognome);
			ps1.setString(3, luogo);
			ps1.setString(4, data);
			ps1.setString(5, soprannome);
			ps1.setString(6, nazione);
			ps1.setString(7, bio);
			ps1.setInt(8, edizione);
			
			ps1.executeUpdate();
	        
	        connection.close();
            } catch (Exception e) {
                out.println(e);
            }

        %>
    </body>
</html>