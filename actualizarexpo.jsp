<%-- 
    Document   : actualizarexpo
    Created on : 14-feb-2019, 18:25:40
    Author     : jose_
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/museo", "root", "");
          Statement s = conexion.createStatement();

          String actualizacion = "UPDATE cuadro SET titulo='";
          actualizacion += request.getParameter("titulo");
          actualizacion += "', autor='";
          actualizacion += request.getParameter("autor");
          actualizacion += "', fecha='";
          actualizacion += request.getParameter("fecha");
          actualizacion += "', tecnica='";
          actualizacion += request.getParameter("tecnica");
          actualizacion += "' WHERE id =";
          actualizacion += request.getParameter("id");
          
          s.execute(actualizacion);
          conexion.close();
          
        %>
        
        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp#expo");
        </script>
    </body>
</html>
