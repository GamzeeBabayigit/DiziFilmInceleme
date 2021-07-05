
<%@page import="first.icerik"%>
<%@page import="first.duyuru"%>
<%@page import="first.login"%>
 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="first.Database"/>  
<%
String kontrol = (String) session.getAttribute("kontrol");
if(kontrol == null){
	
	response.sendRedirect("http://localhost:8088/ServerProject/Login/login.jsp");
}
	db.start();


List<login> users = db.listAllLogin();
List<icerik> icerik =db.listAlliceriks();
List<duyuru> duyuru =db.listAllDuyurus();
%>



<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<!-- Latest compiled and minified CSS -->
 

 
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin Panel</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

           

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Eleman
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Eleman</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Eleman islemleri</h6>
                        <a class="collapse-item" href="elemanekle.jsp">Eleman Ekle</a>
                        <a class="collapse-item" href="elemanlistele.jsp">Eleman Listele</a>
                        <a class="collapse-item" href="elemanlistele.jsp">Eleman Düzenle</a>
                        
                    </div>
                </div>
            </li>

           

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Dizi/Film
            </div>

            <!-- Nav Item - Pages kategori -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Kategori/Tur </span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Kategori islemleri </h6>
                        <a class="collapse-item" href="kategoriekle.jsp">Kategori Ekle</a>
                        <a class="collapse-item" href="kategorilistele.jsp">Kategori Listele</a>
                        <a class="collapse-item" href="kategorilistele.jsp">Kategori Duzenle</a>
                        <h6 class="collapse-header">Tur islemleri</h6>
                         <a class="collapse-item" href="turekle.jsp">Tur Ekle</a>
                        <a class="collapse-item" href="turlistele.jsp">Tur Listele</a>
                        <a class="collapse-item" href="turlistele.jsp">Tur Duzenle</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - tur -->
            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>İçerikler / Duyurular</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                     
                        <a class="collapse-item" href="icerikekle.jsp">İçerik Ekle</a>
                        <a class="collapse-item" href="iceriklistele.jsp">İçerik Listele</a>
                        <a class="collapse-item" href="iceriklistele.jsp">İçerik Düzenle</a>
                
               
                       <h6 class="collapse-header">Duyuru islemleri</h6>
                       
                     
                        <a class="collapse-item" href="duyuruekle.jsp">Duyuru Ekle</a>
                        <a class="collapse-item" href="duyurulistele.jsp">Duyuru Listele</a>
                        <a class="collapse-item" href="duyurulistele.jsp">Duyuru Düzenle</a>
                
                    </div>
                </div>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost:8088/ServerProject/Login/AdminPanel/sifre.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Sifre</span></a>
            </li>
            
              <li class="nav-item">
                <a class="nav-link" href="http://localhost:8088/ServerProject/Login/AdminPanel/yetki.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Yetkilendirme</span></a>
            </li>

			     <li class="nav-item">
                <a class="nav-link" href="http://localhost:8088/ServerProject/Login/AdminPanel/elemanlistele.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Mail Gönder</span></a>
            </li>
			
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

          

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
   <% String username = (String) session.getAttribute("username"); %>
           <%=username%><br>
           
            
                    <!-- Topbar Navbar -->
         
                    <a href="logout.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-sign-out-alt fa-sm text-white-50"></i> Log Out</a>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
   		 <!-- Content Row -->
               <div class="row">
                   <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Kullanıcı Sayısı</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> 
                                            <%
						                  	int i=0;
						                  	for (login value : users) { i++; }
						                  	out.print(i);
						                  	%> 
						                  	
						                  	</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                içerik Sayısı</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%
						                  	int j=0;
						                  	for (icerik value : icerik) { j++; }
						                  	out.print(j);
						                  	%> 
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Duyuru Sayısı</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%
						                  	int d=0;
						                  	for (duyuru value : duyuru) { d++; }
						                  	out.print(d);
						                  	%> 
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <!-- /.container-fluid -->

 
 
 
   <p>  Hızlı İşlemler</p>
  
 <hr>
<div class="row">
                   <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Eleman ekle</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> 
                               
						                  	
						                  	</div>
                                        </div>
                                        <div class="col-auto">
                                        	<a class="btn btn-info" href="http://localhost:8088/ServerProject/Login/AdminPanel/elemanekle.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                İçerik Ekle</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                         
                                            </div>
                                        </div>
                                    <div class="col-auto">
                                        	
                                        	<a class="btn btn-info" href="http://localhost:8088/ServerProject/Login/AdminPanel/icerikekle.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Duyuru Ekle</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                        	
                                        	<a class="btn btn-info" href="http://localhost:8088/ServerProject/Login/AdminPanel/duyuruekle.jsp"><i class="fa fa-plus" aria-hidden="true"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
 


            

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>
</html>