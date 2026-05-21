<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Track Order - Ghampey Shoes Pasal"); %>
<jsp:include page="/pages/header.jsp" />

<!-- HEADER -->
<section class="header-section">
    <h1>Order <span>Status</span></h1>
    <p>Track the progress of your premium Ghampey shoe package from Lakeside Pokhara straight to your doorstep.</p>
</section>

<!-- TRACK CONTENT -->
<section class="container track-container" style="max-width:700px;">
    <div class="track-card" style="background:var(--white); border:1px solid var(--gray-200); border-radius:20px; padding:40px; box-shadow:var(--shadow-md);">
        <h2 style="font-size:24px; font-weight:800; margin-bottom:24px; text-align:center;">Enter Tracking Details</h2>
        
        <% if (request.getAttribute("errorMsg") != null) { %>
            <div style="background:#fff0f0; border:1px solid #fca5a5; color:#dc2626; padding:12px; border-radius:8px; margin-bottom:20px; font-size:14px; text-align:center;">
                <%= request.getAttribute("errorMsg") %>
            </div>
        <% } %>
        
        <form action="<%= request.getContextPath() %>/OrderStatusServlet" method="post" style="margin:0;">
            <div class="form-group">
                <label>Order Reference ID</label>
                <input type="text" name="orderId" placeholder="e.g. GSP-883492" value="<%= request.getAttribute("orderId") != null ? request.getAttribute("orderId") : "" %>" required>
            </div>
            <button type="submit" class="btn-submit">Track Order →</button>
        </form>

        <% if (request.getAttribute("statusMsg") != null) { 
            double progress = (Double) request.getAttribute("progress");
        %>
            <div class="results-box" style="background:var(--gray-100); border:1px solid var(--gray-200); padding:30px; border-radius:16px; margin-top:30px;">
                <h3 style="font-size:18px; font-weight:800; margin-bottom:12px; color:var(--black);">Tracking Details for #<%= request.getAttribute("orderId") %></h3>
                <p class="status-msg" style="font-size:15px; color:#444; line-height:1.6; margin-bottom:24px;"><%= request.getAttribute("statusMsg") %></p>
                
                <div class="progress-bar-container" style="width:100%; height:10px; background:var(--gray-200); border-radius:10px; overflow:hidden; margin-bottom:16px; position:relative;">
                    <div class="progress-bar" style="height:100%; background:var(--black); border-radius:10px; width: <%= progress %>%; transition: width 0.5s ease-out;"></div>
                </div>
                
                <div class="progress-labels" style="display:flex; justify-content:space-between; font-size:11px; font-weight:800; text-transform:uppercase; color:var(--gray-500); letter-spacing:0.5px;">
                    <span class="<%= progress >= 10 ? "active" : "" %>" style="<%= progress >= 10 ? "color:var(--black);" : "" %>">Confirmed</span>
                    <span class="<%= progress >= 35 ? "active" : "" %>" style="<%= progress >= 35 ? "color:var(--black);" : "" %>">Packing</span>
                    <span class="<%= progress >= 75 ? "active" : "" %>" style="<%= progress >= 75 ? "color:var(--black);" : "" %>">In Transit</span>
                    <span class="<%= progress >= 100 ? "active" : "" %>" style="<%= progress >= 100 ? "color:var(--black);" : "" %>">Delivered</span>
                </div>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="/pages/footer.jsp" />
