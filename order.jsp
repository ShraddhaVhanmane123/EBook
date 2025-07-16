<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Orders</title>
    <%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="allComponent/navbar.jsp"%>

<%
    User u = (User) session.getAttribute("userobj");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
    List<Book_order> blist = dao.getBook(u.getEmail());
%>

<div class="container p-2">
    <h3 class="text-center text-primary">Your Orders</h3>

    <table class="table table-striped mt-3">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Name</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (blist != null && !blist.isEmpty()) {
                for (Book_order b : blist) {
        %>
            <tr>
                <td><%= b.getOrderId() %></td>
                <td><%= b.getUsername() %></td>
                <td><%= b.getBookName() %></td>
                <td><%= b.getAuthor() %></td>
                <td>₹<%= b.getPrice() %></td>
                <td><%= b.getPaymentType() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6" class="text-center text-danger">No orders found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
