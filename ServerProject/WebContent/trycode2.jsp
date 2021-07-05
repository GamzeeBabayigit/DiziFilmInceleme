<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="first.User"%>
<%@page import="first.login"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<jsp:useBean id="db" class="first.Database"/> 
<%@page import="java.util.List"%>

<% 
String kontrol = (String) session.getAttribute("kontrol");
 
String username = (String) session.getAttribute("username");
List<login> yetki =db.sifredegistir(username);

login user;
if(request.getParameter("id") == null){  
	response.sendRedirect("usersetting.jsp");
	return;
}else{
	db.start();
	user = db.getkayit(request.getParameter("id").toString());
	
	if(request.getParameter("firstname") !=null){
		
		user.setPass(request.getParameter("firstname"));
		
		boolean result = db.updatesifrek(user);
		
		response.sendRedirect("usersetting.jsp");
		
	}
}

%>
 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>    
<%=session.getAttribute("resetpass") %> benim şifre

   <% String email = (String) session.getAttribute("email"); %>
           <%=email%><br>
	
           <%
         	int i=1;
         	for (login value : yetki) { %>
         	<p>	<%=value.getId()%> </p>
        <% 	}
           %>
           
  <input name="firstname" type="text" id="firstName" type="text" class="form-control" value="gamze" required="required">
	<p id="resetpass"></p>
<script>
var letters = ['a','b','c','d','e','f','g','h','i','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
var numbers = [0,1,2,3,4,5,6,7,8,9];
var randomstring = '';

    for(var i=0;i<5;i++){
        var rlet = Math.floor(Math.random()*letters.length);
        randomstring += letters[rlet];
    }
    for(var i=0;i<3;i++){
        var rnum = Math.floor(Math.random()*numbers.length);
        randomstring += numbers[rnum];
    }
 
 var newpass = randomstring;

 Session.setAttribute("newpass", request.getParameter("newpass"));
 document.getElementById("resetpass").innerHTML=newpass;
 </script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
 </script><script src="jquery-3.5.1.min.js"></script>
</body>
</html>