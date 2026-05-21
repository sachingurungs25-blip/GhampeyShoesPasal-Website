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
    List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; 
Shoe shoe = null;
    User user = (User) session.getAttribute("user");
    List<Review> reviews = new java.util.ArrayList<>();
    if(shoe != null) {
        reviews = new ReviewDAO().getReviewsByProduct(shoe.getId());
    }

    if(idParam != null && !idParam.isEmpty()) {
        shoe = new ShoeDAO().getShoeById(Integer.parseInt(idParam));
    }
    if (shoe == null) {
        response.sendRedirect("../HomeServlet");
        return;
    }
    String img = (shoe.getImageUrl() != null && !shoe.getImageUrl().isEmpty()) ? shoe.getImageUrl() : "images/running_shoe_1777806317504.png";
        if (img != null && img.startsWith("images/")) { img = "../" + img; }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= shoe.getItemName() %> - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fff; margin:0; padding:0; color:#333; }
        
        /* Navbar matching index */
        nav { padding: 20px 48px; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items:center; }
        nav a { text-decoration: none; color: #000; font-weight: 600; margin-right: 20px;}
        
        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; display: grid; grid-template-columns: 1fr 1fr; gap: 40px; }
        
        /* Left side - Image */
        .image-section { background: #f9f9f9; padding: 20px; border-radius: 8px; text-align:center; }
        .image-section img { max-width: 100%; height: auto; border-radius: 8px; }
        
        /* Right side - Details */
        .details-section { padding-top: 20px; }
        .title { font-size: 24px; font-weight: 600; margin-bottom: 10px; color:#212121; line-height:1.3; }
        .ratings { color: #f5a623; font-size: 14px; margin-bottom: 15px; }
        .ratings span { color: #1890ff; margin-left: 10px; cursor:pointer; }
        
        .brand-info { font-size: 13px; color: #757575; margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid #eee; }
        .brand-info span { color: #1890ff; cursor:pointer;}
        
        .price-area { margin-bottom: 20px; padding-bottom: 20px; border-bottom: 1px solid #eee; }
        .price { font-size: 32px; font-weight: 500; color: #f57224; }
        .before-price { font-size: 16px; color: #9e9e9e; text-decoration: line-through; margin-left: 10px; }
        .discount { font-size: 14px; color: #212121; margin-left: 5px; }
        
        .option-group { margin-bottom: 25px; }
        .option-label { font-size: 14px; color: #757575; margin-bottom: 10px; display: block; }
        
        /* Size Boxes */
        .size-options { display: flex; gap: 10px; }
        .size-box { 
            border: 1px solid #dadada; padding: 8px 16px; font-size: 14px; cursor: pointer;
            background: #fff; border-radius: 2px; color: #212121;
        }
        .size-box:hover { border-color: #f57224; color: #f57224; }
        .size-box.active { border-color: #f57224; color: #f57224; }
        
        /* Quantity */
        .qty-wrapper { display: flex; align-items: center; gap: 15px; }
        .qty-controls { display: flex; border: 1px solid #eee; border-radius: 2px; overflow:hidden;}
        .qty-btn { background: #f5f5f5; border: none; padding: 10px 15px; cursor: pointer; font-size: 16px; color: #757575;}
        .qty-btn:hover { background: #e0e0e0; }
        .qty-input { width: 50px; text-align: center; border: none; font-size: 16px; border-left: 1px solid #eee; border-right: 1px solid #eee;}
        
        /* Buttons */
        .action-buttons { display: flex; gap: 15px; margin-top: 30px; }
        .btn-buy { flex: 1; background: #26abd4; color: white; border: none; padding: 14px; font-size: 16px; font-weight: 500; cursor: pointer; border-radius: 2px;}
        .btn-buy:hover { background: #1c92b8; }
        .btn-cart { flex: 1; background: #f57224; color: white; border: none; padding: 14px; font-size: 16px; font-weight: 500; cursor: pointer; border-radius: 2px;}
        .btn-cart:hover { background: #d05c1a; }
    </style>
</head>
<body>

    <nav>
        <div>
            <a href="../HomeServlet" style="font-weight: 900; font-size:20px; text-transform:uppercase;">Ghyampe's <span style="color:#c8ff00; background:#0a0a0a; padding:2px 8px; border-radius:4px;">SHOES</span></a>
        </div>
        <div><a href="../CartServlet" style="color:#f57224;">🛒 Cart (<%= cartSize %>)</a><a href="../HomeServlet">Back to Home</a></div>
    </nav>

    <div class="container">
        <!-- Left Image -->
        <div class="image-section">
            <img src="<%= img %>" alt="<%= shoe.getItemName() %>">
        </div>
        
        <!-- Right Details -->
        <div class="details-section">
            <div class="title"><%= shoe.getItemName() %></div>
            
            <div class="ratings">
                <% if(reviews.isEmpty()) { %>
                    <span style="color:#757575;">No reviews yet</span>
                <% } else { %>
                    ⭐ <a href="#reviews" style="color:#1890ff; text-decoration:none;"><%= reviews.size() %> Reviews</a>
                <% } %>
            </div>
            
            <div class="brand-info">
                <strong>Description:</strong> <span style="color:#333;"><%= shoe.getDescription() %></span>
            </div>
            <div style="margin-bottom:20px; font-weight:600; color:<%= shoe.getStock()>0?"#52c41a":"red" %>">Availability: <%= shoe.getStock()>0 ? shoe.getStock() + " In Stock" : "Out of Stock" %></div>
            
            <div class="price-area">
                <div class="price">Rs. <%= (int)shoe.getPrice() %></div>
                <% if(shoe.getBeforePrice() > 0) { 
                    int discount = (int)(((shoe.getBeforePrice() - shoe.getPrice()) / shoe.getBeforePrice()) * 100);
                %>
                    <div>
                        <span class="before-price">Rs. <%= (int)shoe.getBeforePrice() %></span>
                        <span class="discount">-<%= discount %>%</span>
                    </div>
                <% } %>
            </div>
            
            <form action="../CheckoutServlet" method="post">
                <input type="hidden" name="productId" value="<%= shoe.getId() %>">
                
                <div class="option-group">
                    <span class="option-label">Size</span>
                    
                    <div class="size-options">
                        <label style="cursor:pointer;"><input type="radio" name="size" value="EU: 39" checked style="display:none;"><div class="size-box active" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 39</div></label>
                        <label style="cursor:pointer;"><input type="radio" name="size" value="EU: 40" style="display:none;"><div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 40</div></label>
                        <label style="cursor:pointer;"><input type="radio" name="size" value="EU: 41" style="display:none;"><div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 41</div></label>
                        <label style="cursor:pointer;"><input type="radio" name="size" value="EU: 42" style="display:none;"><div class="size-box" onclick="document.querySelectorAll('.size-box').forEach(b=>b.classList.remove('active')); this.classList.add('active');">EU: 42</div></label>
                    </div>
                </div>
                
                <div class="option-group">
                    <div class="qty-wrapper">
                        <span class="option-label" style="margin:0;">Quantity</span>
                        <div class="qty-controls">
                            <button type="button" class="qty-btn" onclick="let q=document.getElementById('qty'); if(q.value>1)q.value--;">-</button>
                            <input type="text" name="quantity" id="qty" value="1" class="qty-input" readonly>
                            <button type="button" class="qty-btn" onclick="let q=document.getElementById('qty'); if(q.value < <%= shoe.getStock() %>) q.value++;">+</button>
                        </div>
                    </div>
                </div>
                
                
                <div class="action-buttons">
                    <% if(shoe.getStock() > 0) { %>
                        <button type="submit" name="action" value="buy_now" class="btn-buy" formaction="../CartServlet">Buy Now</button>
                        <button type="submit" name="action" value="add" class="btn-cart" formaction="../CartServlet">Add to Cart</button>
                    <% } else { %>
                        <button type="button" class="btn-buy" style="background:#999; cursor:not-allowed;">Out of Stock</button>
                    <% } %>
                </div>

            </form>
        </div>
    </div>


    <!-- Reviews Section -->
    <div id="reviews" style="max-width: 1200px; margin: 60px auto; padding: 0 20px;">
        <h2 style="font-size:24px; border-bottom:1px solid #eee; padding-bottom:15px; margin-bottom:30px;">Product Reviews</h2>
        
        <% if(reviews.isEmpty()) { %>
            <p style="color:#757575;">No reviews yet. Be the first to review this product!</p>
        <% } else { 
            for(Review r : reviews) {
        %>
            <div style="border-bottom:1px solid #f0f0f0; padding-bottom:20px; margin-bottom:20px;">
                <div style="font-weight:600; font-size:16px; margin-bottom:5px;"><%= r.getMemberName() %></div>
                <div style="color:#f5a623; font-size:14px; margin-bottom:10px;"><%= r.getRatingType() %></div>
                <p style="color:#555; font-size:14px; line-height:1.6; margin:0;"><%= r.getComments() %></p>
            </div>
        <% } } %>
        
        <% if(user != null && "member".equals(user.getRole())) { %>
            <div style="background:#f9f9f9; padding:30px; border-radius:8px; margin-top:40px;">
                <h3 style="margin-top:0; margin-bottom:20px;">Write a Review</h3>
                <form action="../ReviewServlet" method="post">
                    <input type="hidden" name="productId" value="<%= shoe.getId() %>">
                    <div style="margin-bottom:15px;">
                        <label style="display:block; margin-bottom:8px; font-weight:600;">Rating</label>
                        <select name="rating" style="padding:10px; width:200px; border:1px solid #ddd; border-radius:4px;">
                            <option value="⭐⭐⭐⭐⭐ Excellent">⭐⭐⭐⭐⭐ Excellent</option>
                            <option value="⭐⭐⭐⭐ Good">⭐⭐⭐⭐ Good</option>
                            <option value="⭐⭐⭐ Average">⭐⭐⭐ Average</option>
                            <option value="⭐⭐ Poor">⭐⭐ Poor</option>
                            <option value="⭐ Terrible">⭐ Terrible</option>
                        </select>
                    </div>
                    <div style="margin-bottom:15px;">
                        <label style="display:block; margin-bottom:8px; font-weight:600;">Review Note</label>
                        <textarea name="comments" rows="4" style="width:100%; padding:10px; border:1px solid #ddd; border-radius:4px;" required></textarea>
                    </div>
                    <button type="submit" style="background:#0a0a0a; color:white; border:none; padding:12px 24px; font-weight:600; border-radius:4px; cursor:pointer;">Submit Review</button>
                </form>
            </div>
        <% } else { %>
            <div style="background:#f0f8ff; padding:20px; border-radius:8px; margin-top:40px; text-align:center;">
                <p style="margin:0; color:#333;">Please <a href="../LoginServlet" style="color:#1890ff; font-weight:600;">login</a> to write a review.</p>
            </div>
        <% } %>
    </div>

</body>
</html>
