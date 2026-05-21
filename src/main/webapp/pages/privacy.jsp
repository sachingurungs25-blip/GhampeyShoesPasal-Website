<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy - Ghampey Shoes Pasal</title>
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

        /* ---- LEGAL CONTENT ---- */
        .legal-container {
            max-width: 800px;
            margin: 60px auto;
            padding: 0 24px;
            line-height: 1.8;
            color: #333;
        }

        .legal-container h2 {
            font-size: 22px;
            font-weight: 800;
            margin-top: 36px;
            margin-bottom: 16px;
            color: var(--black);
            letter-spacing: -0.5px;
        }

        .legal-container p {
            font-size: 15px;
            margin-bottom: 20px;
        }

        .legal-container ul {
            padding-left: 20px;
            margin-bottom: 20px;
        }

        .legal-container ul li {
            margin-bottom: 8px;
            font-size: 14px;
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
    <h1>Privacy <span>Policy</span></h1>
    <p>Last updated: May 21, 2026. How Ghampey Shoes protects and manages your personal information.</p>
</section>

<!-- LEGAL CONTENT -->
<section class="legal-container">
    <p>Thank you for shopping at Ghampey Shoes Pasal. We are committed to protecting your privacy and ensuring your personal information is handled safely and responsibly. This policy explains what details we collect, how we use them, and the steps we take to protect them.</p>

    <h2>1. Information We Collect</h2>
    <p>When you create an account, purchase products, or send inquiries, we collect information including:</p>
    <ul>
        <li>Your name, username, and account passwords.</li>
        <li>Contact information (email address, shipping address, and phone number).</li>
        <li>Feedback and review comments you publish on our products.</li>
    </ul>

    <h2>2. How We Use Your Information</h2>
    <p>We use the collected information to:</p>
    <ul>
        <li>Process and deliver your shoe orders.</li>
        <li>Communicate order tracking status and support responses.</li>
        <li>Manage and authenticate your member profiles.</li>
        <li>Improve our designs and website user experiences.</li>
    </ul>

    <h2>3. Data Protection & Security</h2>
    <p>Our digital cobbler, Ashrik, takes database security seriously. We use secure hashing (SHA-256) for member passwords and limit access to customer data to authorized team members. All transaction billing information is kept strictly confidential.</p>

    <h2>4. Cookies Policy</h2>
    <p>We use session cookies to remember the items in your shopping cart and keep you logged into your account as you browse. These cookies are essential for the store's basic functionality.</p>

    <h2>5. Contact Us</h2>
    <p>If you have any questions regarding our privacy guidelines, feel free to submit a message on our <a href="../ContactServlet" style="color:var(--black); font-weight:700;">Contact Us</a> page or email us at privacy@ghampey.com.</p>
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
