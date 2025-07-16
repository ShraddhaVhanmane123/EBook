<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book Form</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h5 class="text-center text-primary p-1">Sell Old Book</h5>
					
					
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
						
						
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							
							
							
							<input type = "hidden" value="${userobj.email}" name="user">
							<div class="form-group mb-3">
								<label>Book Name*</label> <input type="text"
									class="form-control" name="bname" required>
							</div>
							<div class="form-group mb-3">
								<label>Author Name*</label> <input type="text"
									class="form-control" name="aname" required>
							</div>
							<div class="form-group mb-3">
								<label>Price*</label> <input type="number" class="form-control"
									name="price" required>
							</div>
							<div class="form-group mb-4">
								<label>Upload Book Image</label> <input name="bimg" type="file"
									class="form-control">
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>