<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp"%>
<style>
        
        .otp-card {
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 360px;
        }

        .otp-card h4 {
            text-align: center;
         
            margin-bottom: 20px;
            color: #333;
        }

        .input-group input {
            height: 38px;
        }

        .btn-sm-custom {
            font-size: 0.8rem;
            padding: 6px 12px;
        }
    </style>
</head>
<body>
<%@include file="allComponent/navbar.jsp"%>
<div class="otp-card text-center">
    <h4 class="mb-3">OTP Verification</h4>
    <form action="verifyOtp" method="post">
        <div class="input-group">
            <input type="text" class="form-control text-center" name="otp" placeholder="Enter OTP" required>
            <button class="btn btn-primary btn-sm btn-sm-custom" type="submit">Verify</button>
        </div>
    </form>
</div>


</body>
</html>