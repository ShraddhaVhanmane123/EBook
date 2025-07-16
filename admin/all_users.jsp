<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file="navbar.jsp"%>
<%@include file="allCss.jsp"%>

<div class="container mt-5">
	<h3 class="text-center">All Registered Users</h3>
	<table class="table table-bordered table-striped mt-4">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="u" items="${users}">
				<tr>
					<td>${u.id}</td>
					<td>${u.name}</td>
					<td>${u.email}</td>
					<td>${u.phno}</td>
					<td>${u.password}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@include file="footer.jsp"%>