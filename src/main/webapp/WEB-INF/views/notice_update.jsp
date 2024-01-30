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
<title>noticeList</title>

<!-- Custom fonts for this template-->
<link href="${path}/a00_com/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${path}/a00_com/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
.input-file-button {
	padding: 6px 25px;
	background-color: #FF6600;
	border-radius: 4px;
	color: white;
	cursor: pointer;
}
.fileform{
	display: none;
}

input[type=file]::file-selector-button {
  width: 100px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}

#chatArea {
	width: 98%;
	margin: auto;
	height: 400px;
	overflow-y: auto;
	text-align: left;
	border: 0.5px solid green;
	font-size: 20px;
}

.img_file{
	width: 40px;
	height: 45px;
}

.form_c{
    font-size: 20px;
    margin: auto;
    width: 98%;
}

</style>

<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
	<script type="text/javascript">
	var sessId = "${empResult.empno}"
		if (sessId == "") {
			alert("로그인을 하여야 현재화면을 볼 수 있습니다\n로그인 페이지 이동")
			location.href = "${path}/login.do"
		}
	$(document).ready(function() {		
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("action","${path}/updateNotice.do")
				$("form").submit()
			}  		 
		})
	});
</script>
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
				<form method="post">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        	<!--  
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                            -->
                            <h1 class="h4 mb-2 text-gray-800 font-weight-bold">제목</h1>
 								<input type="text" class="h3 mb-2 text-gray-800 form-control form_c bg-light"
									placeholder="제목 검색" aria-label="Search"
									aria-describedby="basic-addon2" name="title"
									value="${notice.title}">                           
                            <div class="d-sm-flex justify-content-between">
                           		<input type="hidden" name="no" class="form-control" value="${notice.no}" />
                           		<input type="hidden" name="writer" class="form-control" value="${notice.writer}" />
                           		<input type="hidden" name="readcnt" class="form-control" value="${notice.readcnt}" />
                            </div>
                        </div>
                        <div class="card-body bg-gray-200 contents">
                        	<div class="contents">
                        		<h4 class="h4 mb-2 text-gray-800 font-weight-bold">내용</h4>
                        		<textarea id="chatArea" name="content" class="form-control">${notice.content}</textarea>
                        	</div>
                        </div>
                    </div>
                    <!-- 첨부파일 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="form_c m-0 font-weight-bold text-primary">첨부파일</h6>
						</div>
						<div class="card-body d-sm-flex">
							<img class="img_file" src="${path}/a00_com/img/file_icon.png">&nbsp&nbsp
							<!--   
							<input id="input-file" type="file" class="h3 mb-2 text-gray-800 form-control form_c bg-light"
									aria-label="Search" aria-describedby="basic-addon2" name="reports"
									multiple/>
							 -->
							<c:forEach var="fname" items="${notice.fnames}">					
								<span ondblclick="del_file('${fname}')" >${fname}</span>	
							</c:forEach>	
						</div>
					</div>
					<!-- 버튼 div -->
					<div class="my-2"></div>
					<div class="d-sm-flex justify-content-between">
						<div></div>  
						
						<div>		
							<a id="uptBtn" class="btn btn-info btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
							</span> <span class="text">수정하기</span>
							</a>
													
							<a href="${path}/notice.do" class="btn btn-secondary btn-icon-split"> <span
								class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
							</span> <span class="text">목록으로</span>
							</a>
						</div>

					</div>
				</form>
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