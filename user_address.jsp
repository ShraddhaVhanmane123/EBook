<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">

			<div class="col-md-4 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Add Address</h3>
					<form action="">
					
					<div class="form-row">
								
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address">
								</div>
								
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="landmark">City</label> <input type="text"
										class="form-control" id="landmark">
								</div>
								<div class="form-group col-md-4">
									<label for="city">State</label> <input type="text"
										class="form-control" id="city">
								</div>
								
								<div class="form-group col-md-4">
									<label for="city">Zip</label> <input type="text"
										class="form-control" id="city">
								</div>
							</div>
							
							<div class="text-center">
							<button class="btn btn-warning text-white">Add Address</button>
							</div>
					</form>
					
					</div>

				</div>
			</div>

		</div>
	</div>

</body>
</html>