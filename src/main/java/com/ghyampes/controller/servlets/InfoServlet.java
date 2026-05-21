package com.ghyampes.controller.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/OrderStatusServlet", "/ReturnsServlet", "/SizeGuideServlet", "/CareersServlet", "/PrivacyServlet", "/TermsServlet"})
public class InfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        String jspPage = "/pages/index.jsp"; // default fallback

        if (path.contains("OrderStatusServlet")) {
            jspPage = "/pages/order_status.jsp";
        } else if (path.contains("ReturnsServlet")) {
            jspPage = "/pages/returns.jsp";
        } else if (path.contains("SizeGuideServlet")) {
            jspPage = "/pages/size_guide.jsp";
        } else if (path.contains("CareersServlet")) {
            jspPage = "/pages/careers.jsp";
        } else if (path.contains("PrivacyServlet")) {
            jspPage = "/pages/privacy.jsp";
        } else if (path.contains("TermsServlet")) {
            jspPage = "/pages/terms.jsp";
        }

        request.getRequestDispatcher(jspPage).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.contains("OrderStatusServlet")) {
            String orderId = request.getParameter("orderId");
            if (orderId != null && !orderId.trim().isEmpty()) {
                // Mock responses for order tracking
                String statusMsg;
                double progress;
                int idHash = Math.abs(orderId.hashCode() % 4);
                
                switch (idHash) {
                    case 0:
                        statusMsg = "Your order #" + orderId + " is currently being packed at our Lakeside warehouse. Delivery expected in 1-2 days.";
                        progress = 35.0;
                        break;
                    case 1:
                        statusMsg = "Your order #" + orderId + " has been handed over to the courier partner and is on its way to your destination in Pokhara. Delivery today!";
                        progress = 75.0;
                        break;
                    case 2:
                        statusMsg = "Congratulations! Your order #" + orderId + " has been successfully delivered and signed for. Thank you for shopping with us!";
                        progress = 100.0;
                        break;
                    default:
                        statusMsg = "Your order #" + orderId + " is confirmed and awaiting seller verification.";
                        progress = 10.0;
                        break;
                }
                
                request.setAttribute("orderId", orderId);
                request.setAttribute("statusMsg", statusMsg);
                request.setAttribute("progress", progress);
            } else {
                request.setAttribute("errorMsg", "Please enter a valid Order ID.");
            }
            request.getRequestDispatcher("/pages/order_status.jsp").forward(request, response);
        } else {
            doGet(request, response);
        }
    }
}
