<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container">
		<div class="row">

			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center text-primary">Edit Profile</h4>

						<c:if test="${not empty successmsg}">
							<div class="alert alert-success">${successmsg}</div>
						</c:if>

						<c:if test="${not empty failedmsg}">
							<div class="alert alert-danger">${failedmsg}</div>
						</c:if>
						<form action="update_profile" method="post">

							<input type="hidden" name="id" value="${userobj.id}">

							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="name"
									value="${userobj.name}">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email}">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone No*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userobj.phno}">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<button type="submit" class="btn btn-primary pt-1 mt-1">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>