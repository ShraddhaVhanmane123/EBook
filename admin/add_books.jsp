<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="navbar.jsp" %>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">Add New Book</h4>

						<!-- Success Alert -->
						<c:if test="${not empty sessionScope.successmsg}">
							<div class="alert alert-success alert-dismissible fade show" role="alert">
								${sessionScope.successmsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							<c:remove var="successmsg" scope="session" />
						</c:if>

						<!-- Error Alert -->
						<c:if test="${not empty sessionScope.failedmsg}">
							<div class="alert alert-danger alert-dismissible fade show" role="alert">
								${sessionScope.failedmsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							<c:remove var="failedmsg" scope="session" />
						</c:if>

						<form action="../add_books" method="post" enctype="multipart/form-data">
							<div class="form-group mb-3">
								<label>Book Name*</label>
								<input type="text" class="form-control" name="bname" required>
							</div>
							<div class="form-group mb-3">
								<label>Author Name*</label>
								<input type="text" class="form-control" name="aname" required>
							</div>
							<div class="form-group mb-3">
								<label>Price*</label>
								<input type="number" class="form-control" name="price" required>
							</div>
							<div class="form-group mb-3">
								<label>Book Categories</label>
								<select name="btype" class="form-control">
									<option selected disabled>Select...</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group mb-3">
								<label>Book Status</label>
								<select name="bstatus" class="form-control">
									<option selected disabled>Choose...</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group mb-4">
								<label>Upload Book Image</label>
								<input name="bimg" type="file" class="form-control">
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Add Book</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>
