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
        try{
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=bellati.samuele;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
            
            Statement stmt = connection.createStatement();
            
			// ' or 1=1 --
			
			//preparedStatement
			String sql = "SELECT * FROM Utente WHERE Username = '" + request.getParameter("username") + "' AND Password = '" + request.getParameter("psw") + "' ";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()){
			    out.println("benvenuto " + rs.getString("username")); 
			    }else{
			        out.println("login fallito");
			        }
			        
            rs.close();
	        connection.close();
	        
        }catch(Exception e){
            out.println(e);
        }

        %>
    </body>
</html>