<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="first.User"%> 
<%@page import="first.login"%>
<%@page import="java.util.List"%>
<jsp:useBean id="db" class="first.Database"/> 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Word of Movie</title>
 <%
db.start();
String kontrol = (String) session.getAttribute("kontrol");

 

if(request.getParameter("deleteUserID") != null){  
	String deleteIda = (request.getParameter("deleteUserID"));
	
	login dUser1 =db.getkayit(deleteIda);
	if(dUser1 !=null){
		System.out.print(deleteIda);
	
	}
}


String username = (String) session.getAttribute("username");
	List<login> yetki =db.sifredegistir(username);
	
	

%>
 <style>
 
 </style>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top" style="Background-color:black;">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Word of Movie</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#portfolio">Filmler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#about">Diziler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#duyuru">Duyurular</a></li>
                   <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="usersetting.jsp"><i class="fas fa-user-cog"></i></a></li>
<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="http://localhost:8088/ServerProject/Login/AdminPanel/logout.jsp"><i class="fas fa-sign-out-alt"></i>Logout</a></li>                 
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
           
        </header>
       
        
       
         <div class="card">
                <div class="card-header card-header-primary">
          
              <p class="card-category">Bilgilerim</p>
                    
                  
                </div>
                <div class="card-body">
                  <div class="table-responsive" id="tab3">
                    <table class="table">
                      <thead class=" text-primary">
                        <tr>
                 
                    <th>email</th>
                    <th>pasaport</th>
                
                  
                    <th> </th>
                  </tr>
                      </thead>
                      <tbody>
                       <%
                  	int i=1;
                  	for (login value : yetki) {
                  		String tut = "<tr>";
                   
                  		tut += "<td>"+ value.getEmail()+"</td>";
                  		tut += "<td>"+ value.getPass()+"</td>";
                  		
                  		tut += "<td><a href='updatepass.jsp?email="+ String.valueOf(value.getEmail())+"' class='btn btn-primary'>ŞİFRE DEĞİŞTİR</a></td>";

                  	    out.println(tut);
                  	    i++;
                  	}
                  	%>
                      </tbody>
                    </table>
                  </div>
                  
            
                
                  
                </div>
              </div>
        
        
        
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Gamze Babayigit</small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
    
 
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
        <script src="https://kit.fontawesome.com/faf5d83469.js" crossorigin="anonymous"></script>
    </body>
</html>