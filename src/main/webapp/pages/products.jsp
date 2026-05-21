<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    request.setAttribute("pageTitle", category + " Collection - Ghampey Shoes Pasal");
%>
<jsp:include page="/pages/header.jsp" />

<div class="container" style="margin-top: 80px;">
    <h1 style="font-size:32px; font-weight:800; margin-bottom:30px; text-transform:uppercase;"><%= category %> Collection</h1>
    
    <% if(filteredShoes.isEmpty()) { %>
        <p style="color:var(--gray-500); font-size:16px;">No products found in this category yet. Check back soon!</p>
    <% } else { %>
        <div class="product-grid">
            <% for(Shoe s : filteredShoes) { 
                String img = (s.getImageUrl() != null && !s.getImageUrl().isEmpty()) ? s.getImageUrl() : "images/running_shoe_1777806317504.png";
                if (img != null && img.startsWith("images/")) { img = request.getContextPath() + "/" + img; }
            %>
            <a href="<%= request.getContextPath() %>/ProductServlet?id=<%= s.getId() %>" class="product-card">
                <div class="product-img-wrap">
                    <img src="<%= img %>" alt="<%= s.getItemName() %>">
                </div>
                <div class="product-name"><%= s.getItemName() %></div>
                <div style="font-size:12px; font-weight:600; margin-bottom:8px; margin-top:4px; color: <%= s.getStock() > 0 ? "var(--accent-green)" : "var(--accent-red)" %>">
                    <%= s.getStock() > 0 ? "Stock: " + s.getStock() + " available" : "Out of Stock" %>
                </div>
                
                <div class="product-price">
                    <% if(s.getBeforePrice() > 0) { %>
                        <strike style="color:var(--gray-500); font-size:13px;">NPR <%= s.getBeforePrice() %></strike> 
                        <span style="color:var(--accent-red); margin-left:6px;">NPR <%= s.getPrice() %></span>
                    <% } else { %>
                        NPR <%= s.getPrice() %>
                    <% } %>
                </div>
                <div style="margin-top:10px;">
                    <span style="display:block; text-align:center; background:var(--black); color:white; padding:8px 16px; border-radius:40px; font-size:14px; font-weight:600;">View Details</span>
                </div>
            </a>
            <% } %>
        </div>
    <% } %>
</div>

<jsp:include page="/pages/footer.jsp" />
