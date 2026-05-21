package com.ghyampes.controller.servlets;

import com.ghyampes.dao.OrderDAO;
import com.ghyampes.dao.ShoeDAO;
import com.ghyampes.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShoeDAO shoeDAO = new ShoeDAO();
        UserDAO userDAO = new UserDAO();
        OrderDAO orderDAO = new OrderDAO();

        // Existing data
        request.setAttribute("shoes", shoeDAO.getAllShoes());
        request.setAttribute("pendingUsers", userDAO.getPendingMembers());

        // Stats for summary cards
        request.setAttribute("totalRevenue", orderDAO.getTotalRevenue());
        request.setAttribute("totalOrders", orderDAO.getTotalOrders());
        request.setAttribute("totalProducts", shoeDAO.getAllShoes().size());
        request.setAttribute("pendingCount", userDAO.getPendingMembers().size());

        // Sales chart data — last 7 days, converted to JSON arrays for Chart.js
        List<Map<String, Object>> salesData = orderDAO.getSalesByDay(7);
        StringBuilder labels = new StringBuilder("[");
        StringBuilder revenues = new StringBuilder("[");
        StringBuilder counts = new StringBuilder("[");
        for (int i = 0; i < salesData.size(); i++) {
            Map<String, Object> row = salesData.get(i);
            String day = String.valueOf(row.get("day"));
            // Shorten to Mon/Tue style: just keep last part
            labels.append("\"").append(day).append("\"");
            revenues.append(row.get("revenue"));
            counts.append(row.get("orderCount"));
            if (i < salesData.size() - 1) {
                labels.append(",");
                revenues.append(",");
                counts.append(",");
            }
        }
        labels.append("]");
        revenues.append("]");
        counts.append("]");

        request.setAttribute("salesDatesJson", labels.toString());
        request.setAttribute("salesRevenuesJson", revenues.toString());
        request.setAttribute("salesCountsJson", counts.toString());

        request.getRequestDispatcher("/pages/admin_dashboard.jsp").forward(request, response);
    }
}
