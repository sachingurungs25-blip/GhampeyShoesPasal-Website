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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - Ghampey Shoes Pasal Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --black: #0a0a0a;
            --white: #ffffff;
            --gray-100: #f5f5f5;
            --gray-200: #e5e5e5;
            --gray-500: #737373;
            --accent: #c8ff00;
            --shadow-md: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--gray-100);
            padding: 40px 20px;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        .container {
            background: var(--white);
            padding: 40px;
            border-radius: 16px;
            max-width: 600px;
            width: 100%;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--gray-200);
            box-sizing: border-box;
        }

        h1 {
            font-size: 28px;
            font-weight: 800;
            margin-top: 0;
            margin-bottom: 24px;
            letter-spacing: -0.5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 700;
            margin-bottom: 8px;
            font-size: 13px;
            color: var(--black);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid var(--gray-200);
            border-radius: 8px;
            font-family: 'Inter', sans-serif;
            font-size: 14px;
            box-sizing: border-box;
            background: #fafafa;
            transition: all 0.2s;
        }

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none;
            border-color: var(--black);
            background: var(--white);
        }

        .btn {
            background: var(--black);
            color: var(--white);
            padding: 14px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background 0.2s;
        }

        .btn:hover {
            background: #222;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--gray-500);
            text-decoration: underline;
            font-size: 14px;
            font-weight: 600;
        }
        
        .back-link:hover {
            color: var(--black);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Product</h1>
        <form action="<%= request.getContextPath() %>/ShoeServlet" method="post" enctype="multipart/form-data">
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
                <input type="number" name="price" value="<%= (int)shoe.getPrice() %>" required>
            </div>
            <div class="form-group">
                <label>Before Price (For Sales) - Optional</label>
                <input type="number" name="beforePrice" value="<%= shoe.getBeforePrice() > 0 ? (int)shoe.getBeforePrice() : "" %>">
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
                <label>Update Image</label>
                <input type="file" name="image" accept="image/*">
                <p style="font-size:11px; color:var(--gray-500); margin: 6px 0 0 0;">Current: <%= shoe.getImageUrl() %></p>
            </div>
            
            <button type="submit" class="btn">Save Changes</button>
        </form>
        <a href="<%= request.getContextPath() %>/AdminDashboardServlet" class="back-link">Cancel and Return to Dashboard</a>
    </div>
</body>
</html>