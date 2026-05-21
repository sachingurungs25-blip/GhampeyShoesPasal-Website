<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, com.ghyampes.model.User, java.util.List" %>
<%
    List<CartItem> headerCart = (List<CartItem>) session.getAttribute("cart");
    int headerCartCount = (headerCart != null) ? headerCart.size() : 0;
    User headerUser = (User) session.getAttribute("user");
    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) {
        pageTitle = "Ghampey Shoes Pasal | Premium Footwear in Nepal";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= pageTitle %></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<!-- NAVBAR -->
<nav>
    <a href="<%= request.getContextPath() %>/HomeServlet" class="nav-logo">Ghampey <span>SHOES PASAL</span></a>
    
    <ul class="nav-links">
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Men">Men</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Women">Women</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Kids">Kids</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Sale">Sale</a></li>
    </ul>
    
    <div class="nav-actions">
        <a href="<%= request.getContextPath() %>/CartServlet" class="cart-icon">🛒 Cart (<span id="desktop-cart-count"><%= headerCartCount %></span>)</a>
        
        <% if(headerUser != null) { %>
            <a href="<%= request.getContextPath() %>/UserProfileServlet" class="btn-outline">My Profile</a>
            <% if("admin".equals(headerUser.getRole())) { %>
                <a href="<%= request.getContextPath() %>/AdminDashboardServlet" class="btn-filled">Admin</a>
            <% } %>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn-filled" style="background:#ef4444; border-color:#ef4444;">Logout</a>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/LoginServlet" class="btn-outline">Sign In</a>
            <a href="<%= request.getContextPath() %>/RegisterServlet" class="btn-filled">Join Us</a>
        <% } %>
    </div>
    
    <button type="button" class="hamburger" id="hamburger-btn" aria-label="Toggle Menu">☰</button>
</nav>

<!-- MOBILE MENU BACKDROP -->
<div class="mobile-menu-backdrop" id="drawer-backdrop"></div>

<!-- MOBILE NAV DRAWER -->
<div class="mobile-menu-drawer" id="mobile-drawer">
    <ul class="mobile-nav-links">
        <li><a href="<%= request.getContextPath() %>/HomeServlet">Home</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Men">Men's Collection</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Women">Women's Collection</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Kids">Kids' Collection</a></li>
        <li><a href="<%= request.getContextPath() %>/ProductServlet?category=Sale">Sale Items</a></li>
        <li><a href="<%= request.getContextPath() %>/CartServlet">🛒 Cart (<%= headerCartCount %>)</a></li>
    </ul>
    
    <div class="mobile-nav-actions">
        <% if(headerUser != null) { %>
            <a href="<%= request.getContextPath() %>/UserProfileServlet" class="btn-outline">My Profile</a>
            <% if("admin".equals(headerUser.getRole())) { %>
                <a href="<%= request.getContextPath() %>/AdminDashboardServlet" class="btn-filled">Admin Dashboard</a>
            <% } %>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn-filled" style="background:#ef4444; border-color:#ef4444;">Logout</a>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/LoginServlet" class="btn-outline">Sign In</a>
            <a href="<%= request.getContextPath() %>/RegisterServlet" class="btn-filled">Join Us</a>
        <% } %>
    </div>
</div>
