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
        <title>Login</title>
    </head>
    <body>
     <% 
     String username = request.getParameter("username");
     String password = request.getParameter("psw");
     %>
        <% 
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//Statement stmt = connection.createStatement();
            
			// ' or 1=1 --
			//String sql = "INSERT INTO Giudice VALUES ( ' " +  nome + " ')" ;
			
			//preparedStatement
			String sql = "SELECT * FROM Sblendorio WHERE Username = ? AND Password = ?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

	        if(rs.next()){
	            out.println("Benvenuto "+ rs.getString("Nome"));
	        }else{
	            out.println("fallito");
	        }
	        connection.close();

        %>
    </body>
</html>