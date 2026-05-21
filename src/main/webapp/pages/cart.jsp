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
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fafafa; margin:0; padding:0; color:#333; }
        nav { padding: 20px 48px; background:#fff; border-bottom: 1px solid #eee; display: flex; justify-content: space-between; align-items:center; }
        nav a { text-decoration: none; color: #000; font-weight: 600; margin-right: 20px;}
        
        .container { max-width: 900px; margin: 40px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        h1 { font-size: 28px; font-weight: 800; margin-bottom: 20px; border-bottom: 2px solid #000; padding-bottom:10px;}
        
        table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
        th { text-align: left; padding: 12px; background: #f5f5f5; font-weight: 600; color:#555;}
        td { padding: 15px 12px; border-bottom: 1px solid #eee; vertical-align: middle; }
        .cart-img { width: 60px; height: 60px; object-fit: cover; border-radius: 4px; }
        
        .total-box { text-align: right; font-size: 20px; font-weight: 700; padding: 20px; background:#f9f9f9; border-radius: 4px; }
        
        .btn-remove { background: #ff4d4f; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-size:12px; font-weight:600;}
        .btn-checkout { background: #0a0a0a; color: white; border: none; padding: 12px 24px; border-radius: 40px; cursor: pointer; font-size:16px; font-weight:600; text-decoration:none; display:inline-block; margin-top:20px; float:right;}
        .btn-checkout:hover { background: #333; }
        .btn-continue { color: #0a0a0a; padding: 12px 24px; font-size:16px; font-weight:600; text-decoration:underline; display:inline-block; margin-top:20px; }
    </style>
</head>
<body>

    <nav>
        <div>
            <a href="../HomeServlet" style="font-weight: 900; font-size:20px; text-transform:uppercase;">Ghyampe's <span style="color:#c8ff00; background:#0a0a0a; padding:2px 8px; border-radius:4px;">SHOES</span></a>
        </div>
        <div>
            <a href="../CartServlet" style="color:#f57224;">🛒 Cart (<%= cartCount %>)</a>
            <a href="../HomeServlet">Back to Home</a>
        </div>
    </nav>

    <div class="container">
        <h1>Your Shopping Cart</h1>
        
        <% if (cart == null || cart.isEmpty()) { %>
            <div style="text-align:center; padding: 40px;">
                <p style="font-size:18px; color:#777;">Your cart is completely empty!</p>
                <a href="../HomeServlet" class="btn-checkout" style="float:none;">Start Shopping</a>
            </div>
        <% } else { %>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Size</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>
                <% for (int i = 0; i < cart.size(); i++) { 
                    CartItem item = cart.get(i);
                    double subtotal = item.getPrice() * item.getQuantity();
                    total += subtotal;
                    String img = (item.getImageUrl() != null && !item.getImageUrl().isEmpty()) ? item.getImageUrl() : "images/running_shoe_1777806317504.png";
        if (img != null && img.startsWith("images/")) { img = "../" + img; }
                %>
                <tr>
                    <td>
                        <div style="display:flex; align-items:center; gap:10px;">
                            <img src="<%= img %>" class="cart-img">
                            <span style="font-weight:600;"><%= item.getItemName() %></span>
                        </div>
                    </td>
                    <td><%= item.getSize() %></td>
                    <td>NPR <%= item.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td style="font-weight:600;">NPR <%= subtotal %></td>
                    <td>
                        <form action="../CartServlet" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="index" value="<%= i %>">
                            <button type="submit" class="btn-remove">Remove</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
            
            <div class="total-box">
                Total Price: <span style="color:#f57224;">NPR <%= total %></span>
            </div>
            
            <div style="overflow:hidden;">
                <a href="../HomeServlet" class="btn-continue">← Continue Shopping</a>
                <a href="../CheckoutServlet" class="btn-checkout">Proceed to Checkout →</a>
            </div>
        <% } %>
    </div>
</body>
</html>
