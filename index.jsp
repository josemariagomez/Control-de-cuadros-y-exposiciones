<%-- 
    Document   : index
    Created on : 14-feb-2019, 9:16:03
    Author     : jose_
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <title>Museo del Prado</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/museo", "root", "");
          Statement s = conexion.createStatement();

          String estado = (request.getParameter("id") == null) ? "listado" : "edicion";

        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand" href="#"><b>MUSEO DEL PRADO</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#expo">Exposiciones</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn btn-success my-2 my-sm-0" type="submit"><a style="text-decoration: none; color: white;" href="login/login.jsp">Iniciar Sesión</a></button>
                </form>   
            </div>
        </nav>

        <section>
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="img/img1.jpg" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="img/im2.jpg" class="d-block w-100">
                    </div>
                    <div class="carousel-item">
                        <img src="img/im3.jpg" class="d-block w-100">
                    </div>
                </div>
            </div> 
        </section>

        <section>
            <div class="jumbotron jumbotron-fluid" id="expo">
                <div class="container">
                    <br><br>
                    <h1 class="display-4">Exposiciones</h1><br>
                    <div class="accordion" id="accordionExample">
                        <%                          ResultSet aux = s.executeQuery("SELECT MAX(id) FROM exposicion");
                          aux.next();
                          int aux1 = aux.getInt(1);
                          for (int i = 1; i <= aux1; i++) {
                            ResultSet exposiciones = s.executeQuery("SELECT * FROM exposicion WHERE id='" + i + "'");
                            while (exposiciones.next()) {

                        %>
                        <div class="card">
                            <div class="card-header" id="heading<%=i%>">
                                <h2 class="mb-0">
                                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse<%=i%>" <%=Integer.parseInt(exposiciones.getString("id")) == 1 ? "aria-expanded=\"true\"" : "aria-expanded=\"false\""%> aria-controls="collapse<%=i%>">
                                        <%=exposiciones.getString("titulo")%>
                                    </button>
                                </h2>
                            </div>

                            <div id="collapse<%=i%>" class="collapse <%=Integer.parseInt(exposiciones.getString("id")) == 1 ? "show" : ""%>" aria-labelledby="heading<%=i%>" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table">
                                        <tr><th></th><th>Título</th><th>Autor</th><th>Fecha/Época</th><th>Técnica</th><th></th><th></th></tr>
                                        <%}%>
                                        <%
                                          ResultSet listado = s.executeQuery("SELECT * FROM cuadro");
                                          while (listado.next()) {
                                            if (Integer.parseInt(listado.getString("expo")) == i) {
                                        %>
                                        <tr>
                                            <td></td>
                                            <td><%= listado.getString("titulo")%></td>
                                            <td><%= listado.getString("autor")%></td>
                                            <td><%= listado.getString("fecha")%></td>
                                            <td><%= listado.getString("tecnica")%></td>
                                        </tr>
                                        <%}
                                          }%>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>
