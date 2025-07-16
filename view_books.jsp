<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="allComponent/navbar.jsp"%>

<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
    BookDetails b = dao.getBookById(bid);
%>

<div class="container p-3">
    <div class="row p-5">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="book/<%=b.getPhotoName()%>" style="height: 200px; width: 100px;"><br>
            <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
            <h4>Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
            <h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
        </div>

        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%=b.getBookName()%></h2>

            <%
                if ("old".equalsIgnoreCase(b.getBookCategory())) {
            %>
            <h5 class="text-primary">Contact to Seller</h5>
            
            <h5><i class="fa-regular fa-envelope"></i> Email: <%=b.getUserEmail()%></h5>
            <%
                }
            %>

            <div class="row">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                    <p>Cash on Delivery</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
                    <p>Return available</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-truck-moving fa-2x"></i>
                    <p>Free delivery</p>
                </div>
            </div>

            <%
                if ("old".equalsIgnoreCase(b.getBookCategory())) {
            %>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>
                <a href="#" class="btn btn-danger">₹<%=b.getPrice()%></a>
            </div>
            <%
                } else {
            %>
            <div class="text-center p-3">
                <a href="cart" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                <a href="#" class="btn btn-danger">₹<%=b.getPrice()%></a>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
