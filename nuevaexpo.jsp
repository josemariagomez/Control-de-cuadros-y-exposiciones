<%-- 
    Document   : nuevaexpo
    Created on : 14-feb-2019, 18:25:20
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

          String insercion = "INSERT INTO cuadro (expo, titulo, autor, fecha, tecnica) "; 
          insercion += "VALUES ('";
          insercion += request.getParameter("expo") + "', '";
          insercion += request.getParameter("titulo") + "', '";
          insercion += request.getParameter("autor") + "', '";
          insercion += request.getParameter("fecha") + "', '";
          insercion += request.getParameter("tecnica") + "')";
          
          
          s.execute(insercion);
          conexion.close();
          
        %>
        <script>
            //Redirecciona a la página principal
            location.replace("index.jsp#expo");
        </script>
    </body>
</html>
