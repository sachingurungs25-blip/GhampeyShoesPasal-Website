<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User, com.ghyampes.model.CartItem, java.util.List" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    User user = (User) session.getAttribute("user");
    List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
    if(user == null) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; }
    if(cartList == null || cartList.isEmpty()) { response.sendRedirect(request.getContextPath() + "/CartServlet"); return; }
    double totalAmount = 0;
    for(CartItem item : cartList) {
        totalAmount += item.getPrice() * item.getQuantity();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fafafa; margin:0; padding:40px; color:#333; }
        .checkout-container { max-width: 600px; margin: 0 auto; background: #fff; padding: 40px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); }
        h1 { font-size: 24px; font-weight: 700; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; font-size: 14px; margin-bottom: 8px; }
        label span { color: red; }
        input[type="text"], input[type="tel"], textarea, select { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; font-family: 'Inter', sans-serif; font-size:14px; }
        .grid-2 { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .btn-submit { background: #0a0a0a; color: #fff; border: none; padding: 16px; font-size: 16px; font-weight: 600; width: 100%; border-radius: 4px; cursor: pointer; margin-top: 20px; }
        .btn-submit:hover { background: #333; }
        .section-title { font-size: 18px; font-weight: 700; margin: 30px 0 15px; border-bottom: 1px solid #eee; padding-bottom: 10px; }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h1>Complete Your Order</h1>
        <div style="background: #f9f9f9; padding: 15px; border-radius: 4px; margin-bottom: 20px; font-size:14px; color:#555;">
            <p style="margin:0 0 8px;"><b>Username:</b> <%= user.getUsername() %></p>
            <p style="margin:0 0 8px;"><b>Full Name:</b> <%= user.getFullName() %></p>
            <p style="margin:0 0 8px;"><b>Phone Number:</b> <%= user.getPhone() != null ? user.getPhone() : "" %></p>
            <p style="margin:0; font-size:16px; color:#000;"><b>Total Amount:</b> NPR <%= totalAmount %></p>
        </div>
        
        <form action="../ProcessOrderServlet" method="post">
            <input type="hidden" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
            
            <div class="form-group">
                <label>Order Note (any message for us)</label>
                <textarea name="orderNote" rows="2" placeholder="eg: I was searching for this product from so long."></textarea>
            </div>
            
            <div class="section-title">Delivery Address</div>
            
            <div class="form-group">
                <label>City/District <span>*</span></label>
                <select name="city" required>
                    <option value="">Select City</option>
                    <option value="Pokhara">Pokhara</option>
                    <option value="Kathmandu">Kathmandu</option>
                    <option value="Lalitpur">Lalitpur</option>
                    <option value="Bhaktapur">Bhaktapur</option>
                    <option value="Chitwan">Chitwan</option>
                    <option value="Butwal">Butwal</option>
                </select>
            </div>
            
            <div class="grid-2">
                <div class="form-group">
                    <label>Address <span>*</span></label>
                    <input type="text" name="address" required placeholder="e.g. Lakeside-6">
                </div>
                <div class="form-group">
                    <label>Landmark</label>
                    <input type="text" name="landmark" placeholder="eg: Madan Bhandari Park">
                </div>
            </div>
            
            <button type="submit" class="btn-submit">Place Order</button>
        </form>
    </div>
</body>
</html>