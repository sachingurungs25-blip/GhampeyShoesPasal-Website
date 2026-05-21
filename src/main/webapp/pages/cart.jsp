<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    double total = 0;
    int cartCount = (cart != null) ? cart.size() : 0;
    request.setAttribute("pageTitle", "Your Cart - Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container" style="margin-top: 80px; max-width: 900px;">
    <h1 style="font-size:28px; font-weight:800; margin-bottom:20px; border-bottom:2px solid var(--black); padding-bottom:10px;">Your Shopping Cart</h1>
    
    <% if (cart == null || cart.isEmpty()) { %>
        <div style="text-align:center; padding: 60px 0;">
            <p style="font-size:18px; color:var(--gray-500); margin-bottom:24px;">Your cart is completely empty!</p>
            <a href="<%= request.getContextPath() %>/HomeServlet" class="btn-filled">Start Shopping</a>
        </div>
    <% } else { %>
        <div class="table-responsive cart-responsive-table">
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Size</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < cart.size(); i++) { 
                        CartItem item = cart.get(i);
                        double subtotal = item.getPrice() * item.getQuantity();
                        total += subtotal;
                        String img = (item.getImageUrl() != null && !item.getImageUrl().isEmpty()) ? item.getImageUrl() : "images/running_shoe_1777806317504.png";
                        if (img != null && img.startsWith("images/")) { img = request.getContextPath() + "/" + img; }
                    %>
                    <tr>
                        <td data-label="Product">
                            <div style="display:flex; align-items:center; gap:12px; text-align:left;">
                                <img src="<%= img %>" class="cart-img" style="width:60px; height:60px; object-fit:cover; border-radius:6px; border:1px solid var(--gray-200);">
                                <span style="font-weight:700;"><%= item.getItemName() %></span>
                            </div>
                        </td>
                        <td data-label="Size"><%= item.getSize() %></td>
                        <td data-label="Price">NPR <%= (int)item.getPrice() %></td>
                        <td data-label="Qty"><%= item.getQuantity() %></td>
                        <td data-label="Subtotal" style="font-weight:700;">NPR <%= (int)subtotal %></td>
                        <td data-label="Action">
                            <form action="<%= request.getContextPath() %>/CartServlet" method="post" style="margin:0;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="index" value="<%= i %>">
                                <button type="submit" class="btn-remove" style="background:var(--accent-red); color:white; border:none; padding:8px 16px; border-radius:20px; cursor:pointer; font-size:12px; font-weight:700; transition:opacity 0.2s;">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <div class="total-box" style="text-align:right; font-size:20px; font-weight:800; padding:24px; background:var(--gray-100); border-radius:12px; border:1px solid var(--gray-200); margin-bottom:24px;">
            Total Price: <span style="color:var(--black); background:var(--accent); padding:4px 12px; border-radius:6px;">NPR <%= (int)total %></span>
        </div>
        
        <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:16px;">
            <a href="<%= request.getContextPath() %>/HomeServlet" class="btn-outline" style="text-decoration:none;">← Continue Shopping</a>
            <a href="<%= request.getContextPath() %>/CheckoutServlet" class="btn-filled" style="text-decoration:none;">Proceed to Checkout →</a>
        </div>
    <% } %>
</div>

<jsp:include page="/pages/footer.jsp" />
