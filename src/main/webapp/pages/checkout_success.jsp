<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String phone = (user != null && user.getPhone() != null) ? user.getPhone() : "your registered number";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Complete - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fafafa; margin:0; padding:0; display:flex; align-items:center; justify-content:center; min-height:100vh; text-align:center; }
        .success-box { background: #fff; padding: 60px 40px; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); max-width:500px; width:100%; }
        .icon { font-size: 64px; color: #52c41a; margin-bottom: 20px; }
        h1 { font-size: 28px; font-weight: 800; margin-bottom: 15px; color:#212121; }
        p { font-size: 16px; color: #757575; line-height:1.6; margin-bottom: 30px; }
        .btn { background: #0a0a0a; color: white; border: none; padding: 12px 32px; border-radius: 40px; text-decoration: none; font-weight: 600; font-size: 15px; display:inline-block; }
        .btn:hover { background: #333; }
    </style>
</head>
<body>
    <div class="success-box">
        <div class="icon">✓</div>
        <h1>Order Confirmed!</h1>
        <p>Your order was successful. Our agent will contact you soon to your number <b><%= phone %></b>. Thank you for shopping at Ghampey Shoes Pasal!</p>
        <a href="../HomeServlet" class="btn">Return to Home</a>
    </div>
</body>
</html>