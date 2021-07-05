<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="first.icerik"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<jsp:useBean id="db" class="first.Database"/> 

<% 
String kontrol = (String) session.getAttribute("kontrol");
if(kontrol == "0"){
	response.sendRedirect("http://localhost:8088/ServerProject/Login/login.jsp");
}

icerik icerik;
if(request.getParameter("id") == null){  
	response.sendRedirect("iceriklistele.jsp");
	return;
	
}else{
	db.start();
	icerik = db.geticerik(Integer.parseInt(request.getParameter("id")));
	if(icerik == null){
		response.sendRedirect("iceriklistele.jsp");
		return;
	}
	if(request.getParameter("Baslik") !=null){
		icerik.setBaslik(request.getParameter("Baslik"));
		icerik.seticerik(request.getParameter("icerik"));
		icerik.setYapimYili(request.getParameter("YapimYili"));
		icerik.setOyuncular(request.getParameter("Oyuncular"));
		icerik.setTur(request.getParameter("Tur"));
		icerik.setKategori(request.getParameter("Kategori"));
		icerik.setGorsel(request.getParameter("Gorsel"));
		icerik.setYazar(request.getParameter("Yazar"));

	}
}

%>
    
<!DOCTYPE html>
<html>
<head>
<style> 
.form__group {
	 position: relative;
	 padding: 15px 0 0;
	 margin-top: 10px;
	 width: 50%;
}
 .form__field {
	 font-family: inherit;
	 width: 100%;
	 border: 0;
	 border-bottom: 2px solid #9b9b9b;
	 outline: 0;
	 font-size: 1.3rem;
	 color: #fff;
	 padding: 7px 0;
	 background: transparent;
	 transition: border-color 0.2s;
}
 .form__field::placeholder {
	 color: transparent;
}
 .form__field:placeholder-shown ~ .form__label {
	 font-size: 1.3rem;
	 cursor: text;
	 top: 20px;
}
 .form__label {
	 position: absolute;
	 top: 0;
	 display: block;
	 transition: 0.2s;
	 font-size: 1rem;
	 color: #9b9b9b;
}
 .form__field:focus {
	 padding-bottom: 6px;
	 font-weight: 700;
	 border-width: 3px;
	 border-image: linear-gradient(to right, #11998e, #38ef7d);
	 border-image-slice: 1;
}
 .form__field:focus ~ .form__label {
	 position: absolute;
	 top: 0;
	 display: block;
	 transition: 0.2s;
	 font-size: 1rem;
	 color: #11998e;
	 font-weight: 700;
}
/* reset input */
 .form__field:required, .form__field:invalid {
	 box-shadow: none;
}

.text-secondary {
    color: darkred !important;
}

 </style>
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
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#portfolio">Filmler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#about">Diziler</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="index.jsp#duyuru">Duyurular</a></li>
                   		<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="usersetting.jsp"><i class="fas fa-user-cog"></i></a></li>
                       
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
  
       <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
             	<iframe class="img " width="1120" height="720" src="<%=icerik.getGorsel()%>" frameborder="0" gesture="media" allow="encrypted-media" ></iframe>
 
              
            </div>
        </header>
 
       
                    <div class="container" style="width: 50%;">
                      <div class="col-md ">
                        <div class="form-group">
                          <label class="bmd-label-floating"style="color:darkred;">Başlık</label>
                          <input name="Baslik" type="text" id="Baslik" type="text" class="form__field" placeholder="Başlık" value="<%=icerik.getBaslik()%>" disabled>
                        </div>
                      </div>
                      <div class="col-md">
                        <div class="form-group">
                          <label class="bmd-label-floating"style="color:darkred;">İçerik</label>
                          
	              			<input name="icerik" type="text" id="icerik" class="form__field" placeholder="icerik" value="<%=icerik.geticerik()%>" disabled>
                        </div>
                      </div>
                     
                     
                      <div class="col-md">
                        <div class="form-group">
                          <label class="bmd-label-floating"style="color:darkred;">Yapım Yılı</label>
                  <input name="YapimYili" type="text" id="YapimYili" class="form__field" placeholder="YapimYili" value="<%=icerik.getYapimYili()%>" disabled>
                        </div>
                      </div>
                      <div class="col-md">
                        <div class="form-group"style="color:darkred;">
                          <label class="bmd-label-floating">Oyuncular</label>
	              <input name="Oyuncular" type="text" id="Oyuncular" class="form__field" placeholder="Oyuncular" value="<%=icerik.getOyuncular()%>" disabled >
                        </div>
                      </div>
                      
                     
                         
                      <div class="col-md">
                        <div class="form-group">
                          <label class="bmd-label-floating"style="color:darkred;">Tür</label>
                  <input name="Tur" type="text" id="Tur" class="form__field" placeholder="Tur" value="<%=icerik.getTur()%>" disabled>
                        </div>
                      </div>
                      <div class="col-md">
                        <div class="form-group">
                          <label class="bmd-label-floating" style="color:darkred;">Kategori</label>
	              <input name="Kategori" type="text" id="Kategori" class="form__field" placeholder="Kategori" value="<%=icerik.getKategori()%>" disabled>
                        </div>
                      </div>
                      
                      
                      <div class="col-md">
                        <div class="form-group">
                          <label class="bmd-label-floating"style="color:darkred;">Yazar</label>
	              <input name="Yazar" type="Text" id="Yazar" class="form__field" placeholder="Yazar" value="<%=icerik.getYazar()%>" disabled>
                        </div>
                      </div>
                      
                  </div>
        
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>2021 - Gamze Babayigit</small></div>
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