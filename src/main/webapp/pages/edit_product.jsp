<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ghyampes.model.User, com.ghyampes.dao.ShoeDAO, com.ghyampes.model.Shoe" %>
<%
    HttpSession s = request.getSession(false);
    User user = (s != null) ? (User) s.getAttribute("user") : null;
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect(request.getContextPath() + "/LoginServlet");
        return;
    }
    String idParam = request.getParameter("id");
    Shoe shoe = null;
    if(idParam != null && !idParam.isEmpty()) {
        shoe = new ShoeDAO().getShoeById(Integer.parseInt(idParam));
    }
    if(shoe == null) {
        response.sendRedirect(request.getContextPath() + "/AdminDashboardServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product - Ghampey Shoes Pasal Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f5f5f5; padding: 40px; }
        .container { background: white; padding: 40px; border-radius: 8px; max-width: 600px; margin: 0 auto; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        h1 { font-size: 24px; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-weight: 600; margin-bottom: 8px; font-size: 14px; }
        .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 4px; font-family: 'Inter', sans-serif; box-sizing: border-box; }
        .btn { background: #0a0a0a; color: white; padding: 12px 24px; border: none; border-radius: 4px; font-weight: 600; cursor: pointer; width: 100%; font-size:16px; }
        .btn:hover { background: #333; }
        .back-link { display: block; text-align: center; margin-top: 20px; color: #555; text-decoration: none; font-size: 14px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Product</h1>
        <form action="../ShoeServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="id" value="<%= shoe.getId() %>">
            
            <div class="form-group">
                <label>Item Name</label>
                <input type="text" name="itemName" value="<%= shoe.getItemName() %>" required>
            </div>
            <div class="form-group">
                <label>Category</label>
                <input type="text" name="category" value="<%= shoe.getCategory() %>" required>
            </div>
            <div class="form-group">
                <label>Current Price (NPR)</label>
                <input type="number" name="price" value="<%= shoe.getPrice() %>" required>
            </div>
            <div class="form-group">
                <label>Before Price (For Sales) - Optional</label>
                <input type="number" name="beforePrice" value="<%= shoe.getBeforePrice() > 0 ? shoe.getBeforePrice() : "" %>">
            </div>
            <div class="form-group">
                <label>Available Stock</label>
                <input type="number" name="stock" value="<%= shoe.getStock() %>" required>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" rows="3" required><%= shoe.getDescription() %></textarea>
            </div>
            <div class="form-group">
                <label>Update Image (Leave blank to keep current: <%= shoe.getImageUrl() %>)</label>
                <input type="file" name="image" accept="image/*">
            </div>
            
            <button type="submit" class="btn">Save Changes</button>
        </form>
        <a href="../AdminDashboardServlet" class="back-link">Cancel and Return to Dashboard</a>
    </div>
</body>
</html>