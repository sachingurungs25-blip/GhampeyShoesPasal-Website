<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Ghampey Shoes Pasal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --bg-primary: #f8fafc;
            --bg-card: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --accent-blue: #3b82f6;
            --accent-green: #10b981;
            --accent-orange: #f59e0b;
            --accent-red: #ef4444;
            --border-color: #e2e8f0;
            --sidebar-width: 260px;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-primary);
            color: var(--text-main);
            margin: 0;
            padding: 0;
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styling */
        .sidebar {
            width: var(--sidebar-width);
            background: #0f172a;
            color: #ffffff;
            padding: 40px 24px;
            box-sizing: border-box;
            position: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .brand-logo {
            font-size: 20px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 40px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .brand-logo span {
            color: #c8ff00;
            background: rgba(200, 255, 0, 0.15);
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            flex-grow: 1;
        }

        .nav-item {
            margin-bottom: 12px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 16px;
            color: #94a3b8;
            text-decoration: none;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
        }

        .nav-link.active {
            border-left: 4px solid var(--accent-blue);
        }

        .logout-btn {
            background: var(--accent-red);
            color: white;
            text-align: center;
            padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: opacity 0.2s;
        }

        .logout-btn:hover {
            opacity: 0.9;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: var(--sidebar-width);
            flex-grow: 1;
            padding: 40px 48px;
            box-sizing: border-box;
            max-width: 1400px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 28px;
            font-weight: 800;
            margin: 0;
        }

        .header-actions {
            display: flex;
            gap: 16px;
        }

        .btn-view-home {
            background: #ffffff;
            color: var(--text-main);
            border: 1px solid var(--border-color);
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-view-home:hover {
            background: var(--bg-primary);
            border-color: #cbd5e1;
        }

        /* KPI Cards */
        .kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
            margin-bottom: 40px;
        }

        .kpi-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .kpi-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.04);
        }

        .kpi-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .kpi-value {
            font-size: 28px;
            font-weight: 800;
            color: var(--text-main);
        }

        .kpi-card.blue { border-top: 4px solid var(--accent-blue); }
        .kpi-card.green { border-top: 4px solid var(--accent-green); }
        .kpi-card.orange { border-top: 4px solid var(--accent-orange); }
        .kpi-card.red { border-top: 4px solid var(--accent-red); }

        /* Chart & Grid Section */
        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 24px;
            margin-bottom: 40px;
        }

        .panel-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.02);
        }

        .panel-title {
            font-size: 18px;
            font-weight: 700;
            margin-top: 0;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #475569;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            box-sizing: border-box;
            background: #f8fafc;
            transition: border-color 0.2s;
        }

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none;
            border-color: var(--accent-blue);
            background: #ffffff;
        }

        .btn-submit {
            background: var(--text-main);
            color: white;
            border: none;
            padding: 14px 28px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            transition: background 0.2s;
        }

        .btn-submit:hover {
            background: #1e293b;
        }

        /* Tables Styling */
        .table-responsive {
            overflow-x: auto;
            margin-top: 16px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            padding: 16px;
            border-bottom: 2px solid var(--border-color);
            color: var(--text-muted);
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
        }

        td {
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
            font-size: 14px;
            vertical-align: middle;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .product-img {
            width: 48px;
            height: 48px;
            border-radius: 8px;
            object-fit: cover;
            background: #f1f5f9;
        }

        /* Action Buttons */
        .btn-action {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-action.approve {
            background: #d1fae5;
            color: #065f46;
        }

        .btn-action.approve:hover {
            background: #bbf7d0;
        }

        .btn-action.edit {
            background: #fef3c7;
            color: #92400e;
            margin-right: 8px;
        }

        .btn-action.edit:hover {
            background: #fde68a;
        }

        .btn-action.delete {
            background: #fee2e2;
            color: #991b1b;
        }

        .btn-action.delete:hover {
            background: #fecaca;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div>
            <div class="brand-logo">
                Ghyampe's <span>Admin</span>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link active">
                        Dashboard
                    </a>
                </li>
            </ul>
        </div>
        <a href="../LogoutServlet" class="logout-btn">Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <div>
                <h1>Dashboard</h1>
                <p style="color: var(--text-muted); margin: 4px 0 0 0;">Manage your store catalog and system tasks.</p>
            </div>
            <div class="header-actions">
                <a href="../HomeServlet" class="btn-view-home">View Storefront</a>
            </div>
        </div>

        <!-- KPI Grid -->
        <div class="kpi-grid">
            <div class="kpi-card blue">
                <div class="kpi-label">Total Revenue</div>
                <div class="kpi-value">NPR ${empty totalRevenue ? '0.00' : totalRevenue}</div>
            </div>
            <div class="kpi-card green">
                <div class="kpi-label">Total Orders</div>
                <div class="kpi-value">${empty totalOrders ? '0' : totalOrders}</div>
            </div>
            <div class="kpi-card orange">
                <div class="kpi-label">Total Products</div>
                <div class="kpi-value">${empty totalProducts ? '0' : totalProducts}</div>
            </div>
        
        </div>

        <!-- Chart and Form Section -->
        <div class="dashboard-grid">
            <!-- Sales Chart Card -->
            <div class="panel-card">
                <div class="panel-title">Sales Revenue Trend (Last 7 Days)</div>
                <div style="position: relative; height: 350px; width: 100%;">
                    <canvas id="salesChart"></canvas>
                </div>
            </div>

            <!-- Add Product Card -->
            <div class="panel-card">
                <div class="panel-title">Add New Product</div>
                <form action="../ShoeServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="form-group">
                        <label>Item Name</label>
                        <input type="text" name="itemName" placeholder="e.g. Air Max Limited" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" required>
                            <option value="Men">Men</option>
                            <option value="Women">Women</option>
                            <option value="Kids">Kids</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Selling Price (NPR)</label>
                        <input type="number" step="0.01" name="price" placeholder="e.g. 8500" required>
                    </div>

                    <div class="form-group">
                        <label>Before Price (For discount display) - Optional</label>
                        <input type="number" step="0.01" name="beforePrice" placeholder="e.g. 10000">
                    </div>

                    <div class="form-group">
                        <label>Initial Stock</label>
                        <input type="number" name="stock" value="10" required>
                    </div>

                    <div class="form-group">
                        <label>Product Image</label>
                        <input type="file" name="image" accept="image/*" required>
                    </div>

                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" rows="3" placeholder="Brief details about the shoe..."></textarea>
                    </div>

                    <button type="submit" class="btn-submit">Add Product</button>
                </form>
            </div>
        </div>

        <!-- Pending Registrations Table -->
       

        <!-- Product Catalog Table -->
        <div class="panel-card">
            <div class="panel-title">Product Catalog Management</div>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Preview</th>
                            <th>Item Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="shoe" items="${shoes}">
                            <tr>
                                <td>#${shoe.id}</td>
                                <td>
                                    <img class="product-img" src="${empty shoe.imageUrl ? '../images/running_shoe_1777806317504.png' : (shoe.imageUrl.startsWith('images/') ? '../' : '') += shoe.imageUrl}" alt="Shoe">
                                </td>
                                <td><strong>${shoe.itemName}</strong></td>
                                <td><span style="background: #f1f5f9; padding: 4px 10px; border-radius: 12px; font-size: 12px; font-weight: 600;">${shoe.category}</span></td>
                                <td><strong>NPR ${shoe.price}</strong></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${shoe.stock > 0}">
                                            <span style="color: var(--accent-green); font-weight: 600;">${shoe.stock} available</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: var(--accent-red); font-weight: 600;">Out of Stock</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="../ShoeServlet?action=showEdit&id=${shoe.id}" class="btn-action edit">Edit</a>
                                    <a href="../ShoeServlet?action=delete&id=${shoe.id}" class="btn-action delete" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Chart rendering script -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const ctx = document.getElementById('salesChart').getContext('2d');
            
            // Fallback empty data if arrays are not populated
            const dates = ${empty salesDatesJson ? '[]' : salesDatesJson};
            const revenues = ${empty salesRevenuesJson ? '[]' : salesRevenuesJson};

            const gradient = ctx.createLinearGradient(0, 0, 0, 300);
            gradient.addColorStop(0, 'rgba(59, 130, 246, 0.4)');
            gradient.addColorStop(1, 'rgba(59, 130, 246, 0.01)');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: dates,
                    datasets: [{
                        label: 'Daily Sales (NPR)',
                        data: revenues,
                        borderColor: '#3b82f6',
                        borderWidth: 3,
                        backgroundColor: gradient,
                        fill: true,
                        tension: 0.4,
                        pointBackgroundColor: '#3b82f6',
                        pointBorderColor: '#ffffff',
                        pointBorderWidth: 2,
                        pointRadius: 6,
                        pointHoverRadius: 8
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: '#0f172a',
                            titleFont: { family: 'Inter', size: 13, weight: 'bold' },
                            bodyFont: { family: 'Inter', size: 13 },
                            padding: 12,
                            cornerRadius: 8,
                            displayColors: false
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                display: false
                            },
                            ticks: {
                                font: {
                                    family: 'Inter',
                                    size: 11
                                },
                                color: '#64748b'
                            }
                        },
                        y: {
                            grid: {
                                color: '#f1f5f9'
                            },
                            ticks: {
                                font: {
                                    family: 'Inter',
                                    size: 11
                                },
                                color: '#64748b',
                                callback: function(value) {
                                    return 'Rs.' + value;
                                }
                            }
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>
