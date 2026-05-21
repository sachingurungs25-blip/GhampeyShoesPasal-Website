<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.dao.ShoeDAO, com.ghyampes.model.Shoe, java.util.List" %>
<% 
    List<Shoe> shoeList = new ShoeDAO().getAllShoes(); 
    request.setAttribute("pageTitle", "Ghampey Shoes Pasal | Premium Footwear in Nepal");
%>
<jsp:include page="/pages/header.jsp" />

<!-- HERO -->
<section class="hero">
    <div class="hero-left">
        <span class="hero-tag">🇳🇵 Pokhara's Finest</span>
        <h1>Walk<br>Different.<br><span class="highlight">Feel</span><br>Different.</h1>
        <p>Ghampey Shoes Pasal brings you Nepal's premium footwear collection. From the mountains to the streets — crafted for every journey.</p>
        <div class="hero-cta">
            <a href="#products" class="cta-primary">Shop Now</a>
            <a href="<%= request.getContextPath() %>/ProductServlet" class="cta-secondary">Explore Collection →</a>
        </div>
    </div>
    <div class="hero-right">
        <img src="<%= request.getContextPath() %>/images/basketball_shoe_1777806717532.png" alt="Premium Shoe">
    </div>
</section>

<!-- PRODUCTS -->
<section class="section" id="products">
    <div class="section-header">
        <h2>Trending Now</h2>
    </div>
    <div class="product-grid">
        <% for(Shoe s : shoeList) { 
            String img = (s.getImageUrl() != null && !s.getImageUrl().isEmpty()) ? s.getImageUrl() : "images/running_shoe_1777806317504.png";
            if (img != null && img.startsWith("images/")) { img = request.getContextPath() + "/" + img; }
        %>
        <a href="<%= request.getContextPath() %>/ProductServlet?id=<%= s.getId() %>" class="product-card">
            <div class="product-img-wrap">
                <img src="<%= img %>" alt="Shoe">
            </div>
            <div class="product-name"><%= s.getItemName() %></div>
            <div class="product-category"><%= s.getCategory() %></div>
            <div style="font-size:12px; font-weight:600; margin-bottom:8px; color: <%= s.getStock() > 0 ? "#52c41a" : "red" %>"><%= s.getStock() > 0 ? "Stock: " + s.getStock() + " available" : "Out of Stock" %></div>
            
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
</section>

<jsp:include page="/pages/footer.jsp" />