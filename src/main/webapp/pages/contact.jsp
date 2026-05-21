<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Ghampey Shoes Pasal</title>
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
            --success: #10b981;
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

        /* ---- CONTACT CONTAINER ---- */
        .contact-container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 0 48px;
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 60px;
        }

        /* ---- DETAILS PANEL ---- */
        .info-panel h2 {
            font-size: 32px;
            font-weight: 855;
            letter-spacing: -1px;
            margin-bottom: 30px;
        }

        .info-card {
            background: var(--gray-100);
            border-radius: 16px;
            padding: 30px;
            border: 1px solid var(--gray-200);
            margin-bottom: 30px;
        }

        .info-item {
            display: flex;
            gap: 20px;
            margin-bottom: 24px;
            align-items: flex-start;
        }

        .info-item:last-child {
            margin-bottom: 0;
        }

        .info-icon {
            width: 48px;
            height: 48px;
            background: var(--black);
            color: var(--accent);
            font-size: 20px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .info-content h3 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .info-content p {
            font-size: 15px;
            color: var(--gray-500);
            line-height: 1.6;
        }

        /* ---- FORM PANEL ---- */
        .form-panel {
            background: var(--white);
            border: 1px solid var(--gray-200);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }

        .form-panel h2 {
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.5px;
            margin-bottom: 24px;
        }

        .success-box {
            background: #ecfdf5;
            border: 1.5px solid #a7f3d0;
            color: #065f46;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 24px;
            font-size: 15px;
            line-height: 1.5;
            display: flex;
            gap: 12px;
            align-items: flex-start;
        }

        .success-box span {
            font-size: 20px;
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

        .form-group input, .form-group select, .form-group textarea {
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

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
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

        @media (max-width: 900px) {
            .contact-container { grid-template-columns: 1fr; gap: 40px; padding: 0 24px; }
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
    <h1>Contact <span>Us</span></h1>
    <p>Have questions about sizes, delivery, or custom designs? Reach out to Ghampey Shoes support.</p>
</section>

<!-- CONTACT CONTENT -->
<section class="contact-container">
    
    <!-- LEFT PANEL: DETAILS -->
    <div class="info-panel">
        <h2>Get in Touch</h2>
        <div class="info-card">
            
            <div class="info-item">
                <div class="info-icon">📍</div>
                <div class="info-content">
                    <h3>Main Showroom & Office</h3>
                    <p>Lakeside Street 14, Pokhara, Nepal</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">📞</div>
                <div class="info-content">
                    <h3>Phone Support</h3>
                    <p>+977-61-555123 (9:00 AM - 7:00 PM)</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">✉️</div>
                <div class="info-content">
                    <h3>Email Address</h3>
                    <p>support@ghampey.com<br>info@ghampey.com</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">🕒</div>
                <div class="info-content">
                    <h3>Working Hours</h3>
                    <p>Sunday - Friday: 9:00 AM to 7:00 PM<br>Saturday: Closed (Hike day!)</p>
                </div>
            </div>
            
        </div>
    </div>

    <!-- RIGHT PANEL: FORM -->
    <div class="form-panel">
        <h2>Send a Message</h2>
        
        <% if (request.getAttribute("successMsg") != null) { %>
            <div class="success-box">
                <span>✅</span>
                <div><%= request.getAttribute("successMsg") %></div>
            </div>
        <% } %>
        
        <form action="../ContactServlet" method="post">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="Dhiraj Dhungana" required>
            </div>
            
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="dhiraj@example.com" required>
            </div>

            <div class="form-group">
                <label>Subject</label>
                <select name="subject" required>
                    <option value="" disabled selected>Select subject</option>
                    <option value="Order Tracking & Status">Order Tracking & Status</option>
                    <option value="Returns & Exchanges">Returns & Exchanges</option>
                    <option value="Size Guide & Fit Help">Size Guide & Fit Help</option>
                    <option value="Careers Inquiry">Careers Inquiry</option>
                    <option value="General Feedback">General Feedback</option>
                </select>
            </div>

            <div class="form-group">
                <label>Message</label>
                <textarea name="message" placeholder="Type your message here..." required></textarea>
            </div>

            <button type="submit" class="btn-submit">Send Inquiry →</button>
        </form>
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
