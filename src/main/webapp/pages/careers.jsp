<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Careers - Ghampey Shoes Pasal</title>
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

        /* ---- CAREERS CONTENT ---- */
        .careers-container {
            max-width: 900px;
            margin: 60px auto;
            padding: 0 24px;
        }

        .careers-container h2 {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 24px;
            color: var(--black);
            letter-spacing: -0.5px;
        }

        .careers-container p.intro {
            font-size: 16px;
            line-height: 1.8;
            color: #333;
            margin-bottom: 40px;
        }

        /* Job Cards */
        .job-list {
            display: flex;
            flex-direction: column;
            gap: 24px;
            margin-bottom: 50px;
        }

        .job-card {
            background: var(--gray-100);
            border: 1px solid var(--gray-200);
            padding: 30px;
            border-radius: 16px;
            transition: all 0.3s;
        }

        .job-card:hover {
            background: var(--white);
            border-color: var(--black);
            box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            transform: translateY(-4px);
        }

        .job-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .job-title {
            font-size: 20px;
            font-weight: 800;
            color: var(--black);
        }

        .job-location {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            background: var(--black);
            color: var(--accent);
            padding: 4px 10px;
            border-radius: 20px;
        }

        .job-desc {
            font-size: 14px;
            line-height: 1.7;
            color: #555;
            margin-bottom: 20px;
        }

        .job-requirements h4 {
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
            color: var(--black);
        }

        .job-requirements ul {
            list-style: none;
        }

        .job-requirements ul li {
            position: relative;
            padding-left: 20px;
            margin-bottom: 6px;
            font-size: 13px;
            color: #666;
        }

        .job-requirements ul li::before {
            content: '✦';
            position: absolute;
            left: 0;
            color: var(--black);
        }

        /* Apply Section */
        .apply-box {
            background: var(--black);
            color: var(--white);
            border-radius: 16px;
            padding: 40px;
            text-align: center;
        }

        .apply-box h3 {
            font-size: 22px;
            font-weight: 800;
            margin-bottom: 12px;
            color: var(--accent);
        }

        .apply-box p {
            font-size: 15px;
            line-height: 1.6;
            color: #a0a0a0;
            max-width: 500px;
            margin: 0 auto 24px;
        }

        .apply-btn {
            display: inline-block;
            background: var(--accent);
            color: var(--black);
            padding: 12px 30px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 700;
            font-size: 14px;
            transition: all 0.2s;
        }

        .apply-btn:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 30px rgba(200,255,0,0.2);
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
    <h1>Join the <span>Team</span></h1>
    <p>We are looking for passionate shoe enthusiasts, coders, and runners to help us scale Nepal's premium footwear brand.</p>
</section>

<!-- CAREERS CONTENT -->
<section class="careers-container">
    <h2>Current Open Positions</h2>
    <p class="intro">At Ghampey Shoes Pasal, we believe in passion, humor, and top-tier craftsmanship. Work with Dhiraj, Sachin, Shreshkar, and the rest of our crew to create and deliver amazing shoes. Enjoy a workspace overlooking Lakeside Pokhara, all the black tea you can drink, and a free pair of Ghampeys every year.</p>

    <div class="job-list">
        <!-- Job 1: fit tester -->
        <div class="job-card">
            <div class="job-header">
                <div class="job-title">Shoe Fit & QA Tester</div>
                <div class="job-location">Pokhara, Nepal</div>
            </div>
            <p class="job-desc">Work directly under Shreshkar Gurung to walk, run, and slide in our prototype shoes until they break. You'll help us identify weak points in stitching, soles, and materials before shoes go to final production.</p>
            <div class="job-requirements">
                <h4>Key Requirements</h4>
                <ul>
                    <li>Possess naturally destructive feet (destroys shoes within weeks).</li>
                    <li>Willingness to run after Pokhara local buses on a daily basis.</li>
                    <li>High pain tolerance for when proto-shoes don't fit quite right.</li>
                </ul>
            </div>
        </div>

        <!-- Job 2: designer -->
        <div class="job-card">
            <div class="job-header">
                <div class="job-title">Junior Footwear Designer</div>
                <div class="job-location">Pokhara, Nepal</div>
            </div>
            <p class="job-desc">Collaborate with Sachin Gurung to sketch, prototype, and render the next generation of Ghampey Sneaker designs. You'll merge modern streetwear design with Nepalese craftsmanship.</p>
            <div class="job-requirements">
                <h4>Key Requirements</h4>
                <ul>
                    <li>Proficient in Illustrator, Photoshop, or 3D Footwear modeling software.</li>
                    <li>Strong understanding of hiking boot dynamics and urban streetwear trends.</li>
                    <li>Understanding that shoe laces should, in fact, stay on top of the shoe.</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Apply Box -->
    <div class="apply-box">
        <h3>How to Apply</h3>
        <p>Send your portfolio, CV, and a funny 100-word paragraph on why you deserve a pair of Ghampey Shoes to careers@ghampey.com.</p>
        <a href="../ContactServlet?subject=Careers Inquiry" class="apply-btn">Inquire via Contact Form</a>
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
