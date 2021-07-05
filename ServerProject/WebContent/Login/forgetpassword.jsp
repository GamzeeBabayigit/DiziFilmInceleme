<%@page import="first.User"%>
<%@page import="first.login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<jsp:useBean id="db" class="first.Database"/> 
<%
session.setAttribute("username", request.getParameter("email"));
session.setAttribute("pass", request.getParameter("newpass"));
session.setAttribute("newwpass", request.getParameter("newpass"));

session.setAttribute("kontrol", "0");
db.start();

if(request.getParameter("email") != null){  
	String email = (request.getParameter("email").toString());

	login dUser = db.getmail(email);
	if(dUser !=null){
 	response.sendRedirect("http://localhost:8088/ServerProject/sendresetmail.jsp");  

	}
	else
	{
	response.sendRedirect("http://localhost:8088/ServerProject/Login/AdminPanel/usererror.jsp");
	}
	
	return;
}

%>
 
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Asap" rel="stylesheet"><link rel="stylesheet" href="./style.css">


 
 
 
<body>
   <%if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("1")) { %>
					<div class="alert-success">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">×</span> 
					Mail Gönderildi.
					</div>
					<%}else if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("0")) { %>
					<div class="alert-unsuccess">
					 <span class="closebtn" onclick="this.parentElement.style.display='none';">×</span> 
					Mail Gönderilemedi.
					</div>
					<%} %>

	<form class="login"  action="" method="POST">
		  <input type="email" id="fname" name="email" placeholder="Mail Adresiniz ! ">
		
		  
		  <button>Şifre Sıfırla</button>
		  

 
		 
 		 
</form>
	
</body> 
</html>