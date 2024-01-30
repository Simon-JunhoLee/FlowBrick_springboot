a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good day!!</title>




<%--
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
 --%>
 
 
     <!-- Custom fonts for this template-->
    <link href="${path}/a00_com/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${path}/a00_com/css/sb-admin-2.min.css" rel="stylesheet">
 
 
 
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="inc/sliderBar.jsp" %>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar    -->
				<%@ include file="inc/topBar.jsp" %>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

                     <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
				    <div class="container">
				
				        <div class="card o-hidden border-0 shadow-lg my-5">
				            <div class="card-body p-0">
				                <!-- Nested Row within Card Body -->
				                <div class="row">
				                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
				                    <div class="col-lg-7">
				                        <div class="p-5">
				                            <div class="text-center">
				                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
				                            </div>
				                            <form class="user">
				                                <div class="form-group row">
				                                    <div class="col-sm-6 mb-3 mb-sm-0">
				                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
				                                            placeholder="First Name">
				                                    </div>
				                                    <div class="col-sm-6">
				                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
				                                            placeholder="Last Name">
				                                    </div>
				                                </div>
				                                <div class="form-group">
				                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
				                                        placeholder="Email Address">
				                                </div>
				                                <div class="form-group row">
				                                    <div class="col-sm-6 mb-3 mb-sm-0">
				                                        <input type="password" class="form-control form-control-user"
				                                            id="exampleInputPassword" placeholder="Password">
				                                    </div>
				                                    <div class="col-sm-6">
				                                        <input type="password" class="form-control form-control-user"
				                                            id="exampleRepeatPassword" placeholder="Repeat Password">
				                                    </div>
				                                </div>
				                                <a href="login.html" class="btn btn-primary btn-user btn-block">
				                                    Register Account
				                                </a>
				                                <hr>
				                                <a href="index.html" class="btn btn-google btn-user btn-block">
				                                    <i class="fab fa-google fa-fw"></i> Register with Google
				                                </a>
				                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
				                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
				                                </a>
				                            </form>
				                            <hr>
				                            <div class="text-center">
				                                <a class="small" href="forgot-password.html">Forgot Password?</a>
				                            </div>
				                            <div class="text-center">
				                                <a class="small" href="login.html">Already have an account? Login!</a>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				
				    </div>
  

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<%@ include file="inc/logout_modal.jsp" %>
	
<!-- Bootstrap core JavaScript-->
    <script src="${path}/a00_com/vendor/jquery/jquery.min.js"></script>
<script
	src="${path}/a00_com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${path}/a00_com/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path}/a00_com/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${path}/a00_com/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="${path}/a00_com/js/demo/chart-area-demo.js"></script>
<script src="${path}/a00_com/js/demo/chart-pie-demo.js"></script>	
</body>
</html>