<%@page import="first.User"%>
<%@page import="first.login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<jsp:useBean id="db" class="first.Database"/> 
<%
session.setAttribute("username", request.getParameter("email"));
session.setAttribute("kontrol", "0");
db.start();
if(request.getParameter("email") != null){  
	String email = (request.getParameter("email").toString());
	String pas = (request.getParameter("pass").toString());
	login dUser = db.getlogin(email, pas);
	if(dUser !=null){
		session.setAttribute("kontrol", "1");
		if(dUser.getyetki().equals("0")){
			 
			response.sendRedirect("http://localhost:8088/ServerProject/index.jsp");
			 
		}
		else{
		response.sendRedirect("http://localhost:8088/ServerProject/Login/AdminPanel/admin.jsp");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
		session.setAttribute("kontrol", "0");
	}
	
	return;
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>GİRİŞ EKRANI</title>

  <link href="https://fonts.googleapis.com/css?family=Asap" rel="stylesheet"><link rel="stylesheet" href="./style.css">
 
</head>
<body style="background-color: #ffffff;">


	<form class="login"  action="" method="POST">
 <p> </p> 
		  <input name="email" type="text" placeholder="Mail Adresiniz">
	 
		  <button>Gönder</button>
		  </form>
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>