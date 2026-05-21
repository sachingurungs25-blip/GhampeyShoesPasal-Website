<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User, com.ghyampes.model.CartItem, java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
    if(user == null) { 
        response.sendRedirect(request.getContextPath() + "/LoginServlet"); 
        return; 
    }
    if(cartList == null || cartList.isEmpty()) { 
        response.sendRedirect(request.getContextPath() + "/CartServlet"); 
        return; 
    }
    double totalAmount = 0;
    for(CartItem item : cartList) {
        totalAmount += item.getPrice() * item.getQuantity();
    }
    request.setAttribute("pageTitle", "Checkout - Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container" style="margin-top: 80px; max-width: 650px;">
    <div style="background:var(--white); border:1.5px solid var(--gray-200); border-radius:16px; padding:40px; box-shadow:var(--shadow-md);">
        <h1 style="font-size:28px; font-weight:800; margin-bottom:24px; letter-spacing:-0.5px;">Complete Your Order</h1>
        
        <div style="background: var(--gray-100); border: 1px solid var(--gray-200); padding: 20px; border-radius: 12px; margin-bottom: 30px; font-size:14px; color:#555; display:flex; flex-direction:column; gap:8px;">
            <p style="margin:0;"><b>Username:</b> <%= user.getUsername() %></p>
            <p style="margin:0;"><b>Full Name:</b> <%= user.getFullName() %></p>
            <p style="margin:0;"><b>Phone Number:</b> <%= user.getPhone() != null ? user.getPhone() : "" %></p>
            <p style="margin:8px 0 0; font-size:18px; color:var(--black); border-top:1px dashed var(--gray-300); padding-top:8px;">
                <b>Total Amount:</b> <span style="background:var(--accent); font-weight:800; padding:2px 8px; border-radius:4px;">NPR <%= (int)totalAmount %></span>
            </p>
        </div>
        
        <form action="<%= request.getContextPath() %>/ProcessOrderServlet" method="post" style="margin:0;">
            <input type="hidden" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>">
            
            <div class="form-group">
                <label>Order Note (optional)</label>
                <textarea name="orderNote" rows="2" placeholder="Any special delivery instructions or messages..."></textarea>
            </div>
            
            <h2 style="font-size: 18px; font-weight: 800; margin: 30px 0 15px; border-bottom: 1px solid var(--gray-200); padding-bottom: 10px;">Delivery Address</h2>
            
            <div class="form-group">
                <label>City/District <span style="color:var(--accent-red);">*</span></label>
                <select name="city" required style="background:white;">
                    <option value="">Select City</option>
                    <option value="Pokhara">Pokhara</option>
                    <option value="Kathmandu">Kathmandu</option>
                    <option value="Lalitpur">Lalitpur</option>
                    <option value="Bhaktapur">Bhaktapur</option>
                    <option value="Chitwan">Chitwan</option>
                    <option value="Butwal">Butwal</option>
                </select>
            </div>
            
            <div style="display:grid; grid-template-columns: 1fr 1fr; gap:16px;" class="action-buttons">
                <div class="form-group">
                    <label>Address Line <span style="color:var(--accent-red);">*</span></label>
                    <input type="text" name="address" required placeholder="e.g. Lakeside-6">
                </div>
                <div class="form-group">
                    <label>Landmark</label>
                    <input type="text" name="landmark" placeholder="eg: Near Madan Bhandari Park">
                </div>
            </div>
            
            <button type="submit" class="btn-submit" style="margin-top:16px;">Place Order</button>
        </form>
    </div>
</div>

<jsp:include page="/pages/footer.jsp" />