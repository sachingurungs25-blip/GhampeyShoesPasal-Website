<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Privacy Policy - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Privacy <span>Policy</span></h1>
    <p>Last updated: May 21, 2026. How Ghampey Shoes protects and manages your personal information.</p>
</section>

<!-- LEGAL CONTENT -->
<section class="container legal-container" style="max-width:800px; line-height:1.8; color:#333;">
    <p>Thank you for shopping at Ghampey Shoes Pasal. We are committed to protecting your privacy and ensuring your personal information is handled safely and responsibly. This policy explains what details we collect, how we use them, and the steps we take to protect them.</p>

    <h2 style="font-size:22px; font-weight:800; margin-top:36px; margin-bottom:16px; color:var(--black); letter-spacing:-0.5px;">1. Information We Collect</h2>
    <p>When you create an account, purchase products, or send inquiries, we collect information including:</p>
    <ul style="padding-left:20px; margin-bottom:20px;">
        <li style="margin-bottom:8px; font-size:14px;">Your name, username, and account passwords.</li>
        <li style="margin-bottom:8px; font-size:14px;">Contact information (email address, shipping address, and phone number).</li>
        <li style="margin-bottom:8px; font-size:14px;">Feedback and review comments you publish on our products.</li>
    </ul>

    <h2 style="font-size:22px; font-weight:800; margin-top:36px; margin-bottom:16px; color:var(--black); letter-spacing:-0.5px;">2. How We Use Your Information</h2>
    <p>We use the collected information to:</p>
    <ul style="padding-left:20px; margin-bottom:20px;">
        <li style="margin-bottom:8px; font-size:14px;">Process and deliver your shoe orders.</li>
        <li style="margin-bottom:8px; font-size:14px;">Communicate order tracking status and support responses.</li>
        <li style="margin-bottom:8px; font-size:14px;">Manage and authenticate your member profiles.</li>
        <li style="margin-bottom:8px; font-size:14px;">Improve our designs and website user experiences.</li>
    </ul>

    <h2 style="font-size:22px; font-weight:800; margin-top:36px; margin-bottom:16px; color:var(--black); letter-spacing:-0.5px;">3. Data Protection & Security</h2>
    <p>Our digital cobbler, Ashrik, takes database security seriously. We use secure hashing (SHA-256) for member passwords and limit access to customer data to authorized team members. All transaction billing information is kept strictly confidential.</p>

    <h2 style="font-size:22px; font-weight:800; margin-top:36px; margin-bottom:16px; color:var(--black); letter-spacing:-0.5px;">4. Cookies Policy</h2>
    <p>We use session cookies to remember the items in your shopping cart and keep you logged into your account as you browse. These cookies are essential for the store's basic functionality.</p>

    <h2 style="font-size:22px; font-weight:800; margin-top:36px; margin-bottom:16px; color:var(--black); letter-spacing:-0.5px;">5. Contact Us</h2>
    <p>If you have any questions regarding our privacy guidelines, feel free to submit a message on our <a href="<%= request.getContextPath() %>/pages/contact.jsp" style="color:var(--black); font-weight:700;">Contact Us</a> page or email us at privacy@ghampey.com.</p>
</section>

<jsp:include page="/pages/footer.jsp" />
