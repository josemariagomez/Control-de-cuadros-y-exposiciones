<%-- 
    Document   : actualizarexpo
    Created on : 14-feb-2019, 18:25:40
    Author     : jose_
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
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

          String actualizacion = "UPDATE user SET username='";
          actualizacion += request.getParameter("username");
          actualizacion += "', password='";
          actualizacion += DigestUtils.md5Hex(request.getParameter("password"));
          actualizacion += "' WHERE id =";
          actualizacion += request.getParameter("id");
          
          s.execute(actualizacion);
          conexion.close();
          
        %>
        
        <script>
            //Redirecciona a la página principal
            location.replace("logged.jsp#admin");
        </script>
    </body>
</html>
