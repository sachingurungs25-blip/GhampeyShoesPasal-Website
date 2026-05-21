package com.ghyampes.controller.servlets;

import com.ghyampes.dao.OrderDAO;
import com.ghyampes.dao.ShoeDAO;
import com.ghyampes.model.Order;
import com.ghyampes.model.Shoe;
import com.ghyampes.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"member".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        request.getRequestDispatcher("/pages/checkout.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"member".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        ShoeDAO shoeDAO = new ShoeDAO();
        Shoe shoe = shoeDAO.getShoeById(productId);

        if (shoe != null) {
            Order order = new Order();
            order.setMemberId(user.getId());
            order.setProductId(shoe.getId());
            order.setTotalPrice(shoe.getPrice());

            OrderDAO orderDAO = new OrderDAO();
            if (orderDAO.placeOrder(order)) {
                request.getSession().setAttribute("msg", "Order placed successfully! Bill generated.");
                response.sendRedirect("UserProfileServlet");
                return;
            }
        }
        request.getSession().setAttribute("error", "Checkout failed.");
        response.sendRedirect(request.getContextPath() + "/HomeServlet");
    }
}
