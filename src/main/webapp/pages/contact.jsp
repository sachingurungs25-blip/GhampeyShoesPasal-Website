<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Contact Us - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Contact <span>Us</span></h1>
    <p>Have questions about sizes, delivery, or custom designs? Reach out to Ghampey Shoes support.</p>
</section>

<!-- CONTACT CONTENT -->
<section class="container contact-container">
    
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
        
        <form action="<%= request.getContextPath() %>/ContactServlet" method="post">
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
                    <option value="" disabled <%= request.getParameter("subject") == null ? "selected" : "" %>>Select subject</option>
                    <option value="Order Tracking & Status" <%= "Order Tracking & Status".equals(request.getParameter("subject")) ? "selected" : "" %>>Order Tracking & Status</option>
                    <option value="Returns & Exchanges" <%= "Returns & Exchanges".equals(request.getParameter("subject")) ? "selected" : "" %>>Returns & Exchanges</option>
                    <option value="Size Guide & Fit Help" <%= "Size Guide & Fit Help".equals(request.getParameter("subject")) ? "selected" : "" %>>Size Guide & Fit Help</option>
                    <option value="Careers Inquiry" <%= "Careers Inquiry".equals(request.getParameter("subject")) || "Careers Inquiry".equals(request.getAttribute("subject")) ? "selected" : "" %>>Careers Inquiry</option>
                    <option value="General Feedback" <%= "General Feedback".equals(request.getParameter("subject")) ? "selected" : "" %>>General Feedback</option>
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

<jsp:include page="/pages/footer.jsp" />
