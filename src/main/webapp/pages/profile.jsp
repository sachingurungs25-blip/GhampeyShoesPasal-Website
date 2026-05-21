<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User" %>
<% 
    User user = (User) session.getAttribute("user"); 
    if(user == null) { 
        response.sendRedirect(request.getContextPath() + "/LoginServlet"); 
        return; 
    } 
    request.setAttribute("pageTitle", "My Profile | Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container" style="margin-top: 80px; max-width: 600px;">
    <div style="background:var(--white); border:1.5px solid var(--gray-200); border-radius:16px; padding:40px; box-shadow:var(--shadow-md);">
        <h2 style="font-size:28px; font-weight:800; margin-bottom:24px; letter-spacing:-0.5px;">My Profile</h2>
        
        <% if(request.getAttribute("msg") != null) { %>
            <div style="background:#ecfdf5; border:1px solid #a7f3d0; color:#065f46; padding:12px; border-radius:8px; margin-bottom:20px; font-size:14px; text-align:center;">
                <%= request.getAttribute("msg") %>
            </div>
        <% } %>
        <% if(request.getAttribute("error") != null) { %>
            <div style="background:#fff0f0; border:1px solid #fca5a5; color:#dc2626; padding:12px; border-radius:8px; margin-bottom:20px; font-size:14px; text-align:center;">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="<%= request.getContextPath() %>/UserProfileServlet" method="post" style="margin:0;">
            <input type="hidden" name="action" value="updateInfo">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" value="<%= user.getFullName() %>" required>
            </div>
            <div class="form-group">
                <label>Username (Cannot change)</label>
                <input type="text" value="<%= user.getUsername() %>" disabled style="background:var(--gray-200); color:var(--gray-500); cursor:not-allowed;">
            </div>
            
            <button type="submit" class="btn-submit" style="width:auto; padding:12px 30px;">Update Profile</button>
        </form>
        
        <hr style="margin:40px 0; border:none; border-top:1px solid var(--gray-200);">
        
        <h3 style="font-size:20px; font-weight:800; margin-bottom:20px;">Change Password</h3>
        <form action="<%= request.getContextPath() %>/UserProfileServlet" method="post" style="margin:0;">
            <input type="hidden" name="action" value="updatePassword">
            <div class="form-group">
                <label>New Password</label>
                <input type="password" name="newPassword" placeholder="Enter new password" required>
            </div>
            <button type="submit" class="btn-submit" style="width:auto; padding:12px 30px;">Change Password</button>
        </form>
    </div>
</div>

<jsp:include page="/pages/footer.jsp" />
