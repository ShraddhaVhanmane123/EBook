<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="allComponent/allCss.jsp"%>
    <title>Update Password</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body{
        align-items: center;
            justify-content: center;
        }

        .update-card {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            
        }

        .update-card h4 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .form-control:focus {
            border-color: #2575fc;
            box-shadow: 0 0 0 0.2rem rgba(37, 117, 252, 0.25);
        }

        .btn-custom {
            background-color: #2575fc;
            border: none;
        }

        .btn-custom:hover {
            background-color: #1e5ed2;
        }
    </style>
</head>
<body>
<%@include file="allComponent/navbar.jsp"%>
<div class="update-card">
    <h4>Set New Password</h4>
    <form action="updatePassword" method="post">
        <div class="mb-3">
            <input type="password" name="password" class="form-control" placeholder="New Password" required>
        </div>
        <button type="submit" class="btn btn-custom w-100">Update Password</button>
    </form>
</div>

</body>
</html>
