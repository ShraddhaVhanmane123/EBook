<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">

						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<div class="card">
					<a href="all_books.jsp">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Books</h4>
							------------
						</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
				<div class="card">
					<a href="order_books.jsp">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							------------
						</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Log Out</h4>
							------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 mt-3">
				<a href="${pageContext.request.contextPath}/admin/allUsers"
					class="btn btn-info">View All Users
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid  fa-users fa-3x text-success"></i><br>
							<h4>Restore Backup</h4>
							------------
						</div>
					</div>
				</a>
			</div>


		</div>
		
	</div>
	<!--Start Logout Modal  -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want logout</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">No</button>
						<a href="../logout"><button type="button"
								class="btn btn-primary text-white">Logout</button></a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Logout Modal -->
	<div class="" style="margin-top: 190px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>