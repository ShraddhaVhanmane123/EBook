<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"/>
	</c:if>

	<c:if test="${not empty sessionScope.successmsg}">
		<div class="alert alert-success text-center" role="alert">
			${sessionScope.successmsg}</div>
		<c:remove var="successmsg" scope="session" />
	</c:if>

	<!-- Failure Message -->
	<c:if test="${not empty sessionScope.failedmsg}">
		<div class="alert alert-danger text-center" role="alert">
			${sessionScope.failedmsg}</div>
		<c:remove var="failedmsg" scope="session" />
	</c:if>
	<div class="container">
		<div class="row p-2">
			<!-- Cart Table -->
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Book Name</th>
									<th>Author</th>
									<th>Price</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty sessionScope.userobj}">
									<c:redirect url="login.jsp" />
								</c:if>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								double totalPrice = 0.0;
								for (Cart c : cart) {
								    totalPrice += c.getTotalPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td>₹<%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td colspan="3" class="text-right font-weight-bold">Total
										Price:</td>
									<td>₹<%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Order Form -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						
						<input type="hidden" name="id" value="${userobj.id}">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="username" value="${userobj.name}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email" value="${userobj.email}"required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="phone">Phone No</label> <input type="number"
										class="form-control" id="phone" name="phno" value="${userobj.phno}"required>
								</div>
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address"required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark" name="landmark"
										value="<%=u.getLandmark()%>"required>
								</div>
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text" name="city"
										class="form-control" id="city"required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="state">State</label> <input type="text" name="state"
										class="form-control" id="state"required>
								</div>
								<div class="form-group col-md-6">
									<label for="zip">Pincode</label> <input type="number" name="pincode"
										class="form-control" id="zip"required>
								</div>
							</div>

							<div class="form-group">
								<label for="btype">Payment Type</label> <select name="payment"
									class="form-control" id="btype" required>
									<option value="noselect">Select...</option>
									<option value="COD">Cash on Delivery</option>
									<option value="ONLINE">Buy Online</option>
								</select>
							</div>

							<div class="text-center">
							<button type="button" class="btn btn-warning" id="payBtn">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Optional: Auto-hide alert -->
	<script>
        setTimeout(() => {
            document.querySelectorAll('.alert').forEach(el => el.style.display = 'none');
        }, 3000);
    </script>
   <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    document.getElementById('payBtn').onclick = function (e) {
        var paymentType = document.getElementById('btype').value;

        if (paymentType === 'ONLINE') {  // ✅ Fixed condition
            var options = {
                "key": "rzp_test_nAPXFCPhg2av6p",  // ✅ Replace with your Razorpay test key
                "amount": "<%= (int)(totalPrice * 100) %>",  // ✅ Total price * 100 (paise)
                "currency": "INR",
                "name": "Ebook Store",
                "description": "Book Purchase",
                "handler": function (response) {
                    alert("Payment ID: " + response.razorpay_payment_id);
                    // ✅ You can save the ID if needed
                    document.querySelector("form").submit(); // ✅ Submit after successful payment
                },
                "prefill": {
                    "name": "<%= u.getName() %>",
                    "email": "<%= u.getEmail() %>",
                    "contact": "<%= u.getPhno() %>"
                },
                "theme": {
                    "color": "#3399cc"
                }
            };
            var rzp = new Razorpay(options);
            rzp.open();
            e.preventDefault();
        } else if (paymentType === 'COD') {
            document.querySelector("form").submit(); // COD: Submit form normally
        } else {
            alert("Please select a valid payment type.");
        }
    }
</script>
</body>
</html>
