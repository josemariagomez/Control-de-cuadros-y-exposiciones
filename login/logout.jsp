<%-- 
    Document   : newjsp
    Created on : 08-may-2019, 17:11:41
    Author     : jose_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.removeAttribute("user");
session.removeAttribute("error");
response.sendRedirect("../index.jsp");


%>