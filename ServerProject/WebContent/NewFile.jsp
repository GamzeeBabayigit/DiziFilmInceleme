<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@page import="java.util.List"%>
<jsp:useBean id="db" class="first.Database"/> 
<%@page import="first.icerik"%>


<%

String kontrol = (String) session.getAttribute("kontrol");
if(kontrol == null){
	response.sendRedirect("http://localhost:8088/ServerProject/Login/login.jsp");
}
db.start();
	List<icerik> icerik = db.listAlliceriks();
	List<icerik> iceriks = db.listAlliceriksFilm();
	List<icerik> icerikss = db.listAlliceriksDizi();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Word of Movie</title>
 <title>Freelancer - Start Bootstrap Theme</title>
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
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Filmler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">Diziler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="http://localhost:8088/ServerProject/Login/AdminPanel/logout.jsp">Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="movie.jpg" alt="" />
                <!-- Masthead Heading-->
               
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
              
            </div>
        </header>
       
         <!-- Portfolio Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Filmler</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
          <div class="row justify-content-center">
              <%
	                  	int i=1;
	                  	for (icerik value : iceriks) 
	                  	{%>
        	  <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
							<div class="alert alert-primary" role="alert" style="font-weight:bold;">
							  <%=value.getBaslik() %>
							</div>
                            <iframe class="img-fluid" width="560" height="315" src="<%=value.getGorsel() %>" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                            <a href='icerikincele.jsp?id="+ String.valueOf(value.getId())+"' class='btn btn-primary'>İncele</a>;
                        </div>
                    </div>
                    <%i++;}%>
	        </div>
              
          </div>
          <!-- Gallery -->
        
                <!-- Portfolio Grid Items-->
                
               
           
        </section>
        <!-- About Section-->
       <section class="page-section portfolio" id="about">
                      <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 style="color:red;" class="page-section-heading text-center text-uppercase text-secondary mb-0">Diziler</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
          <div class="row justify-content-center">
              <%
	                  	int j=1;
	                  	for (icerik value : icerikss) 
	                  	{%>
        	  <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                     
							
						<div class="alert alert-primary" role="alert" style="font-weight:bold;">
							  <%=value.getBaslik() %>
							</div>
                            <iframe class="img-fluid" width="560" height="315" src="<%=value.getGorsel() %>" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
                         
                        </div>
                        
                    </div>
                    <%j++;}%>
	        </div>
              
          </div>
          <!-- Gallery -->
        
                <!-- Portfolio Grid Items-->
                
               
           
        </section>
       

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
    </body>
</html>