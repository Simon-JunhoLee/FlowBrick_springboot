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
<title>Project List</title>




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
 <script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		searchProject()
		
		$("#schBtn").click(function(){
			searchProject()
		})
		
		$("#schPrj").keyup(function(){
			searchProject()
		})
		
		$("#frm01").on("keypress", function(e){
			if(e.keyCode==13){
				e.preventDefault()
				searchProject()
			}
		})
		
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$.ajax({
					type:"post",
					url:"${path}/insertProjectBasic",
					data:$("#frm02").serialize(),
					dataType:"json",
					success:function(data){
						alert(data.msg)
						searchProject()
						$("#clsBtn").click()
						$("#insertTeamBtn").click
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		})
	});
	
	function goDetail(prjNo){
		location.href="${path}/getProjectBasic?prjNo="+prjNo
	}	
	
	function searchProject(){
		$.ajax({
			url : "${path}/projectListJson",
			data : $("#frm01").serialize(),
			dataType : "json",
			success : function(data){
				var prjlist = data
				var html = ""
				$(prjlist).each(function(idx, proj){
					html += "<tr ondblclick='goDetail("+proj.prjNo+")'>"
					html += "<td>"+proj.cnt+"</td>"
					html += "<td>"+proj.prjName+"</td>"
					html += "<td>"+formatDate(proj.prjBegin)+"</td>"
					html += "<td>"+formatDate(proj.prjEnd)+"</td>"
					html += "<td>"+proj.prjPriority+"</td>"
					html += "<td>"+proj.prjStep+"</td>"
					html += "</tr>"
				})		
				$("tbody").html(html)
			},
			error : function(err){
				console.log(err)
			}
		})
	}
	// Function to format date
	function formatDate(dateString) {
	    var date = new Date(dateString);
	    var formattedDate = date.getFullYear() 
	    					+ "-" + padZero(date.getMonth() + 1) 
	    					+ "-" + padZero(date.getDate());
	    return formattedDate;
	}

	// Function to pad zero for single-digit month or date
	function padZero(value) {
	    return value < 10 ? "0" + value : value;
	}
	
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

                     <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Project List</h1>
					<!-- Topbar Search -->
					<form id="frm01" method="post"
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input name="prjName" id="schPrj" type="text" class="form-control border-0 small"
								value="${sch.prjName}" placeholder="Project Name" aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button id="schBtn" class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
					<button id="insertModal" class="btn btn-primary"
							data-toggle="modal" data-target="#insertProjectModal" type="button">등록</button>
<p>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Project Tables</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>                                        	
                                            <th>번호</th>
                                            <th>프로젝트명</th>
                                            <th>시작일</th>                                            
                                            <th>종료일</th>                                            
                                            <th>중요도</th>
                                            <th>진행단계</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
									<ul class="pagination justify-content-center">
									  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.startBlock-1})">Previous</a></li>
									  <c:forEach var="pcnt" begin="1" end="${sch.pageCount}">
									  <li class="page-item ${sch.curPage==pcnt?'active':''}">
									  	<a class="page-link" href="${path}/projectList.do?curPage=${pcnt}">${pcnt}</a>
									  </li>
									  </c:forEach>
									  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.endBlock+1})">Next</a></li>
									</ul>
                            </div>
                        </div>
                    </div>
  

				</div>
				<!-- /.container-fluid -->
				
			</div>
			<!-- End of Main Content -->

			<!-- Insert Project -->
			<div class="modal fade" id="insertProjectModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header"><!-- $("#calTitle").text("일정등록") 
														   $("#regBtn").show()
														   $("#uptBtn").hide()
														   $("#delBtn").hide()
														   $("#calModal").click() -->
								<h5 class="modal-title" id="prjTitle">프로젝트 등록</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="frm02" class="form" method="post">
									<input type="hidden" name="prjNo" value="0"/>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												프로젝트명</span>
										</div>
										<input type="text" name="prjName" class="form-control" value="" placeholder=""/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												중요도</span>
										</div>
										<select name="prjPriority" class="form-control">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>								
										</select> 
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												수주일</span>
										</div>
										<input type="date" name="prjAcceptDateStr" class="form-control" />
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												시작일</span>
										</div>
										<input type="date" name="beginDateStr" class="form-control"/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												종료일</span>
										</div>
										<input type="date" name="endDateStr" class="form-control"/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												진행단계</span>
										</div>
										<select name="prjStep" class="form-control">
											<option value="설계">설계</option>
											<option value="개발">개발</option>
											<option value="테스트">테스트</option>
											<option value="디버깅">디버깅</option>
										</select>
									</div>
								</form>
							</div>
							<div class="modal-footer"><!-- $("regBtn").show() 
														   $("uptBtn").hide()
														   $("delBtn").hide() -->
								<button type="button" id="regBtn" class="btn btn-primary">프로젝트 등록</button>
								<button id="insertTeamBtn" class="btn btn-primary hidden"
										data-toggle="modal" data-target="#insertTeamModal" type="button">팀원등록</button>
								<button type="button" id="clsBtn" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
							<script type="text/javascript">
								
							</script>
						</div>
					</div>
				</div>
			<!-- End of Insert Project -->

			<!-- Insert Team -->
			<div class="modal fade" id="insertTeamModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header"><!-- $("#calTitle").text("일정등록") 
														   $("#regBtn").show()
														   $("#uptBtn").hide()
														   $("#delBtn").hide()
														   $("#calModal").click() -->
								<h5 class="modal-title" id="prjTitle">팀원 등록</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="frm02" class="form" method="post">
									<input type="hidden" name="prjNo" value="0"/>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												팀명</span>
										</div>
										<input type="text" name="prjName" class="form-control" value="" placeholder=""/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												팀원</span>
										</div>
										<select name="prjPriority" class="form-control">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>								
										</select> 
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												수주일</span>
										</div>
										<input type="date" name="prjAcceptDateStr" class="form-control" />
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												시작일</span>
										</div>
										<input type="date" name="beginDateStr" class="form-control"/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												종료일</span>
										</div>
										<input type="date" name="endDateStr" class="form-control"/>
									</div>
									<div class="input-group mb-3">
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">
												진행단계</span>
										</div>
										<select name="prjStep" class="form-control">
											<option value="설계">설계</option>
											<option value="개발">개발</option>
											<option value="테스트">테스트</option>
											<option value="디버깅">디버깅</option>
										</select>
									</div>
								</form>
							</div>
							<div class="modal-footer"><!-- $("regBtn").show() 
														   $("uptBtn").hide()
														   $("delBtn").hide() -->
								<button type="button" id="regBtn" class="btn btn-primary">프로젝트 등록</button>
								<button type="button" id="uptBtn" class="btn btn-info">일정수정</button>
								<button type="button" id="delBtn" class="btn btn-warning">일정삭제</button>
								<button type="button" id="clsBtn" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
							<script type="text/javascript">
								
							</script>
						</div>
					</div>
				</div>
			<!-- End of Insert Team -->


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