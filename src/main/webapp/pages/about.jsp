<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Story - Ghampey Shoes Pasal</title>
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

        /* ---- STORY SECTION ---- */
        .story-content {
            padding: 80px 48px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .story-text {
            font-size: 16px;
            line-height: 1.8;
            color: #333;
            margin-bottom: 60px;
            text-align: center;
        }

        .story-text h2 {
            font-size: 32px;
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 24px;
            color: var(--black);
        }

        /* ---- TEAM GRID ---- */
        .team-title {
            text-align: center;
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: -0.5px;
        }

        .team-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }

        .team-card {
            background: var(--gray-100);
            border-radius: 16px;
            padding: 32px;
            transition: all 0.3s ease;
            border: 1px solid var(--gray-200);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .team-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
            background: var(--white);
            border-color: var(--black);
        }

        .avatar-wrap {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: var(--black);
            color: var(--accent);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 24px;
            border: 4px solid var(--accent);
        }

        .team-name {
            font-size: 20px;
            font-weight: 800;
            color: var(--black);
            margin-bottom: 6px;
        }

        .team-role {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: var(--gray-500);
            margin-bottom: 18px;
            background: rgba(0,0,0,0.05);
            padding: 4px 10px;
            border-radius: 20px;
        }

        .team-card:hover .team-role {
            background: var(--accent);
            color: var(--black);
        }

        .team-bio {
            font-size: 14px;
            line-height: 1.6;
            color: #555;
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

        @media (max-width: 1024px) {
            .team-grid { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 768px) {
            nav { padding: 0 20px; }
            .nav-links { display: none; }
            .header-section { padding: 100px 24px 60px; }
            .story-content { padding: 48px 24px; }
            .team-grid { grid-template-columns: 1fr; }
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
    <h1>Our <span>Story</span></h1>
    <p>How six friends from Pokhara went from slipping down mountains to launching Nepal's premium footwear empire.</p>
</section>

<!-- STORY CONTENT -->
<section class="story-content">
    <div class="story-text">
        <h2>It Started with a Slip</h2>
        <p>Ghampey Shoes Pasal wasn't born in a corporate boardroom. It was born on a muddy hiking trail in Sarangkot, where cheap soles gave out, dignity was lost, and a vision was found. We set out on a mission: to create durable, high-quality, and stunning shoes that represent the style and spirit of Nepal. Today, we craft Pokhara's finest footwear, delivering comfort and attitude across the nation.</p>
    </div>

    <h2 class="team-title">The Starters of Ghampey</h2>
    
    <div class="team-grid">
        <!-- Dhiraj Dhungana -->
        <div class="team-card">
            <div class="avatar-wrap">DD</div>
            <div class="team-name">Dhiraj Dhungana</div>
            <div class="team-role">CEO & Mastermind</div>
            <div class="team-bio">Dhiraj started Ghampey after slipping on a hike and rolling 200 meters down a hill. Covered in mud but enlightened, he declared: "No Nepalese shall suffer bad soles again!" He handles strategic vision (i.e. drinking tea and pointing at shoe sketches).</div>
        </div>

        <!-- Sachin Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">SG</div>
            <div class="team-name">Sachin Gurung</div>
            <div class="team-role">Head of Design</div>
            <div class="team-bio">Sachin spent three weeks meditating on the curves of a hiking boot in the Annapurna range, only to realize he put the laces on the bottom. He designs all Ghampey models, ensuring every shoe looks like it can run at 100km/h.</div>
        </div>

        <!-- Shreshkar Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">SG</div>
            <div class="team-name">Shreshkar Gurung</div>
            <div class="team-role">Head of QA & Fit Testing</div>
            <div class="team-bio">Shreshkar has destroyed 50 pairs of shoes in a single year just by walking normally. Now he heads testing: if a shoe survives Shreshkar running to catch a Pokhara local bus, it's certified "Ghampey Proof".</div>
        </div>

        <!-- Aayush Gurung -->
        <div class="team-card">
            <div class="avatar-wrap">AG</div>
            <div class="team-name">Aayush Gurung</div>
            <div class="team-role">Customer Happiness Lead</div>
            <div class="team-bio">Aayush can tell your shoe size just by hearing you walk. He joined Ghampey after trying to return a pair of boots from 2018 claiming they "didn't match his aura." Now, he manages returns and keeps customers laughing.</div>
        </div>

        <!-- Kushal Palikhe -->
        <div class="team-card">
            <div class="avatar-wrap">KP</div>
            <div class="team-name">Kushal Palikhe</div>
            <div class="team-role">Chief Shipping Officer</div>
            <div class="team-bio">Kushal once ran a half-marathon holding a shoe box because he forgot to pack a delivery van. He treats every shipment like an Olympic sprint, ensuring your shoes arrive in record time.</div>
        </div>

        <!-- Ashrik Kayastha -->
        <div class="team-card">
            <div class="avatar-wrap">AK</div>
            <div class="team-name">Ashrik Kayastha</div>
            <div class="team-role">Chief Technology Officer</div>
            <div class="team-bio">Ashrik was found trying to build an app that automatically ties shoelaces via Bluetooth. While the app tripped several beta-testers, his database and web coding wizardry keep Ghampey Shoes online and responsive.</div>
        </div>
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
