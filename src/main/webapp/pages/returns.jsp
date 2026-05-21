<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Returns & Exchanges - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Returns & <span>Exchanges</span></h1>
    <p>Our 7-Day Hassle-Free policy because we want you to walk with absolute confidence.</p>
</section>

<!-- POLICY CONTENT -->
<section class="container policy-container" style="max-width: 900px; line-height: 1.8; color: #333;">
    <h2 style="font-size: 26px; font-weight: 800; margin-bottom: 16px; color: var(--black); letter-spacing: -0.5px;">Our Commitment to Comfort</h2>
    <p style="font-size: 16px; margin-bottom: 30px;">If your Ghampey shoes don't fit perfectly or aren't to your satisfaction, don't sweat it. We offer easy exchanges and returns within 7 days of delivery. Whether you want to swap sizes or request a full refund, our customer support team is ready to walk you through the process.</p>

    <div class="policy-grid">
        <!-- Card 1: Conditions -->
        <div class="policy-card">
            <h3 style="font-size: 18px; font-weight: 800; margin-bottom: 12px; color: var(--black);">Return Conditions</h3>
            <ul style="list-style: none;">
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Items must be unworn and in original condition.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Packaging must include the original Ghampey shoe box.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Proof of purchase (invoice or order reference) is required.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Returns must be requested within 7 days of receipt.</li>
            </ul>
        </div>

        <!-- Card 2: Process -->
        <div class="policy-card">
            <h3 style="font-size: 18px; font-weight: 800; margin-bottom: 12px; color: var(--black);">How to Return</h3>
            <ul style="list-style: none;">
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Contact us via the Contact Form or call us directly.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Pack the shoes back in their original packaging box.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Ship it back to Lakeside Street 14, Pokhara, Nepal.</li>
                <li style="position: relative; padding-left: 20px; margin-bottom: 10px; font-size: 14px; color: #555;">Refund/Exchange will be processed within 3 business days of receiving the item.</li>
            </ul>
        </div>
    </div>

    <h2 style="font-size: 26px; font-weight: 800; margin-bottom: 16px; color: var(--black); letter-spacing: -0.5px;">Exchanges</h2>
    <p style="font-size: 16px; margin-bottom: 30px;">Ordered the wrong size? Don't worry! Shreshkar's QA team understands that fit is everything. We offer free size exchanges (subject to stock availability) for all unworn footwear. Reach out to our customer happiness lead, Aayush, and he will arrange the replacement dispatch.</p>
</section>

<jsp:include page="/pages/footer.jsp" />
