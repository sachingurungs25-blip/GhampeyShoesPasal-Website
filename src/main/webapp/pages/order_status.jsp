<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Order - Ghampey Shoes Pasal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box; }

        :root {
            --black: #0a0a0a;
            --white: #ffffff;
            --gray-100: #f5f5f5;
            --gray-200: #e5e5e5;
            --gray-500: #737373;
            --accent: #c8ff00;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--white);
            color: var(--black);
            overflow-x: hidden;
        }

        /* ---- NAVBAR ---- */
        nav {
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 999;
            background: rgba(255,255,255,0.92);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--gray-200);
            padding: 0 48px;
            height: 64px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .nav-logo {
            font-size: 20px;
            font-weight: 900;
            letter-spacing: -0.8px;
            text-decoration: none;
            color: var(--black);
            text-transform: uppercase;
        }

        .nav-logo span {
            color: var(--black);
            background: var(--black);
            color: var(--accent);
            padding: 2px 8px;
            border-radius: 4px;
        }

        .nav-links {
            display: flex;
            gap: 36px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--black);
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 0.3px;
            transition: color 0.2s;
        }

        .nav-links a:hover { color: var(--gray-500); }

        .nav-actions {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .btn-outline {
            text-decoration: none;
            color: var(--black);
            font-size: 14px;
            font-weight: 600;
            padding: 8px 20px;
            border: 1.5px solid var(--black);
            border-radius: 40px;
            transition: all 0.2s;
        }

        .btn-outline:hover {
            background: var(--black);
            color: var(--white);
        }

        .btn-filled {
            text-decoration: none;
            background: var(--black);
            color: var(--white);
            font-size: 14px;
            font-weight: 600;
            padding: 8px 20px;
            border-radius: 40px;
            transition: all 0.2s;
        }

        .btn-filled:hover { background: #333; }

        /* ---- HEADER ---- */
        .header-section {
            background: var(--black);
            color: var(--white);
            padding: 120px 48px 80px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header-section::before {
            content: '';
            position: absolute;
            top: -50%; left: -50%;
            width: 200%; height: 200%;
            background: radial-gradient(circle, rgba(200,255,0,0.05) 0%, transparent 60%);
            pointer-events: none;
        }

        .header-section h1 {
            font-size: clamp(36px, 5vw, 64px);
            font-weight: 900;
            letter-spacing: -2px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .header-section h1 span {
            color: var(--accent);
        }

        .header-section p {
            font-size: 18px;
            color: #a0a0a0;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* ---- TRACK CONTAINER ---- */
        .track-container {
            max-width: 700px;
            margin: 60px auto;
            padding: 0 24px;
        }

        .track-card {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }

        .track-card h2 {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 24px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 1.5px solid var(--gray-200);
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            font-size: 15px;
            outline: none;
            background: var(--gray-100);
            transition: all 0.3s;
        }

        .form-group input:focus {
            border-color: var(--black);
            background: var(--white);
            box-shadow: 0 0 0 4px rgba(200,255,0,0.15);
        }

        .btn-submit {
            width: 100%;
            background: var(--black);
            color: var(--white);
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-submit:hover {
            background: #333;
            transform: translateY(-2px);
        }

        /* ---- RESULTS ---- */
        .results-box {
            background: var(--gray-100);
            border: 1.5px solid var(--gray-200);
            padding: 30px;
            border-radius: 16px;
            margin-top: 30px;
        }

        .results-box h3 {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 12px;
            color: var(--black);
        }

        .status-msg {
            font-size: 15px;
            line-height: 1.6;
            color: #444;
            margin-bottom: 24px;
        }

        .progress-bar-container {
            width: 100%;
            height: 10px;
            background: var(--gray-200);
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 16px;
            position: relative;
        }

        .progress-bar {
            height: 100%;
            background: var(--black);
            border-radius: 10px;
            transition: width 0.5s ease-out;
        }

        .progress-labels {
            display: flex;
            justify-content: space-between;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            color: var(--gray-500);
            letter-spacing: 0.5px;
        }

        .progress-labels span.active {
            color: var(--black);
        }

        /* ---- FOOTER ---- */
        footer {
            background: var(--black);
            color: var(--white);
            padding: 60px 48px 32px;
            margin-top: 80px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 48px;
            margin-bottom: 48px;
        }

        .footer-brand p {
            font-size: 14px;
            color: #737373;
            margin-top: 16px;
            max-width: 280px;
            line-height: 1.7;
        }

        .footer-col h4 {
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #737373;
            margin-bottom: 20px;
        }

        .footer-col ul { list-style: none; }

        .footer-col ul li { margin-bottom: 12px; }

        .footer-col ul li a {
            text-decoration: none;
            color: #a0a0a0;
            font-size: 14px;
            transition: color 0.2s;
        }

        .footer-col ul li a:hover { color: var(--white); }

        .footer-bottom {
            border-top: 1px solid #1f1f1f;
            padding-top: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer-bottom p {
            font-size: 13px;
            color: #737373;
        }

        @media (max-width: 768px) {
            nav { padding: 0 20px; }
            .nav-links { display: none; }
            .header-section { padding: 100px 24px 60px; }
            footer { padding: 48px 24px 24px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav>
    <a href="../HomeServlet" class="nav-logo">Ghampey <span>SHOES PASAL</span></a>
    <ul class="nav-links">
        <li><a href="../ProductServlet?category=Men">Men</a></li>
        <li><a href="../ProductServlet?category=Women">Women</a></li>
        <li><a href="../ProductServlet?category=Kids">Kids</a></li>
        <li><a href="../ProductServlet?category=Sale">Sale</a></li>
    </ul>
    <div class="nav-actions">
        <a href="../CartServlet" style="font-weight:700; color:#0a0a0a; text-decoration:none; margin-right:15px;">🛒 Cart (<%= cartSize %>)</a>
        
        <% if(session.getAttribute("user") != null) { %>
            <a href="../UserProfileServlet" class="btn-outline">My Profile</a>
            <a href="../LogoutServlet" class="btn-filled">Logout</a>
        <% } else { %>
            <a href="../LoginServlet" class="btn-outline">Sign In</a>
            <a href="../RegisterServlet" class="btn-filled">Join Us</a>
        <% } %>
    </div>
</nav>

<!-- HEADER -->
<section class="header-section">
    <h1>Order <span>Status</span></h1>
    <p>Track the progress of your premium Ghampey shoe package from Lakeside Pokhara straight to your doorstep.</p>
</section>

<!-- TRACK CONTENT -->
<section class="track-container">
    <div class="track-card">
        <h2>Enter Tracking Details</h2>
        
        <% if (request.getAttribute("errorMsg") != null) { %>
            <div style="background:#fff0f0; border:1px solid #fca5a5; color:#dc2626; padding:12px; border-radius:8px; margin-bottom:20px; font-size:14px; text-align:center;">
                <%= request.getAttribute("errorMsg") %>
            </div>
        <% } %>
        
        <form action="../OrderStatusServlet" method="post">
            <div class="form-group">
                <label>Order Reference ID</label>
                <input type="text" name="orderId" placeholder="e.g. GSP-883492" value="<%= request.getAttribute("orderId") != null ? request.getAttribute("orderId") : "" %>" required>
            </div>
            <button type="submit" class="btn-submit">Track Order →</button>
        </form>

        <% if (request.getAttribute("statusMsg") != null) { 
            double progress = (Double) request.getAttribute("progress");
        %>
            <div class="results-box">
                <h3>Tracking Details for #<%= request.getAttribute("orderId") %></h3>
                <p class="status-msg"><%= request.getAttribute("statusMsg") %></p>
                
                <div class="progress-bar-container">
                    <div class="progress-bar" style="width: <%= progress %>%;"></div>
                </div>
                
                <div class="progress-labels">
                    <span class="<%= progress >= 10 ? "active" : "" %>">Confirmed</span>
                    <span class="<%= progress >= 35 ? "active" : "" %>">Packing</span>
                    <span class="<%= progress >= 75 ? "active" : "" %>">In Transit</span>
                    <span class="<%= progress >= 100 ? "active" : "" %>">Delivered</span>
                </div>
            </div>
        <% } %>
    </div>
</section>

<!-- FOOTER -->
<footer>
    <div class="footer-grid">
        <div class="footer-brand">
            <a href="../HomeServlet" class="nav-logo" style="color:white;">Ghampey <span>SHOES PASAL</span></a>
            <p>Nepal's premium destination for authentic footwear. Based in Pokhara, delivering excellence across the country.</p>
        </div>
        <div class="footer-col">
            <h4>Help</h4>
            <ul>
                <li><a href="../OrderStatusServlet">Order Status</a></li>
                <li><a href="../ReturnsServlet">Returns</a></li>
                <li><a href="../SizeGuideServlet">Size Guide</a></li>
                <li><a href="../ContactServlet">Contact Us</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>About</h4>
            <ul>
                <li><a href="../AboutServlet">Our Story</a></li>
                <li><a href="../CareersServlet">Careers</a></li>
                <li><a href="../PrivacyServlet">Privacy Policy</a></li>
                <li><a href="../TermsServlet">Terms of Use</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2026 Ghampey Shoes Pasal. All Rights Reserved.</p>
        <p>Pokhara, Nepal</p>
    </div>
</footer>

</body>
</html>
