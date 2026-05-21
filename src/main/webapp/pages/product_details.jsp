<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<%@ page import="com.ghyampes.dao.ShoeDAO, com.ghyampes.model.Shoe" %>
<%@ page import="com.ghyampes.dao.ReviewDAO, com.ghyampes.model.Review, com.ghyampes.model.User" %>
<% 
    String idParam = request.getParameter("id");
    Shoe shoe = null;
    if(idParam != null && !idParam.isEmpty()) {
        shoe = new ShoeDAO().getShoeById(Integer.parseInt(idParam));
    }
    if (shoe == null) {
        response.sendRedirect(request.getContextPath() + "/HomeServlet");
        return;
    }
    
    User user = (User) session.getAttribute("user");
    List<Review> reviews = new ReviewDAO().getReviewsByProduct(shoe.getId());
    
    String img = (shoe.getImageUrl() != null && !shoe.getImageUrl().isEmpty()) ? shoe.getImageUrl() : "images/running_shoe_1777806317504.png";
    if (img != null && img.startsWith("images/")) { 
        img = request.getContextPath() + "/" + img; 
    }
    
    request.setAttribute("pageTitle", shoe.getItemName() + " - Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container details-grid">
    <!-- Left Image -->
    <div class="image-section">
        <img src="<%= img %>" alt="<%= shoe.getItemName() %>">
    </div>
    
    <!-- Right Details -->
    <div class="details-section">
        <h1 class="title"><%= shoe.getItemName() %></h1>
        
        <div class="ratings" style="margin-bottom:20px;">
            <% if(reviews.isEmpty()) { %>
                <span style="color:var(--gray-500);">No reviews yet</span>
            <% } else { %>
                ⭐ <a href="#reviews" style="color:var(--black); font-weight:700; text-decoration:underline;"><%= reviews.size() %> Reviews</a>
            <% } %>
        </div>
        
        <div class="brand-info" style="font-size:15px; margin-bottom:20px; border-bottom:1px solid var(--gray-200); padding-bottom:20px;">
            <strong>Description:</strong> 
            <p style="color:#444; margin-top:8px; line-height:1.6;"><%= shoe.getDescription() %></p>
        </div>
        
        <div style="margin-bottom:20px; font-weight:700; font-size:14px; color:<%= shoe.getStock() > 0 ? "var(--accent-green)" : "var(--accent-red)" %>">
            Availability: <%= shoe.getStock() > 0 ? shoe.getStock() + " In Stock" : "Out of Stock" %>
        </div>
        
        <div class="price-area" style="margin-bottom:24px; border-bottom:1px solid var(--gray-200); padding-bottom:20px;">
            <div class="price" style="font-size:32px; font-weight:800; color:var(--black);">Rs. <%= (int)shoe.getPrice() %></div>
            <% if(shoe.getBeforePrice() > 0) { 
                int discount = (int)(((shoe.getBeforePrice() - shoe.getPrice()) / shoe.getBeforePrice()) * 100);
            %>
                <div style="margin-top:6px;">
                    <span class="before-price" style="font-size:16px; color:var(--gray-500); text-decoration:line-through;">Rs. <%= (int)shoe.getBeforePrice() %></span>
                    <span class="discount" style="font-size:13px; background:var(--accent-red); color:white; padding:2px 8px; border-radius:4px; font-weight:700; margin-left:8px;">-<%= discount %>% OFF</span>
                </div>
            <% } %>
        </div>
        
        <form action="<%= request.getContextPath() %>/CartServlet" method="post">
            <input type="hidden" name="productId" value="<%= shoe.getId() %>">
            
            <div class="option-group">
                <span class="option-label">Select Size</span>
                
                <div class="size-options">
                    <label style="cursor:pointer;">
                        <input type="radio" name="size" value="EU: 39" checked style="display:none;">
                        <div class="size-box active" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 39</div>
                    </label>
                    <label style="cursor:pointer;">
                        <input type="radio" name="size" value="EU: 40" style="display:none;">
                        <div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 40</div>
                    </label>
                    <label style="cursor:pointer;">
                        <input type="radio" name="size" value="EU: 41" style="display:none;">
                        <div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 41</div>
                    </label>
                    <label style="cursor:pointer;">
                        <input type="radio" name="size" value="EU: 42" style="display:none;">
                        <div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 42</div>
                    </label>
                </div>
            </div>
            
            <div class="option-group" style="margin-top:24px;">
                <div class="qty-wrapper">
                    <span class="option-label" style="margin:0;">Quantity</span>
                    <div class="qty-controls">
                        <button type="button" class="qty-btn" onclick="let q=document.getElementById('qty'); if(q.value>1)q.value--;">-</button>
                        <input type="text" name="quantity" id="qty" value="1" class="qty-input" readonly>
                        <button type="button" class="qty-btn" onclick="let q=document.getElementById('qty'); if(q.value < <%= shoe.getStock() %>) q.value++;">+</button>
                    </div>
                </div>
            </div>
            
            <div class="action-buttons" style="margin-top:32px;">
                <% if(shoe.getStock() > 0) { %>
                    <button type="submit" name="action" value="buy_now" class="btn-filled" style="padding:14px; font-size:16px;">Buy Now</button>
                    <button type="submit" name="action" value="add" class="cta-primary" style="padding:14px; font-size:16px;">Add to Cart</button>
                <% } else { %>
                    <button type="button" class="btn-outline" style="background:#f5f5f5; color:var(--gray-500); border-color:var(--gray-200); cursor:not-allowed; grid-column: span 2;">Out of Stock</button>
                <% } %>
            </div>
        </form>
    </div>
</div>

<!-- Reviews Section -->
<div id="reviews" class="container" style="border-top:1px solid var(--gray-200); padding-top:60px;">
    <h2 style="font-size:24px; font-weight:800; margin-bottom:30px;">Product Reviews</h2>
    
    <% if(reviews.isEmpty()) { %>
        <p style="color:var(--gray-500);">No reviews yet. Be the first to review this product!</p>
    <% } else { 
        for(Review r : reviews) {
    %>
        <div style="border-bottom:1px solid var(--gray-200); padding-bottom:20px; margin-bottom:20px;">
            <div style="font-weight:700; font-size:16px; margin-bottom:4px; color:var(--black);"><%= r.getMemberName() %></div>
            <div style="color:#f5a623; font-size:13px; margin-bottom:8px;"><%= r.getRatingType() %></div>
            <p style="color:#555; font-size:14px; line-height:1.6; margin:0;"><%= r.getComments() %></p>
        </div>
    <% } } %>
    
    <% if(user != null && "member".equals(user.getRole())) { %>
        <div style="background:var(--gray-100); border:1px solid var(--gray-200); padding:30px; border-radius:12px; margin-top:40px;">
            <h3 style="margin-top:0; margin-bottom:20px; font-weight:800;">Write a Review</h3>
            <form action="<%= request.getContextPath() %>/ReviewServlet" method="post">
                <input type="hidden" name="productId" value="<%= shoe.getId() %>">
                <div class="form-group">
                    <label>Rating</label>
                    <select name="rating" style="width:100%; max-width:240px; background:white;">
                        <option value="⭐⭐⭐⭐⭐ Excellent">⭐⭐⭐⭐⭐ Excellent</option>
                        <option value="⭐⭐⭐⭐ Good">⭐⭐⭐⭐ Good</option>
                        <option value="⭐⭐⭐ Average">⭐⭐⭐ Average</option>
                        <option value="⭐⭐ Poor">⭐⭐ Poor</option>
                        <option value="⭐ Terrible">⭐ Terrible</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Review Notes</label>
                    <textarea name="comments" rows="4" placeholder="Share your experience with these shoes..." style="background:white;" required></textarea>
                </div>
                <button type="submit" class="btn-filled" style="width:auto; padding:12px 30px;">Submit Review</button>
            </form>
        </div>
    <% } else { %>
        <div style="background:rgba(200,255,0,0.1); border:1px solid var(--gray-200); padding:20px; border-radius:12px; margin-top:40px; text-align:center;">
            <p style="margin:0; font-size:14px; font-weight:600; color:var(--black);">Please <a href="<%= request.getContextPath() %>/LoginServlet" style="text-decoration:underline; font-weight:700; color:var(--black);">Sign In</a> to write a review.</p>
        </div>
    <% } %>
</div>

<jsp:include page="/pages/footer.jsp" />
