<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.CartItem, java.util.List" %>
<% List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); int cartSize = (cartList != null) ? cartList.size() : 0; %>
<%@ page import="com.ghyampes.dao.ShoeDAO, com.ghyampes.model.Shoe, java.util.List, java.util.ArrayList" %>
<% 
    String category = request.getParameter("category");
    if(category == null) category = "Men";
    List<Shoe> allShoes = new ShoeDAO().getAllShoes(); 
    List<Shoe> filteredShoes = new ArrayList<>();
    for(Shoe s : allShoes) {
        if ("Sale".equalsIgnoreCase(category)) {
            if (s.getBeforePrice() > 0) {
                filteredShoes.add(s);
            }
        } else if (category.equalsIgnoreCase(s.getCategory())) {
            filteredShoes.add(s);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= category %> - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #fff; margin:0; padding:0; }
        nav { padding: 20px 48px; border-bottom: 1px solid #eee; display: flex; justify-content: space-between;}
        nav a { text-decoration: none; color: #000; font-weight: 600; margin-right: 20px;}
        .container { padding: 40px 48px; }
        h1 { font-size: 32px; font-weight: 800; margin-bottom: 30px; text-transform: uppercase;}
        .product-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
        .product-card { text-decoration: none; color: #000; display: block; }
        .product-img-wrap { background: #f5f5f5; border-radius: 12px; aspect-ratio: 1/1; overflow: hidden; margin-bottom: 16px; }
        .product-img-wrap img { width: 100%; height: 100%; object-fit: cover; }
        .product-name { font-size: 15px; font-weight: 700; }
        .product-price { font-size: 15px; font-weight: 700; margin-top: 4px; }
        .btn-buy { background:#0a0a0a; color:white; padding:8px 16px; border:none; border-radius:40px; cursor:pointer; width:100%; margin-top:10px; }
    </style>
</head>
<body>
    <nav>
        <div>
            <a href="../HomeServlet" style="font-weight: 800;">GHAMPEY SHOES PASAL</a>
            <a href="../ProductServlet?category=Men">Men</a>
            <a href="../ProductServlet?category=Women">Women</a>
            <a href="../ProductServlet?category=Kids">Kids</a>
            <a href="../ProductServlet?category=Sale">Sale</a>
        </div>
        <div><a href="../HomeServlet">Back to Home</a></div>
    </nav>

    <div class="container">
        <h1><%= category %> Collection</h1>
        <% if(filteredShoes.isEmpty()) { %>
            <p>No products found in this category yet. Check back soon!</p>
        <% } else { %>
            <div class="product-grid">
                <% for(Shoe s : filteredShoes) { 
                    String img = (s.getImageUrl() != null && !s.getImageUrl().isEmpty()) ? s.getImageUrl() : "images/running_shoe_1777806317504.png";
        if (img != null && img.startsWith("images/")) { img = "../" + img; }
                %>
                <a href="../ProductServlet?id=<%= s.getId() %>" class="product-card" style="text-decoration:none;">
                    <div class="product-img-wrap"><img src="<%= img %>" alt="Shoe"></div>
                    <div class="product-name"><%= s.getItemName() %></div>
                    <div style="font-size:12px; font-weight:600; margin-bottom:8px; margin-top:4px; color: <%= s.getStock()>0?"#52c41a":"red" %>"><%= s.getStock()>0 ? "Stock: "+s.getStock()+" available" : "Out of Stock" %></div>
                    
            <div class="product-price">
                <% if(s.getBeforePrice() > 0) { %>
                    <strike style="color:#a0a0a0; font-size:13px;">NPR <%= s.getBeforePrice() %></strike> 
                    <span style="color:red;">NPR <%= s.getPrice() %></span>
                <% } else { %>
                    NPR <%= s.getPrice() %>
                <% } %>
            </div>
                    <div style="margin-top:10px;"><span style="display:block; text-align:center; background:#0a0a0a; color:white; padding:8px 16px; border-radius:40px; font-size:14px;">View Details</span></div>
                </a>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>
