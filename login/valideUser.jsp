<%-- 
    Document   : valideUser
    Created on : 08-may-2019, 17:01:16
    Author     : jose_
--%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  
    request.setCharacterEncoding("UTF-8");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/museo", "root", "");
    Statement s = conexion.createStatement();
    
    ResultSet users = s.executeQuery("SELECT username, password FROM user WHERE "
            + "id = (SELECT id FROM user WHERE username = '" + request.getParameter("user") + "')");
    
    String userReq = request.getParameter("user");
    String passwordReq = DigestUtils.md5Hex(request.getParameter("password"));
    
    String user = "";
    String password = "";
    while (users.next()) {
      user = users.getString("username");
      password = users.getString("password");
    }
    if(userReq.equals(user) && passwordReq.equals(password)){
        session.setAttribute("user", userReq);
        response.sendRedirect("../logged.jsp");
    }else{
        session.setAttribute("error", "Usuario o contraseña incorrectos.");
        response.sendRedirect("login.jsp");
    }
    
%>
