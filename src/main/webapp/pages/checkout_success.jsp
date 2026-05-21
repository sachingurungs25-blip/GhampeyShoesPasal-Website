<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String phone = (user != null && user.getPhone() != null) ? user.getPhone() : "your registered number";
    request.setAttribute("pageTitle", "Order Complete - Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container" style="margin-top: 80px; max-width: 550px; text-align: center;">
    <div style="background:var(--white); border:1.5px solid var(--gray-200); border-radius:16px; padding:60px 40px; box-shadow:var(--shadow-md);">
        <div style="font-size: 64px; color: var(--accent-green); margin-bottom: 20px; animation: scaleUp 0.3s ease-out;">✓</div>
        <h1 style="font-size: 28px; font-weight: 800; margin-bottom: 16px; color:var(--black); letter-spacing:-0.5px;">Order Confirmed!</h1>
        <p style="font-size: 16px; color: var(--gray-500); line-height:1.6; margin-bottom: 30px;">
            Your order was successful. Our agent will contact you soon to your number <b><%= phone %></b>. Thank you for shopping at Ghampey Shoes Pasal!
        </p>
        <a href="<%= request.getContextPath() %>/HomeServlet" class="btn-filled" style="text-decoration:none; display:inline-block;">Return to Home</a>
    </div>
</div>

<jsp:include page="/pages/footer.jsp" />