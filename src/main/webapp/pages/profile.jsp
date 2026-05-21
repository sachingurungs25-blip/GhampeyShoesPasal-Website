<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User" %>
<% User user = (User) session.getAttribute("user"); if(user == null) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; } %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile | Ghampey Shoes Pasal</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        .profile-container { max-width: 600px; margin: 100px auto; padding: 40px; background: #fff; border-radius: 12px; border: 1px solid #e5e5e5; }
        .form-group { margin-bottom: 20px; }
        .form-group input { width: 100%; padding: 12px; border: 1px solid #e5e5e5; border-radius: 6px; }
        .btn { background: #0a0a0a; color: #fff; padding: 12px 24px; border: none; border-radius: 6px; cursor: pointer; }
    </style>
</head>
<body>
    <nav style="padding:20px 48px; border-bottom:1px solid #e5e5e5;">
        <a href="../HomeServlet" style="text-decoration:none; color:#000; font-weight:800;">GHYAMPE'S</a>
        <a href="../LogoutServlet" style="float:right; text-decoration:none; color:#000;">Logout</a>
    </nav>
    <div class="profile-container">
        <h2>My Profile</h2>
        <% if(request.getAttribute("msg") != null) { %><p style="color:green;"><%= request.getAttribute("msg") %></p><% } %>
        <% if(request.getAttribute("error") != null) { %><p style="color:red;"><%= request.getAttribute("error") %></p><% } %>
        
        <form action="../UserProfileServlet" method="post">
            <input type="hidden" name="action" value="updateInfo">
            <div class="form-group"><label>Full Name</label><input type="text" name="fullName" value="<%= user.getFullName() %>" required></div>
            <div class="form-group"><label>Username (Cannot change)</label><input type="text" value="<%= user.getUsername() %>" disabled></div>
            
            <button type="submit" class="btn">Update Profile</button>
        </form>
        <hr style="margin:40px 0; border:none; border-top:1px solid #e5e5e5;">
        <h3>Change Password</h3>
        <form action="../UserProfileServlet" method="post" style="margin-top:20px;">
            <input type="hidden" name="action" value="updatePassword">
            <div class="form-group"><label>New Password</label><input type="password" name="newPassword" required></div>
            <button type="submit" class="btn">Change Password</button>
        </form>
    </div>
</body>
</html>
