<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pms-login</title>




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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#loginBtn").click(function() {

			//초기화 구문
			$('.failurePassword-message').addClass('hide');

			// 입력 필드 검증
			var empno = $("#empno").val();
			var password = $("#password").val();

			if (empno === "") {
				$("#empno").focus();
				$('.failureId-message').removeClass('hide');

				return; // 사원번호가 비어있으면 처리 중단
			} else {
				$('.failureId-message').addClass('hide');
			}

			if (password === "") {
				$("#password").focus();
				$('.failurePassword-message').removeClass('hide');
				return; // 비밀번호가 비어있으면 처리 중단
			}

			// 모든 검증이 통과되면 폼 제출
				$("#loginFrm").submit();
			})
		

		//로그인 처리
		var empno = "${emp.empno}"
		var sessEmpno = "${empResult.empno}"
		if (empno != "") {
			if (sessEmpno != "") {
				location.href = "${path}/index.do";
			} else {
				alert("로그인 실패\n사원번호 또는 비밀번호가 틀렸습니다.");
			}
		}

	});
</script>










<!-- Custom fonts for this template-->
<link href="${path}/a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/a00_com/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${path}/a00_com/css/login.css" rel="stylesheet">


</head>





<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block login-image">
								<img src="${path}/a00_com/img/login.jpg">
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<div class="brand-icon">
											<img class='img-icon' src="${path}/a00_com/img/FB_icon4.png">
										</div>
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user" method="post" id="loginFrm">
										<div class="form-group">
											<input type="number" name="empno"
												class="form-control form-control-user" id="empno"
												placeholder="사원번호 입력">
										</div>
										<div class="failureId-message hide error-message">사원번호를
											입력해주세요</div>
										<div class="form-group">
											<input type="password" name="password"
												class="form-control form-control-user" id="password"
												placeholder="비밀번호 입력">
										</div>
										<div class="failurePassword-message hide error-message">비밀번호를
											입력해주세요</div>
										<!-- <div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div> -->
										<button type="button"
											class="btn btn-primary btn-user btn-block" id=loginBtn>로그인</button>
										<!-- <hr> -->
										<!-- <a href="index.html" class="btn btn-google btn-user btn-block">
											<i class="fab fa-google fa-fw"></i> Login with Google
										</a> <a href="index.html"
											class="btn btn-facebook btn-user btn-block"> <i
											class="fab fa-facebook-f fa-fw"></i> Login with Facebook
										</a> -->
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="${path}/forgot.do">사원번호/비밀번호찾기</a>
									</div>
									<!-- <div class="text-center">
										<a class="small" href="forgot-password.html">비밀번호 찾기</a>
									</div> -->
									<!-- <div class="text-center">
										<a class="small" href="register.html">사원번호 등록 신청</a>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>


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