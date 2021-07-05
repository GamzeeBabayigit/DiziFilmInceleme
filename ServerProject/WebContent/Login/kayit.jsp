<%@page import="first.User"%>
<%@page import="first.login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<jsp:useBean id="db" class="first.Database"/> 
<jsp:useBean id="user" class="first.login"/> 
<%
db.start();
if(request.getParameter("usrname") != null){  
	String email = (request.getParameter("usrname"));
	String pas = (request.getParameter("psw"));
	login dUser = db.getkayit(email);
	if(dUser ==null){
		if(request.getParameter("psw")!=null ){
			user.setEmail(request.getParameter("usrname"));
			user.setPass(request.getParameter("psw"));
			if(request.getParameter("psw").length()<6){
				response.sendRedirect("kayit.jsp");	
			}
			else
			{
				db.start();
				boolean result = db.kayit(user);
				if(result != false){
					out.print("<script>alert('Kullanıcı Başarıyla Oluşturuldu.')</script>");
					response.sendRedirect("login.jsp");
					return;
				}else out.print("<script>alert('Üzgünüz Hata Oluştu.')</script>");
			}
		} 
	}
	else
	{
		response.sendRedirect("kayit.jsp");
		out.print("sorun");
	}
}
%>

<style>
/* Style all input fields */
input {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
  background-color: #4CAF50;
  color: white;
}

/* Style the container for inputs */
.container {
  background-color: #f1f1f1;
  padding: 20px;
}

/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background: #f1f1f1;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "✖";
}
</style>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>KAYIT EKRANI</title>

 
	<link href="https://fonts.googleapis.com/css?family=Asap" rel="stylesheet"><link rel="stylesheet" href="./style.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #ffffff;">
	
 
				<form class="login" action="" method="POST">
					  
				 
				  
				    <label for="usrname">Kullanıcı Adı</label>
				    <input type="text" id="usrname" name="usrname" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="xyz@abs.com"  required>
				
				    <label for="psw">Şifre</label>
				    <input type="password" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="OLUŞTURMA KRİTERLERİNE UYGUN BİR ŞİFRE BELİRLEYİN" required>
				    
										<button type="submit" >
											KAYIT OL
										</button>
			 
 
 
<div id="message">
  <h3>Lütfen Aşağıdaki Kriterlere Uygun Şifre Belirleyin:</h3>
  <p id="letter" class="invalid">En az bir tane <b>KÜÇÜK HARF</b></p>
  <p id="capital" class="invalid">En az bir tane <b>BÜYÜK HARF</b></p>
  <p id="number" class="invalid">En az bir tane <b>RAKAM</b></p>
  <p id="length" class="invalid">En az <b>8 KARAKTER</b></p>
</div>

				
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
<script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
}

  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }

  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>
</body>
</html>