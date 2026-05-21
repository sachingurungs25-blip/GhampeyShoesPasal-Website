<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<%@ page import="com.ghyampes.dao.ShoeDAO, com.ghyampes.model.Shoe, java.util.List" %>
<% List<Shoe> shoeList = new ShoeDAO().getAllShoes(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ghampey Shoes Pasal | Premium Footwear in Nepal</title>
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

        /* ---- HERO ---- */
        .hero {
            margin-top: 64px;
            min-height: calc(100vh - 64px);
            background: var(--black);
            display: grid;
            grid-template-columns: 1fr 1fr;
            overflow: hidden;
        }

        .hero-left {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 80px 64px;
        }

        .hero-tag {
            display: inline-block;
            background: var(--accent);
            color: var(--black);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            padding: 6px 14px;
            border-radius: 40px;
            margin-bottom: 32px;
            width: fit-content;
        }

        .hero h1 {
            font-size: clamp(52px, 6vw, 88px);
            font-weight: 900;
            line-height: 0.95;
            letter-spacing: -3px;
            color: var(--white);
            text-transform: uppercase;
            margin-bottom: 28px;
        }

        .hero h1 .highlight {
            color: var(--accent);
        }

        .hero p {
            font-size: 16px;
            color: #a0a0a0;
            line-height: 1.7;
            max-width: 420px;
            margin-bottom: 48px;
        }

        .hero-cta {
            display: flex;
            gap: 16px;
            align-items: center;
        }

        .cta-primary {
            background: var(--accent);
            color: var(--black);
            padding: 14px 32px;
            border-radius: 40px;
            font-weight: 700;
            font-size: 15px;
            text-decoration: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .cta-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(200,255,0,0.3);
        }

        .cta-secondary {
            color: var(--white);
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            border-bottom: 1px solid rgba(255,255,255,0.3);
            padding-bottom: 2px;
            transition: border-color 0.2s;
        }

        .cta-secondary:hover { border-color: var(--white); }

        .hero-right {
            position: relative;
            overflow: hidden;
        }

        .hero-right img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0.85;
            transition: transform 8s ease;
        }

        .hero-right:hover img { transform: scale(1.04); }

        .hero-right::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(to right, var(--black) 0%, transparent 40%);
        }

        /* ---- MARQUEE STRIP ---- */
        .marquee-strip {
            background: var(--accent);
            padding: 14px 0;
            overflow: hidden;
            white-space: nowrap;
        }

        .marquee-inner {
            display: inline-flex;
            animation: marquee 18s linear infinite;
            gap: 0;
        }

        .marquee-inner span {
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: var(--black);
            padding: 0 32px;
        }

        .marquee-inner span::after {
            content: '✦';
            margin-left: 32px;
        }

        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }

        /* ---- SECTION ---- */
        .section {
            padding: 80px 48px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 40px;
        }

        .section-header h2 {
            font-size: 36px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .view-all {
            text-decoration: none;
            color: var(--black);
            font-size: 14px;
            font-weight: 600;
            border-bottom: 1.5px solid var(--black);
            padding-bottom: 2px;
            transition: color 0.2s;
        }

        /* ---- PRODUCT GRID ---- */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .product-card {
            cursor: pointer;
            text-decoration: none;
            color: var(--black);
            display: block;
            transition: transform 0.3s;
        }

        

        .product-img-wrap {
            background: var(--gray-100);
            border-radius: 12px;
            aspect-ratio: 1/1;
            overflow: hidden;
            margin-bottom: 16px;
            position: relative;
        }

        .product-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        

        .product-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--black);
            color: var(--white);
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            padding: 4px 10px;
            border-radius: 40px;
            text-transform: uppercase;
        }

        .product-name {
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .product-category {
            font-size: 13px;
            color: var(--gray-500);
            margin-bottom: 8px;
        }

        .product-price {
            font-size: 15px;
            font-weight: 700;
        }

        /* ---- DARK BANNER ---- */
        .dark-banner {
            background: var(--black);
            margin: 0 48px 80px;
            border-radius: 20px;
            padding: 80px 80px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: var(--white);
            overflow: hidden;
            position: relative;
        }

        .dark-banner::before {
            content: '';
            position: absolute;
            top: -100px; right: -100px;
            width: 400px; height: 400px;
            background: var(--accent);
            border-radius: 50%;
            opacity: 0.07;
        }

        .banner-text h2 {
            font-size: 48px;
            font-weight: 900;
            letter-spacing: -2px;
            line-height: 1;
            margin-bottom: 16px;
        }

        .banner-text p {
            color: #a0a0a0;
            font-size: 16px;
            max-width: 400px;
        }

        /* ---- FOOTER ---- */
        footer {
            background: var(--black);
            color: var(--white);
            padding: 60px 48px 32px;
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
            .product-grid { grid-template-columns: repeat(2, 1fr); }
            .hero { grid-template-columns: 1fr; }
            .hero-right { display: none; }
        }

        @media (max-width: 768px) {
            nav { padding: 0 20px; }
            .nav-links { display: none; }
            .section { padding: 48px 24px; }
            .dark-banner { margin: 0 24px 60px; padding: 48px 32px; flex-direction: column; gap: 32px; }
            footer { padding: 48px 24px 24px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
            .hero-left { padding: 60px 32px; }
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

<!-- HERO -->
<section class="hero">
    <div class="hero-left">
        <span class="hero-tag">🇳🇵 Pokhara's Finest</span>
        <h1>Walk<br>Different.<br><span class="highlight">Feel</span><br>Different.</h1>
        <p>Ghampey Shoes Pasal brings you Nepal's premium footwear collection. From the mountains to the streets — crafted for every journey.</p>
        <div class="hero-cta">
            <a href="#products" class="cta-primary">Shop Now</a>
            <a href="../HomeServlet" class="cta-secondary">Explore Collection →</a>
        </div>
    </div>
    <div class="hero-right">
        <img src="../images/basketball_shoe_1777806717532.png" alt="Premium Shoe">
    </div>
</section>



<!-- PRODUCTS -->
<section class="section" id="products">
    <div class="section-header">
        <h2>Trending Now</h2>
      
    </div>
        <div class="product-grid">
        <% for(Shoe s : shoeList) { 
            String img = (s.getImageUrl() != null && !s.getImageUrl().isEmpty()) ? s.getImageUrl() : "images/running_shoe_1777806317504.png";
        if (img != null && img.startsWith("images/")) { img = "../" + img; }
        %>
        <a href="../ProductServlet?id=<%= s.getId() %>" class="product-card">
            <div class="product-img-wrap">
                <img src="<%= img %>" alt="Shoe">
            </div>
            <div class="product-name"><%= s.getItemName() %></div>
            <div class="product-category"><%= s.getCategory() %></div>
            <div style="font-size:12px; font-weight:600; margin-bottom:8px; color: <%= s.getStock()>0?"#52c41a":"red" %>"><%= s.getStock()>0 ? "Stock: "+s.getStock()+" available" : "Out of Stock" %></div>
            
            <div class="product-price">
                <% if(s.getBeforePrice() > 0) { %>
                    <strike style="color:#a0a0a0; font-size:13px;">NPR <%= s.getBeforePrice() %></strike> 
                    <span style="color:red;">NPR <%= s.getPrice() %></span>
                <% } else { %>
                    NPR <%= s.getPrice() %>
                <% } %>
            </div>
            <div style="margin-top:10px;"><span style="display:block; text-align:center; background:#0a0a0a; color:white; padding:8px 16px; border-radius:40px; font-size:14px;">View Details</span></div>
        </a>
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
            <h4>Shop</h4>
            <ul>
                <li><a href="../ProductServlet?category=Men">Men's Shoes</a></li>
                <li><a href="../ProductServlet?category=Women">Women's Shoes</a></li>
                <li><a href="../ProductServlet?category=Kids">Kids' Shoes</a></li>
                <li><a href="../ProductServlet?category=Sale">Sale</a></li>
            </ul>
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