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
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Museo del Prado</title>
        <style>
            body {
  font-family: sans-serif;
  padding: 0;
  margin: 0;
}

.app{
	display: flex;
	padding: 0;
	margin: 0;
}

.left{
	height: 100vh;
	width: 400px;
	min-width: 400px;
	max-width: 400px;
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	z-index: 10;
}

.apptittle{
	display: flex;
}

h3{
	margin-bottom: 10px;
	font-size: 2em;
	font-kerning: all;
	font-weight: bolder;
	letter-spacing: 0.35rem;
	color: #34495e;
}

h3:nth-child(2){
	padding-top: 10px;
}


.submitButton{
	border-radius: 5px;
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.6);
	margin-top: 20px;
	padding: 10px 15px 10px 15px;
	background-color: #34495e;
	transition: 0.3s;
	cursor: pointer;
}

.submitButton:hover{
	background-color: #607d8b;
}

.underline{
	margin-top: -1px;
	width: 0px;
	height: 2px;
	background-color: #34495e;
	transition: 0.3s;
}

label{
	margin-top: 8px;
	color: #34495e;
	width: 260px;
	transition: 0.3s;
}

form{
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

input[type="text"], input[type="password"]{
	margin-top: 10px;
	border: 0;
	border-bottom: solid 2px;
	width: 260px;
	border-color: #b3b3b3;
}

input[type="text"]:focus + .underline, input[type="password"]:focus + .underline{
	width: 260px;
}

button{
	color: white;
	background: transparent;
	border: 0;
	cursor: pointer;
}

input:focus, button:focus {
    outline:none;
}

/*///

*/

.right{
	padding: 0;
	background: #4e54c8;  
        background: url('../img/im2.jpg');  
	width: 100%;
	height:100vh;
	overflow: hidden;
}

.circles{
	padding: 0;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    overflow: hidden;
    margin-top: 0;
}

.circles li{
	border-radius: 100%;
    position: absolute;
    display: block;
    list-style: none;
    width: 20px;
    height: 20px;
    background: rgba(255, 255, 255, 0.5);
    animation: animate 15s linear infinite;
    bottom: -150px;
    
}

.circles li:nth-child(1){
    left: 95%;
    width: 80px;
    height: 80px;
    animation-delay: 0s;
}


.circles li:nth-child(2){
    left: 60%;
    width: 20px;
    height: 20px;
    animation-delay: 2s;
    animation-duration: 10s;
}

.circles li:nth-child(3){
    left: 70%;
    width: 20px;
    height: 20px;
    animation-delay: 4s;
}

.circles li:nth-child(4){
    left: 40%;
    width: 60px;
    height: 60px;
    animation-delay: 0s;
    animation-duration: 14s;
}

.circles li:nth-child(5){
    left: 65%;
    width: 20px;
    height: 20px;
    animation-delay: 0s;
}

.circles li:nth-child(6){
    left: 75%;
    width: 110px;
    height: 110px;
    animation-delay: 3s;
}

.circles li:nth-child(7){
    left: 35%;
    width: 150px;
    height: 150px;
    animation-delay: 7s;
}

.circles li:nth-child(8){
    left: 50%;
    width: 25px;
    height: 25px;
    animation-delay: 15s;
    animation-duration: 45s;
}

.circles li:nth-child(9){
    left: 20%;
    width: 15px;
    height: 15px;
    animation-delay: 2s;
    animation-duration: 35s;
}

.circles li:nth-child(10){
    left: 85%;
    width: 150px;
    height: 150px;
    animation-delay: 0s;
    animation-duration: 11s;
}



@keyframes animate {

    0%{
        transform: translateY(0) translateX(0);
        opacity: 0.9;
    }

    100%{
        transform: translateY(-1000px) translateX(-30px);
        opacity: 0;
    }

}
        </style>
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/museo", "root", "");
          Statement s = conexion.createStatement();

          String estado = (request.getParameter("id") == null) ? "listado" : "edicion";

        %>
        
	<div id="app" class="app">
	  <div class="left">
	    <div class="apptittle"> <h3>Museo del Prado</h3></div>
            <form action="valideUser.jsp">
	    	<label id="userLabel">Usuario</label>
                <input type="text" id="user" name="user" autocomplete="off"></input>
	    	<div class="underline"></div>
	    	<label id="passwordLabel">Contraseña</label>
	    	<input type="password" id="password" name="password"></input>
	    	<div class="underline"></div>
	    	<div class="submitButton">
                    <button type="submit">Iniciar Sesión</button>
	    	</div>
	    </form>
            </br>
            <%= session.getAttribute("error") == null ? "" : "<p style='color: red;'>" + session.getAttribute("error") + "</p>" %>
	  </div>
	  <div class="right">
            <ul class="circles">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
	  </div>
	</div>
</body>
</html>
